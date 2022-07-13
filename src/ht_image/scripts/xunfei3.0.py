from xunfei_detect_cls import HT_DETECT
import rospy
from ht_msg.msg import Ht_d

def detectInfoCallback(msg):
    global ht_detect
    rospy.loginfo("Subcribe ht_detect Info: detect:%s",
			 msg.detect)
    ht_detect()

# ht_detect()
# ROS节点初始化
ht_detect=HT_DETECT()
print('load successfully!')
# rospy.init_node('ht_detect', anonymous=True)
# 创建一个Subscriber，订阅名为/person_info的topic，注册回调函数personInfoCallback
rospy.Subscriber("/ht_detect_info", Ht_d, detectInfoCallback)

# 循环等待回调函数
rospy.spin()