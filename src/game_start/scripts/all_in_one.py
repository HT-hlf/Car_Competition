#!/usr/bin/env python
#encoding=UTF-8
import cv2
import numpy as np
import cv2.aruco as aruco
import os
from smach import user_data

from xf_mic_tts_offline.srv import *

from std_msgs.msg import String
import rospy
import actionlib
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
import smach
import smach_ros
import threading

import xunfei_aruco_1 as ht
import xunfei_publish_detect as detect_flag
from ht_msg.msg import Ht

import xunfei_laser as ht_waypoints


voiceflag = False
longhair=glasses=0
# longhair =  0
# glasses = 0

def thread_job():
    rospy.spin()

def voicecallback(data):
    global voiceflag
    if data.data == "start":
        print('Start navigating!')
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
        add_thread = threading.Thread(target = thread_job)
        add_thread.start()
        rospy.Subscriber("voiceAwake",String, voicecallback)
        userdata.navpoints = -1
        rospy.sleep(2)

        if voiceflag:
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
            [[2.376, -2.834, 0.000],[0.000, 0.000, 0.994, 0.106]],
            [[1.014, -1.108, 0.000],[0.000, 0.000, 0.732, 0.681]],
            [[0.529, -1.109, 0.000],[0.000, 0.000, 0.749, 0.663]],            
            [[-0.074, -1.049, 0.000],[0.000, 0.000, 0.680, 0.733]]
            ]
        return waypoints[num]

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
            for pose in waypoints:                   
                goal = self.goal_pose(pose)
                self.client.send_goal(goal)
                self.client.wait_for_result()
                # rospy.sleep(1.5)
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
            [[-0.025, -2.65, 0.000],[0.000, 0.000, 0.70710678, 0.70710678]]
            ]
        return waypoints


class Navigate2Pic(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['navigating', 'arrived', 'end'],output_keys=['navpoints'])
        # self.waypoints = []
        self.client = actionlib.SimpleActionClient('move_base', MoveBaseAction) 
        self.client.wait_for_server()
    
    def execute(self, userdata):
        if rospy.is_shutdown():
            return 'end'
        else:
            aimlist=ht_waypoints.listener()
            # print (aimlist)
            # for points in aimlist:
            #     self.waypoints.append(points)
            # aim = self.waypoints() 
            for pose in aimlist:                   
                goal = self.goal_pose(pose)
                self.client.send_goal(goal)
                self.client.wait_for_result()
                # rospy.sleep(1.5)
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



    # def get_waypoints(self):
    #     waypoints = [
           
    #         ]
    #     return waypoints


def thread_detect_pub():
    detect_flag.detect_publisher()

class Aruco(smach.State):
    def __init__(self):
        smach.State.__init__(self,outcomes=['NAV2C','nav2D1','nav2D2','nav2D3','Aruco','end'],output_keys=['navpoints'])

    def execute(self, userdata):
        # count = 0
        # count = count+1

        add_thread = threading.Thread(target = thread_detect_pub)
        add_thread.start()

        client = rospy.ServiceProxy('xf_mic_tts_offline_node/voiceopen', Play_TTS_srv)
        code = ht.ht_aruco()
        if code == 0:
            userdata.navpoints = 0
            # return 'nav2D1'    
            client.call('蔬菜','xiaoyan')        
            return 'NAV2C'
        elif code == 1:
            userdata.navpoints = 1
            # return 'nav2D2'            
            client.call('水果','xiaoyan')
            return 'NAV2C'
        elif code == 2:
            userdata.navpoints = 2
                # return'nav2D3'            
            client.call('肉类','xiaoyan')
            return 'NAV2C'

        elif code == -1:
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
        get_data = rospy.wait_for_message("ht_num_info", Ht, timeout=None)
        glasses,longhair = get_data.glasses_people, get_data.longhair_people
        client = rospy.ServiceProxy('xf_mic_tts_offline_node/play_txt_wav', Play_TTS_srv)
        data = '长头发人数：'+str(longhair)+'人。'+'眼镜个数：'+str(glasses)+'副。'
        # data = str(data) 
        client.call('您的餐品已送达，请您取餐！','xiaoyan')
        client.call(data,'xiaoyan')
        #rospy.loginfo('语音已发送:', response.result)
        return 'end'
        

         
def thread_detect():
    os.system('python3 /home/ucar/ROS_xunfei/ucar_ws/src/ht_image/scripts/xunfei5.0.py')


def main():
    rospy.init_node('first_try')
    sm = smach.StateMachine(outcomes=['end'])

    add_thread = threading.Thread(target = thread_detect)
    add_thread.start()

    with sm:        
        smach.StateMachine.add('WAIT', Wait4Awake(),transitions={'navigating':'NAV', 'wait':'WAIT' })
        smach.StateMachine.add('NAV', Navigate(), transitions={'arrived':'ARUCO', 'navigating':'NAV','end':'VOISUCC'})
        smach.StateMachine.add('ARUCO', Aruco(), transitions={'NAV2C': 'NAV2C','nav2D1':'NAV', 'nav2D2':'NAV','nav2D3':'NAV','Aruco':'ARUCO','end':'end'})
        smach.StateMachine.add('VOISUCC',voiceSuccess(),transitions={'end':'end'})
        smach.StateMachine.add('NAV2C',Navigate2C(),transitions={'navigating':'NAV2C','arrived':'NAV2PIC','end':'end'})
        smach.StateMachine.add('NAV2PIC',Navigate2Pic(),transitions={'navigating':'NAV2PIC','arrived':'NAV','end':'end'})


        sis = smach_ros.IntrospectionServer('FIRST_TRY', sm, '/SM_ROOT')
        sis.start()
        
    outcome = sm.execute()

    rospy.spin()
    sis.stop()

if __name__ == "__main__":
    # g_targets = None
    # g_start = None
    main()