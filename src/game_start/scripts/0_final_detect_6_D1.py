#!/usr/bin/env python
#encoding=UTF-8
import cv2
import numpy as np
import cv2.aruco as aruco
import os
from smach import user_data

from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

from xf_mic_tts_offline.srv import *


from geometry_msgs.msg import Twist
from std_msgs.msg import String
import math
import rospy
import actionlib
from move_base_msgs.msg import *
# from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
import smach
import smach_ros
import threading

# import xunfei_aruco_2 as ht
import xunfei_publish_detect as detect_flag
from ht_msg.msg import Ht_n
import shutil

import xunfei_laser as ht_waypoints

current_x = 0
current_y = 0
dis_flag = True
voiceflag = False
longhair=glasses=0
# longhair =  0
# glasses = 0

def del_file(detect_dect):
    # pass
    for i in os.listdir(detect_dect) :
        if i !='a_ht.jpg':
            image_path = os.path.join(detect_dect, i)
            os.remove(image_path)
    #print('ht')
# del_file('/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img')
# del_file('/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_result_1')



def ht_aruco():
    bridge = CvBridge()
    ht_aruco_list = []
    for i in range(1):
        data = rospy.wait_for_message('/ht_image_biaoding_view/ht_image_biaoding_raw', Image, timeout=None)
        frame = bridge.imgmsg_to_cv2(data, "bgr8")
        img_gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        aruco_dict = aruco.Dictionary_get(aruco.DICT_4X4_250)
        parameters = aruco.DetectorParameters_create()
        corners, ids, _ = aruco.detectMarkers(img_gray, aruco_dict,parameters=parameters)
        if ids is not None:
            for i in range(len(ids)):
                print('find aruco:', ids[i][0])
                ht_aruco_list.append(ids[i][0])
        if len(ht_aruco_list) != 0:
            ht_aruco_list_array = np.array(ht_aruco_list)
            ht_aruco_num = np.median(ht_aruco_list_array)
        else:
            ht_aruco_num = -1
    # out.release()
    print('final find aruco:{}'.format(int(ht_aruco_num)))
    return int(ht_aruco_num)


def thread_job():
    rospy.spin()

def voicecallback(data):
    global voiceflag
    if data.data == "start":
        # print('Start navigating!')
        rospy.sleep(1)
        voiceflag = True
        return voiceflag

    else:
        print('Waiting for voiceAwake......')
        rospy.sleep(1)
        voiceflag = False
        return voiceflag


    
class Wait4Awake(smach.State):
    #global voiceflag
    def __init__(self):
        smach.State.__init__(self, outcomes=['navigating', 'wait'],output_keys=['navpoints'])
    
    def execute(self, userdata):
        del_file('/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img')
        del_file('/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_result_1')
        del_file('/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img_ab')
        # ht_save_image_a()
        add_thread = threading.Thread(target = thread_job)
        add_thread.start()
        rospy.Subscriber("voiceAwake",String, voicecallback)
        # ht_save_image_a()
        userdata.navpoints = -1
        rospy.sleep(2)

        if voiceflag:
            ht_save_image_a()
            return 'navigating'
        else:
            return 'wait'




class Navigate(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['navigating', 'arrived', 'end'],input_keys=['navpoints'])

        self.client = actionlib.SimpleActionClient('move_base', MoveBaseAction) 
        self.client.wait_for_server()
    
    def execute(self, userdata):
        if rospy.is_shutdown():
            return 'end'
        else:
        
            waypoints = self.get_waypoints(userdata.navpoints+1) 
            goal = self.goal_pose(waypoints)
            self.client.send_goal(goal)
            self.listener()
            self.client.wait_for_result()
            # rospy.sleep(1.5)
            if (userdata.navpoints+1) == 0:
               return 'arrived'
            elif (userdata.navpoints+1) == 1:
                return 'end'
            elif (userdata.navpoints+1) ==2:
                return 'end'
            elif (userdata.navpoints+1) ==3:
                return 'end'
            
    
    def goal_pose(self, pose): 
        goal_pose = MoveBaseGoal()

        goal_pose.target_pose.header.frame_id = 'map'

        goal_pose.target_pose.pose.position.x = pose[0][0]
        goal_pose.target_pose.pose.position.y = pose[0][1]
        goal_pose.target_pose.pose.position.z = pose[0][2]
        
        goal_pose.target_pose.pose.orientation.x = pose[1][0]
        goal_pose.target_pose.pose.orientation.y = pose[1][1]
        goal_pose.target_pose.pose.orientation.z = pose[1][2]
        goal_pose.target_pose.pose.orientation.w = pose[1][3]

        return goal_pose
    
    def get_waypoints(self,num):
        waypoints = [
            # [[2.328, -2.802, 0.000],[0.000, 0.000, 0.976, 0.219]],
            [[2.328, -2.74, 0.000],[0.000, 0.000, 0.996, 0.094]],           #B区目标点
            # [[1.014, -1.108, 0.000],[0.000, 0.000, 0.732, 0.681]],  #1.014, -1.108
            # [[0.529, -1.109, 0.000],[0.000, 0.000, 0.749, 0.663]],     #0.529, -1.109       
            # [[-0.074, -1.049, 0.000],[0.000, 0.000, 0.680, 0.733]]  #-0.074, -1.049
            [[0.925, -1.139, 0.000],[0.000, 0.000, 0.732, 0.681]],        #D1
            [[0.475, -1.139, 0.000],[0.000, 0.000, 0.749, 0.663]],         #D2
            [[-0.025, -1.139, 0.000],[0.000, 0.000, 0.680, 0.733]]        #D3
            
            ]
        return waypoints[num]


    def listener(self):
        add_thread = threading.Thread(target = thread_dis)
        add_thread.start()
        # rospy.init_node('listen', anonymous=True)

        if not rospy.is_shutdown():
            pose = rospy.Subscriber("/move_base/feedback",MoveBaseActionFeedback,dis_cb,queue_size=1)
        
def thread_dis():
        rospy.spin()

def dis_cb(pose):
    global current_x
    global current_y
    global dis_flag

    current_x = pose.feedback.base_position.pose.position.x
    current_y = pose.feedback.base_position.pose.position.y
    # target_x = 2.328    #b区
    # target_y = -2.74

    target_x = 1.464      #6区
    target_y = -2.311
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
    
    # print distance, angle
    
    if distance <= 0.8 and (-100 < angle < 0) and dis_flag:
        dis_flag = False
        for i in range(3):
            ht_save_image_6(i)
            # rospy.sleep(0.2)            
            print i
    
        add_thread = threading.Thread(target = thread_detect_pub)
        add_thread.start()
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
    # cv2.imwrite('/home/ucar/ROS_xunfei/ucar_ws/src/game_start/scripts/x_6_{}.jpg'.format(i), frame)
    cv2.imwrite('/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img_ab/x_b_{}.jpg'.format(i), frame)
    return True



class Navigate2C(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['navigating', 'arrived', 'end'],output_keys=['navpoints'])

        self.client = actionlib.SimpleActionClient('move_base', MoveBaseAction) 
        self.client.wait_for_server()
    
    def execute(self, userdata):
        if rospy.is_shutdown():
            return 'end'
        else:
            waypoints = self.get_waypoints() 
            for i in range(len(waypoints)):                   
                goal = self.goal_pose(waypoints[i])
                self.client.send_goal(goal)
                self.client.wait_for_result()
                rospy.sleep(0.2)
                ht_save_image_c_0()
                # ht_save_image_c(i)
                velocity_publisher()
                rospy.sleep(0.8)
                ht_save_image_c_1()
            return 'arrived'

    def goal_pose(self,pose):
        goal_pose = MoveBaseGoal()
        goal_pose.target_pose.header.frame_id = 'map'
        goal_pose.target_pose.pose.position.x = pose[0][0]
        goal_pose.target_pose.pose.position.y = pose[0][1]
        goal_pose.target_pose.pose.position.z = pose[0][2]
        goal_pose.target_pose.pose.orientation.x = pose[1][0]
        goal_pose.target_pose.pose.orientation.y = pose[1][1]
        goal_pose.target_pose.pose.orientation.z = pose[1][2]
        goal_pose.target_pose.pose.orientation.w = pose[1][3]

        return goal_pose


    def get_waypoints(self):
        waypoints = [
            # [[-0.025, -2.65, 0.000],[0.000, 0.000, 0.70710678, 0.70710678]]
            [[-0.023, -2.643, 0.000],[0.000, 0.000,  0.195, 0.981]]            #C区目标点1
            # [[-0.073, -2.643, 0.000],[0.000, 0.000, 0.252, 0.968]] 
            # [[-0.075, -2.433, 0.000],[0.000, 0.000, 0.70710678, 0.70710678]]
            ]
        return waypoints

def velocity_publisher():
	# ROS节点初始化
    # rospy.init_node('velocity_publisher', anonymous=True)
 
	# 创建一个Publisher，发布名为/turtle1/cmd_vel的topic，消息类型为geometry_msgs::Twist，队列长度10
    turtle_vel_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
 
	#设置循环的频率
    rate = rospy.Rate(10) 

    for i in range(6):
        vel_msg = Twist()
            # vel_msg.linear.x = 0.5
        vel_msg.angular.z = 10
 
		# 发布消息
        turtle_vel_pub.publish(vel_msg)
        rate.sleep()



def ht_save_image_c_0():
    # cap = cv2.VideoCapture(0)
        # start = time.time()
        # rospy.init_node('ht_save_image')
        # img = '/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img/x.jpg'
    data = rospy.wait_for_message('/ht_image_biaoding_view/ht_image_biaoding_raw', Image, timeout=None)
    bridge = CvBridge()
    frame = bridge.imgmsg_to_cv2(data, "bgr8")
        # cv2.rectangle(frame, (180, 160), (460, 320), (0, 255, 0), 2)
    cv2.imwrite('/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img/x_c_0.jpg', frame)
    return True

def ht_save_image_c_1():
    # cap = cv2.VideoCapture(0)
        # start = time.time()
        # rospy.init_node('ht_save_image')
        # img = '/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img/x.jpg'
    data = rospy.wait_for_message('/ht_image_biaoding_view/ht_image_biaoding_raw', Image, timeout=None)
    bridge = CvBridge()
    frame = bridge.imgmsg_to_cv2(data, "bgr8")
        # cv2.rectangle(frame, (180, 160), (460, 320), (0, 255, 0), 2)
    cv2.imwrite('/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img/x_c_1.jpg', frame)
    img = np.zeros((4,4), dtype=np.uint8)
    bgr_img = cv2.cvtColor(img, cv2.COLOR_GRAY2BGR)
    cv2.imwrite('/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img/finish_save.jpg', bgr_img)
    return True


def ht_save_image_a():
    # cap = cv2.VideoCapture(0)
        # start = time.time()
        # rospy.init_node('ht_save_image')
        # img = '/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img/x.jpg'
        data = rospy.wait_for_message('/ht_image_biaoding_view/ht_image_biaoding_raw', Image, timeout=None)
        bridge = CvBridge()
        frame = bridge.imgmsg_to_cv2(data, "bgr8")
        # frame = frame[540:800, 1020:1280]


        frame = frame[494:846, 974:1326]
        # cv2.rectangle(frame, (180, 160), (460, 320), (0, 255, 0), 2)
        cv2.imwrite('/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img_ab/x_a.jpg', frame)


        # cv2.waitKey(0)
        # cv2.destroyAllWindows()
        return True

        
def ht_save_image_b():
    # cap = cv2.VideoCapture(0)
        # start = time.time()
        # rospy.init_node('ht_save_image')
        # img = '/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img/x.jpg'
        data = rospy.wait_for_message('/ht_image_biaoding_view/ht_image_biaoding_raw', Image, timeout=None)
        bridge = CvBridge()
        frame = bridge.imgmsg_to_cv2(data, "bgr8")
        # cv2.rectangle(frame, (180, 160), (460, 320), (0, 255, 0), 2)
        cv2.imwrite('/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img/x_b.jpg', frame)


        # cv2.waitKey(0)
        # cv2.destroyAllWindows()
        return True




def thread_detect_pub():
    detect_flag.detect_publisher()

class Aruco(smach.State):
    def __init__(self):
        smach.State.__init__(self,outcomes=['NAV2C','nav2D1','nav2D2','nav2D3','Aruco','end'],output_keys=['navpoints'])

    def execute(self, userdata):
        # count = 0
        # count = count+1

        # add_thread = threading.Thread(target = thread_detect_pub)
        # add_thread.start()

        client = rospy.ServiceProxy('xf_mic_tts_offline_node/voiceopen', Play_TTS_srv)
        code = ht_aruco()
        if code == 0:
            userdata.navpoints = 0          #目标点D1  navpoints=0           D2  navpoints=1     D3  navpoints=2
            # return 'nav2D1'    
            client.call('蔬菜','xiaoyan')        
            return 'NAV2C'
        elif code == 1:
            userdata.navpoints = 0        #抽签后修改
            # return 'nav2D2'            
            client.call('水果','xiaoyan')
            return 'NAV2C'
        elif code == 2:
            userdata.navpoints = 0          #抽签后修改
                # return'nav2D3'            
            client.call('肉类','xiaoyan')
            return 'NAV2C'

        else:
        #     if count <10:
            return 'Aruco'
            # else:
            # return 'end'





# class detect(smach.State):
#     def __init__(self):
#         smach.State.__init__(self,outcomes=['success'])
        

#     def execute(self, userdata):
#         # detect_flag.detect_publisher()
#         rospy.Subscriber("ht_num_info",Ht, detectcallback)
#         return 'success'


def detectcallback(ht):
    global longhair, glasses
    glasses = ht.glasses_people
    longhair = ht.longhair_people
    print(glasses)
    print(longhair)
    # rospy.signal_shutdown('shut down')

class voiceSuccess(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['end'])
        global longhair
        global glasses

    def execute(self, userdata):
        #   rospy.init_node("voiceSuccess")
        
        # longhair = 1
        # glasses = 2
        get_data = rospy.wait_for_message("ht_num_info", Ht_n, timeout=None)
        n,glasses,longhair = get_data.sum_people,get_data.glasses_people, get_data.longhair_people
        client = rospy.ServiceProxy('xf_mic_tts_offline_node/play_txt_wav', Play_TTS_srv)
        data = '本次送餐任务途中遇到'+str(n)+'个人，其中长头发：'+str(longhair)+'人。'+'戴眼镜：'+str(glasses)+'人。'
        # data = str(data) 
        client.call(data,'xiaoyan')
        client.call('您的菜品已送达，请您取餐！','xiaoyan')
        
        shutil.copy('/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_control/a_end.jpg', '/home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_detect_img/a_end.jpg')
        return 'end'
        

         
def thread_detect():
    os.system('python3 /home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei_e_b_detect.py') #c区持续检测


def main():
    rospy.init_node('first_try')
    sm = smach.StateMachine(outcomes=['end'])

    add_thread = threading.Thread(target = thread_detect)
    add_thread.start()

    with sm:        
        smach.StateMachine.add('WAIT', Wait4Awake(),transitions={'navigating':'NAV', 'wait':'WAIT' })
        # smach.StateMachine.add('NAV27', Navigate27(), transitions={'arrived':'NAV', 'navigating':'NAV27','end':'NAV27'})
        smach.StateMachine.add('NAV', Navigate(), transitions={'arrived':'ARUCO', 'navigating':'NAV','end':'VOISUCC'})
        smach.StateMachine.add('ARUCO', Aruco(), transitions={'NAV2C': 'NAV2C','nav2D1':'NAV', 'nav2D2':'NAV','nav2D3':'NAV','Aruco':'ARUCO','end':'end'})
        smach.StateMachine.add('VOISUCC',voiceSuccess(),transitions={'end':'end'})
        smach.StateMachine.add('NAV2C',Navigate2C(),transitions={'navigating':'NAV2C','arrived':'NAV','end':'end'})
        # smach.StateMachine.add('NAV2PIC',Navigate2Pic(),transitions={'navigating':'NAV2PIC','arrived':'NAV','end':'end'})


        sis = smach_ros.IntrospectionServer('FIRST_TRY', sm, '/SM_ROOT')
        sis.start()
        
    outcome = sm.execute()

    rospy.spin()
    sis.stop()

if __name__ == "__main__":
    # g_targets = None
    # g_start = None
    main()