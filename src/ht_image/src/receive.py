# coding:utf-8

import rospy
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2


def callback(data):
    global bridge
    cv_img = bridge.imgmsg_to_cv2(data, "bgr8")
    cv2.imshow("frame", cv_img)
    cv2.waitKey(1)


if __name__ == '__main__':
    rospy.init_node('img_process_node', anonymous=True)
    bridge = CvBridge()
    rospy.Subscriber('/ht_image_biaoding_view/ht_image_biaoding_raw', Image, callback)
    rospy.spin()
