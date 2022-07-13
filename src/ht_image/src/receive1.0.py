# coding:utf-8

import rospy
from ht_msg.msg import Ht_d


def listener():
    rospy.init_node('ht_receive')
    # rospy.sleep(2)
    data = rospy.wait_for_message("/ht_detect_info",Ht_d,timeout=None)
    print(data)


if __name__ == '__main__':
    listener()