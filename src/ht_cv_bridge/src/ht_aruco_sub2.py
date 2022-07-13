import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError


def listener():
    # rospy.init_node('ht_img_sub')
    # rospy.sleep(10)
    data = rospy.wait_for_message('/ht_image_biaoding_view/ht_image_biaoding_raw', Image, timeout=None)
    cv_img = bridge.imgmsg_to_cv2(data, "bgr8")
    # print(data)
    print(cv_img.shape)

if __name__ == '__main__':
    print(1)
    rospy.init_node('ht_img_sub')
    print(2)
    bridge = CvBridge()
    print(3)
    for i in range(3):

        listener()