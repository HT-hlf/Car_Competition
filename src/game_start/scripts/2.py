#!/usr/bin/env python
#encoding=UTF-8
import rospy
from move_base_msgs.msg import *
import threading
import math
import numpy

import cv2
import cv2.aruco as aruco
import os
from smach import user_data

from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

current_x = 0
current_y = 0
dis_flag = True

def thread_dis():
    rospy.spin()

def listener():

    rospy.init_node('listen', anonymous=True)

    if not rospy.is_shutdown():
        pose = rospy.Subscriber("/move_base/feedback",MoveBaseActionFeedback,dis_cb,queue_size=1)
    
    add_thread = threading.Thread(target = thread_dis)
    add_thread.start()

def dis_cb(pose):
    global current_x
    global current_y
    global dis_flag

    current_x = pose.feedback.base_position.pose.position.x
    current_y = pose.feedback.base_position.pose.position.y
    # target_x = 2.328    #b区
    # target_y = -2.74

    # target_x = 1.464      #6区
    # target_y = -2.311
    target_x = -0.023      #c区
    target_y = -2.643
    distance = math.sqrt(((current_x - target_x)**2)+((current_y - target_y)**2))

    current_orientation = pose.feedback.base_position.pose.orientation
    x = current_orientation.x
    y = current_orientation.y
    z = current_orientation.z
    w = current_orientation.w

    roll = math.atan2(2 * (w * x + y * z), 1 - 2 * (x * x + y * y))
    roll = roll / math.pi * 180
    pitch = math.asin(2 * (w * y - z * x))
    pitch = pitch / math.pi * 180
    yaw = math.atan2(2 * (w * z + x * y), 1 - 2 * (y * y + z * z))
    yaw = yaw / math.pi * 180

    angle = yaw
    
    print distance, angle
    
    if distance <= 0.3 and (0 < angle < 90) and dis_flag:
        dis_flag = False
        for i in range(2):
            ht_save_image_6(i)
            # rospy.sleep(0.2)            
            print i
    
    return

def ht_save_image_6(i):
    # cap = cv2.VideoCapture(0)
        # start = time.time()
        # rospy.init_node('ht_save_image')
        # img = '/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img/x.jpg'
    data = rospy.wait_for_message('/ht_image_biaoding_view/ht_image_biaoding_raw', Image, timeout=None)
    bridge = CvBridge()
    frame = bridge.imgmsg_to_cv2(data, "bgr8")
        # cv2.rectangle(frame, (180, 160), (460, 320), (0, 255, 0), 2)
    cv2.imwrite('/home/ucar/ROS_xunfei/ucar_ws/src/game_start/scripts/x_6_{}.jpg'.format(i), frame)
    return True

if __name__ == '__main__':
    try:
        listener()
        # get_goal()
    except rospy.ROSInterruptException:
        pass