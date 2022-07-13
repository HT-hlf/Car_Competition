import torch.backends.cudnn as cudnn

from utils.datasets import *
from utils.utils import *

import cv2

import numpy as np
import rospy
from std_msgs.msg import Header
from sensor_msgs.msg import Image
from ht_msg.msg import Ht

class HT_DETECT:
    def __init__(self):
        rospy.init_node('ht_detect_publish_node', anonymous=True)  # 定义节点
        self.image_pub = rospy.Publisher('/ht_image_view/ht_image_raw', Image, queue_size=1)  # 定义话题
        self.info_pub = rospy.Publisher('/ht_num_info', Ht, queue_size=10)
        self.imgsz = 640
        self.conf_thres = 0.1
        self.iou_thres = 0.5

        ht_names = ['glass_longhairhead', 'glass_shorthairhead', 'noglass_longhairhead', 'noglass_shorthairhead']
        ht_colors = [[255, 0, 0], [0, 255, 0], [0, 0, 255], [255, 0, 255]]

        # 不可知参数
        # agnostic_nms = False

        # Initialize
        self.device = torch_utils.select_device('')

        self.model = torch.load('/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/weights/best.pt', map_location=self.device)['model'].float()  # load to FP32
        self.model.to(self.device).eval()
        self.model.half()  # to FP16



    def __call__(self):
        # Set Dataloader
        print(111)
        cudnn.benchmark = True  # set True to speed up constant image size inference
        self.dataset = LoadStreams('0', img_size=self.imgsz)

        # print(1)
        # Get names and colors
        self.names = ['longhairhead', 'shorthairhead', 'glasses']
        # print(names)
        # colors = [[random.randint(0, 255) for _ in range(3)] for _ in range(len(names))]
        self.colors = [[255, 0, 0], [0, 255, 0], [0, 0, 255]]
        # print(2)

        # Run inference
        img = torch.zeros((1, 3, self.imgsz, self.imgsz), device=self.device)  # init img
        _ = self.model(img.half())  # run once
        # print(3)
        for path, img, im0s, vid_cap in self.dataset:
            max_g_p =0
            max_l_p =0
            # print(4)
            img = torch.from_numpy(img).to(self.device)
            img = img.half()  # uint8 to fp16/32
            img /= 255.0  # 0 - 255 to 0.0 - 1.0
            if img.ndimension() == 3:
                img = img.unsqueeze(0)
            # print(5)
            # Inference
            # t1 = torch_utils.time_synchronized()
            pred = self.model(img, augment=False)[0]
            # print(6)
            # Apply NMS
            pred = non_max_suppression(pred, self.conf_thres, self.iou_thres,None, agnostic=False)
            t2 = torch_utils.time_synchronized()
            # print(7)
            # Process detections
            for i, det in enumerate(pred):  # detections per image
                g_l = 0
                g_s = 0
                ng_l = 0
                ng_s = 0
                p, im0 = path[i], im0s[i].copy()
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
                            label = '%s %.2f' % (self.names[int(cls)], conf)
                            plot_one_box(xyxy, im0, label=label, color=self.colors[int(cls)], line_thickness=3)
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
                            if len(ht_glass)==0:
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
                            if len(ht_glass)==0:
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
                g_p=g_l + g_s
                l_p=g_l + ng_l
                if g_p>max_g_p:
                    max_g_p=g_p
                if l_p>max_l_p:
                    max_l_p=l_p

                print('glass_people:{} longhair_people:{}'.format(max_g_p, max_l_p))
                # noglass_shorthairhead')

                # Print time (inference + NMS)
                # print('%sDone. (%.3fs)' % (s, t2 - t1))

                # Stream results
                # 发布话题
                ros_frame = Image()
                header = Header(stamp=rospy.Time.now())
                header.frame_id = "Camera"
                ros_frame.header = header
                # ros_frame.width = 640
                # ros_frame.height = 480
                # ros_frame.width = 1920
                # ros_frame.height = 1080
                ros_frame.encoding = "bgr8"
                ros_frame.step = 1920
                ros_frame.data = np.array(im0).tostring()  # 图片格式转换
                self.image_pub.publish(ros_frame)  # 发布消息

                # 初始化learning_topic::Person类型的消息
                ht_msg = Ht()
                ht_msg.glasses_people = max_g_p;
                ht_msg.longhair_people = max_l_p;
                # 发布消息
                self.info_pub.publish(ht_msg)
                rospy.loginfo("Publsh person message[%s, %d]",
                              ht_msg.glasses_people, ht_msg.longhair_people)
                if rospy.is_shutdown():
                    raise StopIteration
                if False:
                    cv2.imshow(p, im0)
                    if cv2.waitKey(1) == ord('q'):  # q to quit
                        raise StopIteration

# p = HT_DETECT()
# print(p())
