#!/usr/bin/env python
#encoding=UTF-8
import rospy
from ht_msg.msg import Ht_d

def detect_publisher():
	# ROS节点初始化
    rospy.init_node('ht_detect_publisher', anonymous=True)

	# 创建一个Publisher，发布名为/person_info的topic，消息类型为learning_topic::Person，队列长度10
    ht_info_pub = rospy.Publisher('/ht_detect_info', Ht_d, queue_size=10)
    count = 0
	#设置循环的频率
    rate = rospy.Rate(2)
    ht_msg = Ht_d()
    while not rospy.is_shutdown():
        # 初始化learning_topic::Person类型的消息
        ht_msg.detect=True
        # 发布消息
        ht_info_pub.publish(ht_msg)
        rospy.loginfo("detect:[%s]",
                  ht_msg.detect)
        # 按照循环频率延时
        rate.sleep()
        count+=1
        if count>10:
            break
detect_publisher()
