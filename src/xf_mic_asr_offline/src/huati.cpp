#include "ros/ros.h"
#include "std_msgs/String.h"

int main(int argc,char **argv)
{
 ros::init(argc,argv,"huati");
 ros::NodeHandle nh;
 ros::Publisher pub = nh.advertise<std_msgs::String>("/voiceAwake",10);
 ros::Rate loop_rate(5);
 int count=0;
 while(ros::ok())
 {

std_msgs::String bool1;
bool1.data="start";
pub.publish(bool1);
 /* geometry_msgs::Twist twist;
  twist.linear.x = 0.0;   
  twist.linear.y = 0.0;
  twist.linear.z = 0.0;
 
  twist.angular.x = 0.0;
  twist.angular.y = 0.0;
  twist.angular.z = 0.1;
  
  //ROS_INFO("shuchu11");
  pub.publish(twist);*/
  ros::spinOnce();
  loop_rate.sleep();
  ++count;
 }
 return 0;
}

