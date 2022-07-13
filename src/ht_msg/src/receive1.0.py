# coding:utf-8

import rospy
from sensor_msgs.msg import Image


def listener():
    rospy.init_node('ht_receive')
    # rospy.sleep(2)
    data = rospy.wait_for_message('/ht_image_biaoding_view/ht_image_biaoding_raw',Image,timeout=None)
    print(data.width)


if __name__ == '__main__':
    listener()