#encoding=UTF-8
import cv2
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import rospy



def ht_save_image():
    # cap = cv2.VideoCapture(0)
    rospy.init_node('ht_save_image')
    img = '/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img/x.jpg'
    data = rospy.wait_for_message('/ht_image_biaoding_view/ht_image_biaoding_raw', Image, timeout=None)
    bridge = CvBridge()
    frame = bridge.imgmsg_to_cv2(data, "bgr8")
    cv2.rectangle(frame, (180, 160), (460, 320), (0, 255, 0), 2)
    # cv2.imwrite(img, frame)


    cv2.waitKey(0)
    # cv2.destroyAllWindows()
    return True


