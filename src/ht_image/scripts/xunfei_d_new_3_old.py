import argparse

import torch.backends.cudnn as cudnn

from utils.datasets import *
from utils.utils import *


import cv2

import rospy
from ht_msg.msg import Ht_n
from ht_msg.msg import Ht_d
import os
import time


# def del_file(detect_dect):xz
#     # pass
#     for i in os.listdir(detect_dect) :
#         if i !='a_ht.jpg':''''
#             image_path = os.path.join(detect_dect, i)
#             os.remove(image_path)
#     #print('ht')

def loadimg(img, img_size):
    cap = None
    path = None
    img0 = img
    img = letterbox(img0, new_shape=img_size)[0]
    img = img[:, :, ::-1].transpose(2, 0, 1)  # BGR to RGB, to 3x416x416
    img = np.ascontiguousarray(img)
    return path, img, img0, cap



def detect():

    # Set Dataloader
    cudnn.benchmark = True  # set True to speed up constant image size inference


    #检测结束标志
    end_sign = False



    # #防止发布全零数据
    # count_p = 0
    # count_p_sd = 1
    img = cv2.imread('/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img/a_ht.jpg')
    # loadimg(img, imgsz)
    dataset = loadimg(img, imgsz)

    img = dataset[1]

    # for path, img, im0s, vid_cap in dataset:
    img = torch.from_numpy(img).to(device)
    img = img.half()  # uint8 to fp16/32
    img /= 255.0  # 0 - 255 to 0.0 - 1.0
    # print(img.shape)
    if img.ndimension() == 3:
        img = img.unsqueeze(0)
    # print(1.3)
    # Inference
    # t1 = torch_utils.time_synchronized()
    # print('2')
    model(img, augment=False)[0]
    # time.sleep(0.5)
    # print('waiting people')
    print('reload model finish!')



    #第一次遍历文件夹
    while (True):
        img_dect_list = os.listdir(img_dect)
        img_num = len(img_dect_list)
        # publish_count = True
        # for file in img_dect_list:
        #     if file=='a_ht.jpg':
        #         continue
        #     image_path = os.path.join(img_dect, file)
        #     # img = cv2.imread(image_path)
        #
        #     img = cv2.imread(image_path)
        #     if img is None:
        #         print('waiting img save')
        #         publish_count = False
        #         break
        if img_num==5:
            print('end waiting people!')
            break
        img = cv2.imread('/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img/a_ht.jpg')
        dataset = loadimg(img, imgsz)

        img = dataset[1]

        # for path, img, im0s, vid_cap in dataset:
        img = torch.from_numpy(img).to(device)
        img = img.half()  # uint8 to fp16/32
        img /= 255.0  # 0 - 255 to 0.0 - 1.0
        # print(img.shape)
        if img.ndimension() == 3:
            img = img.unsqueeze(0)
        # print(1.3)
        # Inference
        # t1 = torch_utils.time_synchronized()
        # print('2')
        model(img, augment=False)[0]
        # time.sleep(0.5)
        # print('waiting people')


    while (not end_sign):
        # print('start detect people!')
        sum_g_p = 0
        sum_l_p = 0
        people_num = 0
        publish_count_1=True

        # boy_exist=False
        # girl_exist=False

        a_noexist = True
        b_noexist = True
        c_noexist = True
        d_noexist = True
        e_noexist = True
        f_noexist = True
        g_noexist = True
        h_noexist = True

        img_dect_list = os.listdir(img_dect)
        # img_num = len(img_dect_list)

        for file in img_dect_list:
            if file=='a_ht.jpg':
                continue
            if file=='a_end.jpg':
                end_sign = True
                break
            if file=='finish_save.jpg':
                continue
            image_path = os.path.join(img_dect, file)
            # img = cv2.imread(image_path)

            img = cv2.imread(image_path)
            if img is None:
                publish_count_1 = False
                break
            result_path_1 = os.path.join(detect_result_dect_1, file)
            # print('1')
            dataset = loadimg(img, imgsz)
            # print('2')

            # Get names and colors
            names = ['0', '1', '2','3', '4', '5','6', '7']
            colors = [[255, 0, 0], [0, 255, 0], [0, 0, 255], [255, 0, 255], [255, 255, 0], [0, 255, 255], [255, 255, 255], [0, 0, 0]]

            img = dataset[1]
            im0s = dataset[2]

            # for path, img, im0s, vid_cap in dataset:
            img = torch.from_numpy(img).to(device)
            img = img.half()  # uint8 to fp16/32
            img /= 255.0  # 0 - 255 to 0.0 - 1.0
            # print(img.shape)
            if img.ndimension() == 3:
                img = img.unsqueeze(0)
            # print(1.3)
            # Inference
            # t1 = torch_utils.time_synchronized()
            # print('2')
            pred = model(img, augment=False)[0]
            # print('3')
            # print(1.4)

            # Apply NMS
            # print('4')
            pred = non_max_suppression(pred, conf_thres, iou_thres, classes=classes, agnostic=agnostic_nms)
            # print('5')
            # t2 = torch_utils.time_synchronized()
            # print(2)

            # Process detections
            for i, det in enumerate(pred):  # detections per image
                # print('i',i )

                #这句话可以去掉
                # im0 = im0s.copy()

                # .......................ls..................................
                if det is not None and len(det):
                    # Rescale boxes from img_size to im0 size
                    det[:, :4] = scale_coords(img.shape[2:], det[:, :4], im0s.shape).round()

                    # Print results
                    for c in det[:, -1].unique():
                        # 多少个
                        n = (det[:, -1] == c).sum()  # detections per class
                        # print(n)
                        # s = '%g %ss, ' % (n, names[int(c)])  # add to string
                        # print(s)

                    # longhairhead shorthairhead glasses to glass_longhairhead glass_shorthairhead noglass_longhairhead noglass_shorthairhead
                    # Write results
                    # 第一次循环
                    for *xyxy, conf, cls in det:


                        if True:  # Write to file

                            # print(xyxy,conf,cls)
                            # print(torch.tensor(cls).tolist())
                            # print(torch.tensor(xyxy).tolist())
                            # ht_cls=torch.as_tensor(cls).tolist()
                            if torch.as_tensor(cls).tolist() == 0.0 and a_noexist:
                                sum_g_p += 1
                                # boy_exist=True
                                people_num += 1
                                a_noexist = False
                            elif torch.as_tensor(cls).tolist() == 1.0 and b_noexist:
                                # boy_exist = True
                                people_num += 1
                                b_noexist = False
                            elif torch.as_tensor(cls).tolist() == 2.0 and c_noexist:
                                sum_g_p += 1
                                # boy_exist = True
                                people_num += 1
                                c_noexist = False
                            elif torch.as_tensor(cls).tolist() == 3.0 and d_noexist:
                                # boy_exist = True
                                people_num += 1
                                d_noexist = False
                            elif torch.as_tensor(cls).tolist() == 4.0 and e_noexist:
                                sum_g_p += 1
                                sum_l_p += 1
                                # girl_exist = True
                                people_num += 1
                                e_noexist = False
                            elif torch.as_tensor(cls).tolist() == 5.0 and f_noexist:
                                sum_g_p += 1
                                sum_l_p += 1
                                # girl_exist = True
                                people_num += 1
                                f_noexist = False
                            elif torch.as_tensor(cls).tolist() == 6.0 and g_noexist:
                                sum_l_p += 1
                                # girl_exist = True
                                people_num += 1
                                g_noexist = False
                            elif torch.as_tensor(cls).tolist() == 7.0 and h_noexist:
                                sum_g_p += 1
                                sum_l_p += 1
                                # girl_exist = True
                                people_num += 1
                                h_noexist = False
                            else:
                                pass


                        if True:  # Add bbox to image
                            label = '%s %.2f' % (names[int(cls)], conf)
                            plot_one_box(xyxy, im0s, label=label, color=colors[int(cls)], line_thickness=3)
                            cv2.imwrite(result_path_1, im0s)


        #
        # if sum_g_p==0 and sum_l_p==0 and count_p<=count_p_sd:
        #     count_p+=1
        #     continue


        # if boy_exist and girl_exist:
        #     people_num = 2
        # elif boy_exist or girl_exist:
        #     people_num = 1
        # else:
        #     people_num = 0
        # print('6')
        if publish_count_1:
            ht_msg = Ht_n()
            ht_msg.glasses_people = sum_g_p;
            ht_msg.longhair_people = sum_l_p;
            ht_msg.sum_people = people_num;
            # while not rospy.is_shutdown():
            # 发布消息
            info_pub.publish(ht_msg)
            rospy.loginfo("Publsh person message[%d, %d, %d]",
                          ht_msg.glasses_people, ht_msg.longhair_people,ht_msg.sum_people)
        # # 按照循环频率延时
        # rate.sleep()
        # print('7')
        if rospy.is_shutdown():
            raise StopIteration
        # Stream results
        if False:
            cv2.imshow('ht', im0s)
            if cv2.waitKey(1) == ord('q'):  # q to quit
                raise StopIteration


if __name__ == '__main__':
    imgsz = 352
    # conf_thres = 0.4
    conf_thres = 0.85
    # iou_thres=0.5
    iou_thres = 0
    classes = None

    img_dect = '/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img'
    detect_result_dect_1 = '/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_result_1'

    #
    agnostic_nms = True

    # Initialize
    device = torch_utils.select_device('')

    # model = torch.load('/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/weights/best.pt', map_location=device)[
    #     'model'].float()  # load to FP32
    model = torch.load('/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/weights/best_last_2.pt', map_location=device)[
        'model'].float()  # load to FP32
    model.to(device).eval()
    model.half()  # to FP16
    # for i in range(5):
    #     img = torch.ones((1, 3, imgsz, imgsz), device=device)  # init img
    #     # _ = model(img.half())  # run once
    #     pred = model(img.half(), augment=False)[0]98

    # ROS
    rospy.init_node('ros_yolo')
    #
    # ht1 = message_filters.Subscriber("/ht_image_biaoding_view/ht_image_biaoding_raw", Image)
    # ht2 = message_filters.Subscriber('/ht_detect_info', Ht_d)
    # sync = message_filters.ApproximateTimeSynchronizer([ht1, ht2], 10, 1, allow_headerless=True)
    # sync.registerCallback(ht_multi_callback)
    # # spin() simply keeps python from exiting until this node is stopped
    # rospy.spin()
   # image_topic_1 = "/usb_cam/image_raw"
   #  rospy.Subscriber("/ht_image_biaoding_view/ht_image_biaoding_raw", Image, ht_image_callback, queue_size=1, buff_size=52428800)

    # rospy.Subscriber('/ht_detect_info', Ht_d, ht_d_callback, queue_size=1, buff_size=52428800)
    # image_pub = rospy.Publisher('/ht_image_view/ht_image_raw', Image, queue_size=1)  # 定义话题
    info_pub = rospy.Publisher('/ht_num_info', Ht_n, queue_size=1)
    #
    # # image_pub = rospy.Publisher('/ht_image_view/ht_image_raw', Image, queue_size=1)  # 定义话题
    # # info_pub = rospy.Publisher('/ht_num_info', Ht, queue_size=10)
    # # image_pub = rospy.Publisher('/yolo_result_out', Image, queue_size=1)
    # # # # rospy.init_node("yolo_result_out_node", anonymous=True)
    # #
    # rospy.spin()
    # del_file(img_dect)
    # del_file(detect_result_dect_1)
    print('load model finish!!!')
    ht_d = rospy.wait_for_message('/ht_detect_info', Ht_d, timeout=None)

    if ht_d.detect:
        print('start detect')
        with torch.no_grad():
            # print(1)
            detect()
