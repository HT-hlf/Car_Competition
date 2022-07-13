#encoding=UTF-8
import rospy
from ht_msg.msg import Ht

def velocity_publisher():
	# ROS节点初始化
    rospy.init_node('ht_num_publisher', anonymous=True)

	# 创建一个Publisher，发布名为/person_info的topic，消息类型为learning_topic::Person，队列长度10
    ht_info_pub = rospy.Publisher('/ht_num_info', Ht, queue_size=10)

	#设置循环的频率
    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        # 初始化learning_topic::Person类型的消息
        ht_msg = Ht()
        ht_msg.glasses_people=6;
        ht_msg.longhair_people=6;
        # 发布消息
        ht_info_pub.publish(ht_msg)
        rospy.loginfo("Publsh person message[%s, %d]",
                  ht_msg.glasses_people, ht_msg.longhair_people)

        # 按照循环频率延时
        rate.sleep()

if __name__ == '__main__':
    try:
        velocity_publisher()
    except rospy.ROSInterruptException:
        pass