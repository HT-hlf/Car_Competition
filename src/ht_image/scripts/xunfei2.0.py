import argparse

import torch.backends.cudnn as cudnn

from utils.datasets import *
from utils.utils import *

import cv2

import numpy as np
import rospy
from std_msgs.msg import Header
from sensor_msgs.msg import Image
from ht_msg.msg import Ht
from cv_bridge import CvBridge, CvBridgeError

import time

def detect(save_img=False):

    rospy.init_node('ht_publish_node', anonymous=True)  # 定义节点
    image_pub = rospy.Publisher('/ht_image_view/ht_image_raw', Image, queue_size=1)  # 定义话题
    info_pub = rospy.Publisher('/ht_num_info', Ht, queue_size=10)

    out='inference/output'
    # weights='weights/best.pt'
    weights = '/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/weights/xunfei_best.pt'
    view_img=False
    save_txt=False
    imgsz=1280
    save_txt=True
    conf_thres=0.4
    iou_thres=0.5
    classes=None

    #不可知参数
    agnostic_nms=False


    # Initialize
    device = torch_utils.select_device('')



    if os.path.exists(out):
        shutil.rmtree(out)  # delete output folder
    os.makedirs(out)  # make new output folder


    model = torch.load(weights, map_location=device)['model'].float()  # load to FP32
    model.to(device).eval()
    model.half()  # to FP16


    # Set Dataloader
    cudnn.benchmark = True  # set True to speed up constant image size inference
    dataset = LoadStreams('0', img_size=imgsz)


    # Get names and colors
    names = model.module.names if hasattr(model, 'module') else model.names
    # colors = [[random.randint(0, 255) for _ in range(3)] for _ in range(len(names))]
    colors = [[255,0,0],[0,255,0],[0,0,255]]

    half=True

    # Run inference
    t0 = time.time()
    img = torch.zeros((1, 3, imgsz, imgsz), device=device)  # init img
    _ = model(img.half() if half else img) if device.type != 'cpu' else None  # run once
    for path, img, im0s, vid_cap in dataset:
        img = torch.from_numpy(img).to(device)
        img = img.half() if half else img.float()  # uint8 to fp16/32
        img /= 255.0  # 0 - 255 to 0.0 - 1.0
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
            p, s, im0 = path[i], '%g: ' % i, im0s[i].copy()
            save_path = str(Path(out) / Path(p).name)
            s += '%gx%g ' % img.shape[2:]  # print string
            gn = torch.tensor(im0.shape)[[1, 0, 1, 0]]  #  normalization gain whwh
            # print(gn)
            if det is not None and len(det):
                # Rescale boxes from img_size to im0 size
                det[:, :4] = scale_coords(img.shape[2:], det[:, :4], im0.shape).round()

                # Print results
                for c in det[:, -1].unique():
                    n = (det[:, -1] == c).sum()  # detections per class
                    s += '%g %ss, ' % (n, names[int(c)])  # add to string


                # Write results
                ht_detection=[]
                for *xyxy, conf, cls in det:
                    if save_txt:  # Write to file

                        # print(torch.tensor(xyxy))
                        xywh = (xyxy2xywh(torch.tensor(xyxy).view(1, 4))).view(-1).tolist()  # normalized xywh
                        print(xywh)
                        cv2.circle(im0, (int(xywh[0]),int(xywh[1])),1,(255,0,0),4)

                        # with open(save_path[:save_path.rfind('.')] + '.txt', 'a') as file:
                        #     file.write(('%g ' * 5 + '\n') % (cls, *xywh))  # label format

                    # if save_img or view_img:  # Add bbox to image
                    if True:  # Add bbox to image
                        label = '%s %.2f' % (names[int(cls)], conf)
                        # print(xyxy)
                        # print(((int(xyxy[0]), int(xyxy[1])), (int(xyxy[2]), int(xyxy[3]))))
                        # print(xyxy2xywh(torch.tensor(xyxy).view(1, 4)))
                        # print((int(xyxy[0]), int(xyxy[1])), (int(xyxy[2]), int(xyxy[3])))
                        plot_one_box(xyxy, im0, label=label, color=colors[int(cls)], line_thickness=3)

            # Print time (inference + NMS)
            # print('%sDone. (%.3fs)' % (s, t2 - t1))

            #发布话题
            ros_frame = Image()
            header = Header(stamp=rospy.Time.now())
            header.frame_id = "Camera"
            ros_frame.header = header
            # ros_frame.width = 640
            # ros_frame.height = 480
            ros_frame.width = 1920
            ros_frame.height = 1080
            ros_frame.encoding = "bgr8"
            ros_frame.step = 1920
            ros_frame.data = np.array(im0).tostring()  # 图片格式转换
            image_pub.publish(ros_frame)  # 发布消息

            # 初始化learning_topic::Person类型的消息
            ht_msg = Ht()
            ht_msg.glasses_people = 3;
            ht_msg.longhair_people = 3;
            # 发布消息
            info_pub.publish(ht_msg)
            # rospy.sleep(1)
            rospy.loginfo("Publsh person message[%s, %d]",
                          ht_msg.glasses_people, ht_msg.longhair_people)
            #不知道有什么用
            # end = time.time()
            # print("cost time:", end - start)  # 看一下每一帧的执行时间，从而确定合适的rate
            # rate = rospy.Rate(25)  # 10hz
            if rospy.is_shutdown():
                raise StopIteration

            # Stream results
            if view_img:
                cv2.imshow(p, im0)
                if cv2.waitKey(1) == ord('q'):  # q to quit
                    raise StopIteration


def ht_detect():
    with torch.no_grad():
        detect()

ht_detect()