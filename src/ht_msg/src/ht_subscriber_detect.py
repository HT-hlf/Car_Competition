#encoidng=UTF-8
import rospy
from ht_msg.msg import Ht_d

def detectInfoCallback(msg):
    rospy.loginfo("Subcribe ht_detect Info: detect:%s",
			 msg.detect)
    count=0
    while True:
        count+=1
        print(count)

def detect_subscriber():
	# ROS节点初始化
    rospy.init_node('ht_detect_publisher', anonymous=True)

	# 创建一个Subscriber，订阅名为/person_info的topic，注册回调函数personInfoCallback
    rospy.Subscriber("/ht_detect_info", Ht_d, detectInfoCallback)

	# 循环等待回调函数
    rospy.spin()

if __name__ == '__main__':
    detect_subscriber()
