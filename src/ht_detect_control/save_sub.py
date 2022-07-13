#encoding=UTF-8
import time
import cv2
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import rospy


def ht_save_image(i):
    # cap = cv2.VideoCapture(0)
    start = time.time()
    rospy.init_node('ht_save_image')
    # img = '/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img/x.jpg'
    data = rospy.wait_for_message('/ht_image_biaoding_view/ht_image_biaoding_raw', Image, timeout=None)
    bridge = CvBridge()
    frame = bridge.imgmsg_to_cv2(data, "bgr8")
    # cropped = img[0:128, 0:512]  # 裁剪坐标为[y0:y1, x0:x1]
    frame=frame[0:640,640:1280]
    # cv2.rectangle(frame, (640, 0), (1280, 640), (0, 255, 0), 2)
    cv2.imwrite('/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img/x_{}.jpg'.format(i), frame)


    # cv2.waitKey(0)
    # cv2.destroyAllWindows()
    return True
start = time.time()
ht_save_image(12)
end = time.time()
print(end - start)
