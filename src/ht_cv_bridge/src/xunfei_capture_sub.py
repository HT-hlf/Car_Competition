#encoding=UTF-8

import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2
import numpy as np


output='ht_capture1920.mp4'

# def listener():
#     # rospy.init_node('ht_img_sub')
#     # rospy.sleep(10)
#     data = rospy.wait_for_message('/ht_image_biaoding_view/ht_image_biaoding_raw', Image, timeout=None)
#     cv_img = bridge.imgmsg_to_cv2(data, "bgr8")
#     # print(data)
#     print(cv_img.shape)
#     return cv_img


# global bridge
rospy.init_node('ht_capture_sub')
bridge = CvBridge()
fourcc = cv2.VideoWriter_fourcc(*'mp4v')  # 视频编解码器
fps = 2  # 帧数
width, height = 1920, 1080  # 宽高
#width, height = 640, 480  # 宽高
out = cv2.VideoWriter(output, fourcc, fps, (width, height))  # 写入视频
i=0
while True:
    print(i)
    i+=1
    # frame=listener()
    data = rospy.wait_for_message('/ht_image_biaoding_view/ht_image_biaoding_raw', Image, timeout=None)
    frame = bridge.imgmsg_to_cv2(data, "bgr8")
    out.write(frame)  # 写入帧
    if rospy.is_shutdown():
        out.release()
        raise StopIteration
# ht_aruco()
