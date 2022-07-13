#encoidng=UTF-8
import rospy
from ht_msg.msg import Ht

def personInfoCallback(msg):
    rospy.loginfo("Subcribe ht_num Info: glasses_people:%d  longhair_people:%d",
			 msg.glasses_people, msg.longhair_people)

def person_subscriber():
	# ROS节点初始化
    rospy.init_node('ht_num_subscriber', anonymous=True)

	# 创建一个Subscriber，订阅名为/person_info的topic，注册回调函数personInfoCallback
    rospy.Subscriber("/ht_num_info", Ht, personInfoCallback)

	# 循环等待回调函数
    rospy.spin()

if __name__ == '__main__':
    person_subscriber()
