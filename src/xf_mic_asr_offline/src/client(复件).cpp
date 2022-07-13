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
//#include <xf_mic_asr_offline/qidong.h>
//#include <std_srvs/Trigger.h>
bool startflag = false;
using namespace std;

int awake_angle = -1;

void quanju(std_msgs::String msg)
{
   
    startflag=true;
    printf("话题接受成功，startflag为true");
}
void awake_angle_Callback(std_msgs::Int32 msg)
{
    awake_angle = msg.data;
}

int main(int argc, char *argv[])
{
    ros::init(argc, argv, "client_node");
    ros::NodeHandle nh;
    
ros::Publisher pub = nh.advertise<std_msgs::String>("/voiceAwake",10);
ros::Rate loop_rate(10);
 int count=0;  
std_msgs::String bool1;
ros::Subscriber subs=nh.subscribe("/startfl",10,quanju);
/*ros::ServiceClient voice_client = 
    nh.serviceClient<std_srvs::Trigger>("voiceAwake");
std_srvs::Trigger voic;
voic.request = "start";*/

ros::ServiceClient start = 
    nh.serviceClient<xf_mic_tts_offline::Play_TTS_srv>("xf_mic_tts_offline_node/play_txt_wav");

xf_mic_tts_offline::Play_TTS_srv startword;
startword.request.text="开始启动";

    /*离线命令词识别*/
    ros::ServiceClient get_offline_recognise_result_client = 
    nh.serviceClient<xf_mic_asr_offline::Get_Offline_Result_srv>("xf_asr_offline_node/get_offline_recognise_result_srv");
    /*设置主麦克风*/
    ros::ServiceClient Set_Major_Mic_client =
    nh.serviceClient<xf_mic_asr_offline::Set_Major_Mic_srv>("xf_asr_offline_node/set_major_mic_srv");
    /*获取主麦克风*/
    ros::ServiceClient Get_Major_Mic_client =
    nh.serviceClient<xf_mic_asr_offline::Get_Major_Mic_srv>("xf_asr_offline_node/get_major_mic_srv");
    /*修改唤醒词*/
    ros::ServiceClient Set_Awake_Word_client =
    nh.serviceClient<xf_mic_asr_offline::Set_Awake_Word_srv>("xf_asr_offline_node/set_awake_word_srv");
    /*订阅唤醒角度*/
    ros::Subscriber awake_angle_sub = nh.subscribe("/mic/awake/angle", 1, awake_angle_Callback);
    
    xf_mic_asr_offline::Get_Offline_Result_srv GetOfflineResult_srv;
    xf_mic_asr_offline::Set_Major_Mic_srv SetMajorMic_srv;
    xf_mic_asr_offline::Get_Major_Mic_srv GetMajorMic_srv;
    xf_mic_asr_offline::Set_Awake_Word_srv SetAwakeWord_srv;

    std::string word = "";
    int recognize_fail_count;
    int recognize_fail_count_threshold;
    int confidence_threshold;
    int time_per_order;

    //SetMajorMic_srv.request.mic_id = 2;
    //call set_major_mic_srv
    //if(Set_Major_Mic_client.call(SetMajorMic_srv))
    //{
        //ROS_INFO("succeed to call service \"set_major_mic_srv\"!");
        //std::cout << "result: " << SetMajorMic_srv.response.result << endl;
        //std::cout << "fail reason: " << SetMajorMic_srv.response.fail_reason << endl;
    //}
   // else
    //{
        //ROS_INFO("failed to call service \"set_major_mic_srv\"!");     
    //}
part2:
    sleep(2);
if(startflag==true)
{
    GetOfflineResult_srv.request.offline_recognise_start = 1;
    GetOfflineResult_srv.request.confidence_threshold = 20;
    GetOfflineResult_srv.request.time_per_order = 2;
    //call get_offline_recognise_result_srv
    if(get_offline_recognise_result_client.call(GetOfflineResult_srv))
    {ROS_INFO("succeed to call service \"get_offline_recognise_result_srv\"!");
        std::cout << "result: " << GetOfflineResult_srv.response.result << endl;
        std::cout << "fail reason: " << GetOfflineResult_srv.response.fail_reason << endl;
        std::cout << "text: " << GetOfflineResult_srv.response.text << endl;
        system("play -t raw -r 16k -e signed -b 16 -c 1 '/home/nie/mmic_ws/src/SR2.1.2-HR1.1.3/vvui_ros-master/xf_mic_asr_offline/audio/vvui_deno.pcm' -q --no-show-progress");
       if(GetOfflineResult_srv.response.text=="运行"||GetOfflineResult_srv.response.text=="冲"||GetOfflineResult_srv.response.text=="干"||GetOfflineResult_srv.response.text=="动"||GetOfflineResult_srv.response.text=="梁非凡"||GetOfflineResult_srv.response.text=="启动")
       {startword.request.text="开始启动";
start.call(startword);
 /*while(ros::ok())
 {*/
  
bool1.data="start";
  /*twist.linear.x = 0.0;   
  twist.linear.y = 0.0;
  twist.linear.z = 0.0;
 
  twist.angular.x = 0.0;
  twist.angular.y = 0.0;
  twist.angular.z = 0.1;*/
  
  //ROS_INFO("shuchu11");
  pub.publish(bool1);
    startflag = false;
/*goto part2;*/
  /*ros::spinOnce();
  loop_rate.sleep();
  ++count;
 }*/
}
else if(GetOfflineResult_srv.response.text=="停止"||GetOfflineResult_srv.response.text=="重新识别")
{startword.request.text="重启识别";
start.call(startword);
bool1.data=2;/*goto part2;*/}
else {pub.publish(bool1);goto part2;}
        
    }
    else
    {
        ROS_INFO("failed to call service \"get_offline_recognise_result_srv\"!");
        goto part2;
    }
  
}
goto part2;
    return 0;
}
