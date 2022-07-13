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

#include <geometry_msgs/Twist.h>

#include <xf_mic_tts_offline/Play_TTS_srv.h>
//#include <xf_mic_asr_offline/qidong.h>
//#include <std_srvs/Trigger.h>

using namespace std;
bool startflag = false;
void quanju(const std_msgs::String::ConstPtr& msg)
{
   ROS_INFO("1");
   startflag=true;
   ROS_INFO("2");
   ROS_INFO("3");
}
int main(int argc, char *argv[])
{   int i;
    
    ros::init(argc, argv, "client_node");
    ros::NodeHandle nh;

    ros::Rate loop_rate(10);
    std_msgs::String bool1;
std_msgs::String closeword;
ros::Publisher pubv = nh.advertise<geometry_msgs::Twist>("/cmd_vel",10);
    ros::Publisher pub = nh.advertise<std_msgs::String>("/voiceAwake",10);
    ros::Publisher pubclose = nh.advertise<std_msgs::String>("/close",10);
    ros::Subscriber subs = nh.subscribe("/startfl",10,quanju);
    ros::ServiceClient start = 
    nh.serviceClient<xf_mic_tts_offline::Play_TTS_srv>("xf_mic_tts_offline_node/play_txt_wav");
    ros::ServiceClient startluyin = 
    nh.serviceClient<xf_mic_tts_offline::Play_TTS_srv>("xf_mic_tts_offline_node/voiceopen");
    xf_mic_tts_offline::Play_TTS_srv startword;
    startword.request.text="开始启动";

    /*离线命令词识别*/
    ros::ServiceClient get_offline_recognise_result_client = 
    nh.serviceClient<xf_mic_asr_offline::Get_Offline_Result_srv>("xf_asr_offline_node/get_offline_recognise_result_srv");
    
    xf_mic_asr_offline::Get_Offline_Result_srv GetOfflineResult_srv;

    GetOfflineResult_srv.request.offline_recognise_start = 1;
    GetOfflineResult_srv.request.confidence_threshold = 20;
    GetOfflineResult_srv.request.time_per_order = 1;
    sleep(2);

part2:
while(1)  
{ros::spinOnce();
if(startflag==true)
{
    if(get_offline_recognise_result_client.call(GetOfflineResult_srv))
    {ROS_INFO("succeed to call service \"get_offline_recognise_result_srv\"!");
     std::cout << "text: " << GetOfflineResult_srv.response.text << endl;
     system("play -t raw -r 16k -e signed -b 16 -c 1 '/home/nie/mmic_ws/src/SR2.1.2-HR1.1.3/vvui_ros-master/xf_mic_asr_offline/audio/vvui_deno.pcm' -q --no-show-progress");
     if(GetOfflineResult_srv.response.text=="运行"||GetOfflineResult_srv.response.text=="冲"||GetOfflineResult_srv.response.text=="干"||GetOfflineResult_srv.response.text=="动"||      	GetOfflineResult_srv.response.text=="梁非凡"||GetOfflineResult_srv.response.text=="启动")
       {startword.request.text="开始启动";
        /*start.call(startword);*/
        startluyin.call(startword);
        bool1.data="start";
        closeword.data="close";
        for(i=0;i<50;i++)
        {
        pub.publish(bool1);

        loop_rate.sleep();
        }
pubclose.publish(closeword);
pubclose.publish(closeword);
goto part3;
        ros::shutdown();
       }

 else if(GetOfflineResult_srv.response.text=="脱困"||GetOfflineResult_srv.response.text=="困")
{
startword.request.text="开始脱困";
       /* start.call(startword);*/
startluyin.call(startword);
geometry_msgs::Twist twist;
  twist.linear.x = 0.5;   
  twist.linear.y = 0.0;
  twist.linear.z = 0.0;
 
  twist.angular.x = 0.0;
  twist.angular.y = 0.0;
  twist.angular.z = 0.0;
for(i=0;i<3;i++)
        {
        pubv.publish(twist);
        loop_rate.sleep();
        }
}

      else if(GetOfflineResult_srv.response.text=="停止"||GetOfflineResult_srv.response.text=="重新识别")
      {startword.request.text="重启识别";
       start.call(startword);
       bool1.data=2;/*goto part2;*/
       pub.publish(bool1);
      }
      else {/*pub.publish(bool1);*/}
    }
  else
    {
        ROS_INFO("failed to call service \"get_offline_recognise_result_srv\"!");
    }
   startflag = false;
}
}
/*goto part2;*/
part3:
return 0;
}
