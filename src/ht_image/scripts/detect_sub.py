import argparse

import torch.backends.cudnn as cudnn

from utils.datasets import *
from utils.utils import *

import cv2

import rospy
from sensor_msgs.msg import Image
from std_msgs.msg import Header
from cv_bridge import CvBridge, CvBridgeError
from ht_msg.msg import Ht

max_g_p = 0
max_l_p = 0


def loadimg(img,img_size):  # 接受opencv图片
    #img_size = 64
    cap=None
    path=None
    img0 = img
    img = letterbox(img0, new_shape=img_size)[0]
    img = img[:, :, ::-1].transpose(2, 0, 1)  # BGR to RGB, to 3x416x416
    img = np.ascontiguousarray(img)
    return path, img, img0, cap
def ht_image_callback(image):
    ros_image = np.frombuffer(image.data, dtype=np.uint8).reshape(image.height, image.width, -1)
    # ros_iamge = bridge.imgmsg_to_cv2(image, "bgr8")
    with torch.no_grad():
        detect(ros_image)
def detect(img):
    global max_g_p,max_l_p


    # Set Dataloader
    cudnn.benchmark = True  # set True to speed up constant image size inference
    # dataset = LoadStreams('0', img_size=imgsz)
    dataset=loadimg(img, imgsz)


    # Get names and colors
    names = ['longhairhead', 'shorthairhead', 'glasses']
    # print(names)
    # colors = [[random.randint(0, 255) for _ in range(3)] for _ in range(len(names))]
    colors = [[255,0,0],[0,255,0],[0,0,255]]



    # Run inference
    img = torch.zeros((1, 3, imgsz, imgsz), device=device)  # init img
    _ = model(img.half())   # run once
    path = dataset[0]
    img = dataset[1]
    im0s = dataset[2]

    # for path, img, im0s, vid_cap in dataset:
    img = torch.from_numpy(img).to(device)
    img = img.half()   # uint8 to fp16/32
    img /= 255.0  # 0 - 255 to 0.0 - 1.0
    # print(img.shape)
    if img.ndimension() == 3:
        img = img.unsqueeze(0)

    # Inference
    t1 = torch_utils.time_synchronized()
    pred = model(img, augment=False)[0]

    # Apply NMS
    pred = non_max_suppression(pred,conf_thres, iou_thres, classes=classes, agnostic=agnostic_nms)
    t2 = torch_utils.time_synchronized()


    # Process detections
    for i, det in enumerate(pred):  # detections per image
        g_l = 0
        g_s = 0
        ng_l = 0
        ng_s = 0
        im0 = im0s.copy()
        if det is not None and len(det):
            # Rescale boxes from img_size to im0 size
            det[:, :4] = scale_coords(img.shape[2:], det[:, :4], im0.shape).round()

            # Print results
            for c in det[:, -1].unique():
                # 多少个
                n = (det[:, -1] == c).sum()  # detections per class
                # print(n)
                # s = '%g %ss, ' % (n, names[int(c)])  # add to string
                # print(s)

            # longhairhead shorthairhead glasses to glass_longhairhead glass_shorthairhead noglass_longhairhead noglass_shorthairhead
            # Write results
            ht_glass = []
            # 第一次循环
            for *xyxy, conf, cls in det:
                if True:  # Write to file

                    # print(xyxy,conf,cls)
                    # print(torch.tensor(cls).tolist())
                    # print(torch.tensor(xyxy).tolist())
                    # ht_cls=torch.as_tensor(cls).tolist()
                    if torch.as_tensor(cls).tolist() == 2.0:
                        # print('glass')
                        # print(torch.tensor(conf).tolist())
                        xywh = (xyxy2xywh(torch.tensor(xyxy).view(1, 4))).view(-1).tolist()  # normalized xywh
                        # print(xywh)
                        ht_glass.append(xywh)
                        cv2.circle(im0, (int(xywh[0]), int(xywh[1])), 1, (255, 0, 0), 4)

                if True:  # Add bbox to image
                    label = '%s %.2f' % (names[int(cls)], conf)
                    plot_one_box(xyxy, im0, label=label, color=colors[int(cls)], line_thickness=3)
            # glass_longhairhead
            # glass_shorthairhead
            # noglass_longhairhead
            # noglass_shorthairhead
            # print(len(ht_glass))

            # 第二次循环
            for *xyxy, conf, cls in det:
                ht_cls = -1
                if torch.as_tensor(cls).tolist() == 0.0:
                    ht_cls = 2
                    if len(ht_glass) == 0:
                        ng_l += 1
                    else:
                        for i in range(len(ht_glass)):
                            if ht_glass_pb(torch.tensor(xyxy).tolist(), ht_glass[i]):
                                ht_cls = 0
                                g_l += 1
                                # print(ht_cls)
                            else:
                                ht_cls = 2
                                ng_l += 1
                                # print(ht_cls)
                elif torch.as_tensor(cls).tolist() == 1.0:
                    ht_cls = 3
                    if len(ht_glass) == 0:
                        ng_s += 1
                    else:
                        for i in range(len(ht_glass)):
                            if ht_glass_pb(torch.tensor(xyxy).tolist(), ht_glass[i]):
                                ht_cls = 1
                                g_s += 1
                                # print(ht_cls)
                            else:
                                ht_cls = 3
                                ng_s += 1
                                # print(ht_cls)
                else:
                    pass
                    # print('None')

                # if ht_cls!=-1:  # Add bbox to image
                #
                #     label = '%s %.2f' % (ht_names[int(ht_cls)], conf)
                #     ht_plot_one_box(xyxy, im0, label=label, color=ht_colors[int(ht_cls)], line_thickness=3)
        g_p = g_l + g_s
        l_p = g_l + ng_l
        if g_p > max_g_p:
            max_g_p = g_p
        if l_p > max_l_p:
            max_l_p = l_p

        print('glass_people:{} longhair_people:{}'.format(max_g_p, max_l_p))
            # noglass_shorthairhead')

        # Print time (inference + NMS)
        # print('%sDone. (%.3fs)' % (s, t2 - t1))

        # 发布话题
        ros_frame = Image()
        header = Header(stamp=rospy.Time.now())
        header.frame_id = "Camera"
        ros_frame.header = header
        ros_frame.width = 640
        ros_frame.height = 480
        # ros_frame.width = 1920
        # ros_frame.height = 1080
        ros_frame.encoding = "bgr8"
        ros_frame.step = 1920
        ros_frame.data = np.array(im0).tostring()  # 图片格式转换
        image_pub.publish(ros_frame)  # 发布消息

        # 初始化learning_topic::Person类型的消息
        ht_msg = Ht()
        ht_msg.glasses_people = max_g_p;
        ht_msg.longhair_people = max_l_p;
        # 发布消息
        info_pub.publish(ht_msg)
        rospy.loginfo("Publsh person message[%s, %d]",
                      ht_msg.glasses_people, ht_msg.longhair_people)
        if rospy.is_shutdown():
            raise StopIteration
        # Stream results
        if False:
            cv2.imshow(p, im0)
            if cv2.waitKey(1) == ord('q'):  # q to quit
                raise StopIteration




if __name__ == '__main__':
    imgsz = 640
    conf_thres = 0.4
    # iou_thres=0.5
    iou_thres = 0.1
    classes = None

    ht_names = ['glass_longhairhead', 'glass_shorthairhead', 'noglass_longhairhead', 'noglass_shorthairhead']
    ht_colors = [[255, 0, 0], [0, 255, 0], [0, 0, 255], [255, 0, 255]]

    # bridge = CvBridge()
    # 不可知参数
    agnostic_nms = False

    # Initialize
    device = torch_utils.select_device('')

    model = torch.load('weights/best.pt', map_location=device)['model'].float()  # load to FP32
    model.to(device).eval()
    model.half()  # to FP16

    #ROS
    rospy.init_node('ros_yolo')
    #image_topic_1 = "/usb_cam/image_raw"
    image_topic_1 = "/ht_image_biaoding_view/ht_image_biaoding_raw"
    rospy.Subscriber(image_topic_1, Image, ht_image_callback, queue_size=1, buff_size=52428800)
    image_pub = rospy.Publisher('/ht_image_view/ht_image_raw', Image, queue_size=1)  # 定义话题
    info_pub = rospy.Publisher('/ht_num_info', Ht, queue_size=10)
    # image_pub = rospy.Publisher('/yolo_result_out', Image, queue_size=1)
    # # rospy.init_node("yolo_result_out_node", anonymous=True)

    rospy.spin()