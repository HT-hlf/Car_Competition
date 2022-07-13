#encoding=UTF-8

import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2
import cv2.aruco as aruco
import numpy as np


output='ht_aruco.mp4'

# def listener():
#     # rospy.init_node('ht_img_sub')
#     # rospy.sleep(10)
#     data = rospy.wait_for_message('/ht_image_biaoding_view/ht_image_biaoding_raw', Image, timeout=None)
#     cv_img = bridge.imgmsg_to_cv2(data, "bgr8")
#     # print(data)
#     print(cv_img.shape)
#     return cv_img

def ht_aruco():
    # global bridge
    rospy.init_node('ht_img_sub')
    bridge = CvBridge()
    fourcc = cv2.VideoWriter_fourcc(*'mp4v')  # 视频编解码器
    fps = 5  # 帧数
    width, height = 640, 480  # 宽高
    out = cv2.VideoWriter(output, fourcc, fps, (width, height))  # 写入视频
    ht_aruco_list = []
    for i in range(10):
        # frame=listener()
        data = rospy.wait_for_message('/ht_image_biaoding_view/ht_image_biaoding_raw', Image, timeout=None)
        frame = bridge.imgmsg_to_cv2(data, "bgr8")
        # print(data)
        # print(cv_img.shape)
        # return cv_img
        img_gray = cv2.cvtColor(frame, cv2.COLOR_RGB2GRAY)
        # print(img.shape)
        aruco_dict = aruco.getPredefinedDictionary(aruco.DICT_4X4_100)
        corners, ids, _ = aruco.detectMarkers(img_gray, aruco_dict)
        aruco.drawDetectedMarkers(frame, corners, ids)
        if ids is not None:
            for i in range(len(ids)):
                print('find aruco:', ids[i][0])
                ht_aruco_list.append(ids[i][0])
                cv2.putText(frame, 'aruco:{}'.format(ids[i]), (20, 35 * (i + 2)), 0, 1, [0, 255, 0], thickness=2,
                            lineType=cv2.LINE_AA)
                # cv2.waitKey(0)
                # cv2.destroyAllWindows()
        else:
            pass
            cv2.putText(frame, 'no aruco'.format(0), (20, 70), 0, 1, [0, 0, 255], thickness=2, lineType=cv2.LINE_AA)
        # cv2.imshow('Detected AruCo markers', frame)
        out.write(frame)  # 写入帧
        if len(ht_aruco_list) != 0:
            ht_aruco_list_array = np.array(ht_aruco_list)
            ht_aruco_num = np.median(ht_aruco_list_array)
        else:
            ht_aruco_num = -1
    out.release()
    print('final find aruco:{}'.format(int(ht_aruco_num)))
    return int(ht_aruco_num)
