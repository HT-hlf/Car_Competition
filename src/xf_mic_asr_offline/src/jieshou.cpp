/*
 * client.cpp
 */
#include "user_interface.h"
#include <string>
#include <locale>
#include <codecvt>
#include <ctime>
#include <ros/ros.h>
#include <std_msgs/String.h>
#include <xf_mic_asr_offline/Get_Offline_Result_srv.h>
#include <xf_mic_asr_offline/Set_Major_Mic_srv.h>
#include <xf_mic_asr_offline/Set_Led_On_srv.h>
#include <xf_mic_asr_offline/Get_Major_Mic_srv.h>
#include <xf_mic_asr_offline/Pcm_Msg.h>
#include <xf_mic_asr_offline/Start_Record_srv.h>
#include <xf_mic_asr_offline/Set_Awake_Word_srv.h>
#include <xf_mic_asr_offline/Get_Awake_Angle_srv.h>

#include <std_msgs/Int8.h>
#include <std_msgs/Int32.h>
#include <sys/stat.h>
#include <iostream>

#include <xf_mic_tts_offline/Play_TTS_srv.h>
void quanju(const std_msgs::String::ConstPtr& msg)
{
   
    /*startflag=true;*/
/*ROS_INFO("1");*/
    printf("话题接受成功，startflag为true");
/*ROS_INFO("2");*/
}
int main(int argc, char *argv[])
{
    ros::init(argc, argv, "client_node");
    ros::NodeHandle nh;
    

ros::Subscriber subs=nh.subscribe("/startfl",10,quanju);
ros::spin();
return 0;}
