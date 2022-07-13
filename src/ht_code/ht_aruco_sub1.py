# coding:utf-8

import rospy
# import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
# import cv2

bridge = CvBridge()
def callback(data):
    global bridge
    cv_img = bridge.imgmsg_to_cv2(data, "bgr8")
    print(cv_img.shape)
    # cv2.imshow("frame", cv_img)
    # cv2.waitKey(1)


def ht_aruco():
    rospy.init_node('img_process_node', anonymous=True)
    rospy.Subscriber('/ht_image_biaoding_view/ht_image_biaoding_raw', Image, callback)
    rospy.spin()

ht_aruco()