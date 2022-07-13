#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rospy
from geometry_msgs.msg import Twist



def velocity_publisher():
	# ROS节点初始化
    rospy.init_node('velocity_publisher', anonymous=True)
 
	# 创建一个Publisher，发布名为/turtle1/cmd_vel的topic，消息类型为geometry_msgs::Twist，队列长度10
    turtle_vel_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
 
	#设置循环的频率
    rate = rospy.Rate(10) 

    for i in range(5):
        vel_msg = Twist()
            # vel_msg.linear.x = 0.5
        vel_msg.angular.z = -20
 
		# 发布消息
        turtle_vel_pub.publish(vel_msg)
        rate.sleep()


if __name__ == '__main__':
    try:
        velocity_publisher()
    except rospy.ROSInterruptException:
        pass