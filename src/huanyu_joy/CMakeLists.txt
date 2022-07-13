cmake_minimum_required(VERSION 2.8.3)
project(huanyu_joy)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  nav_msgs
  roscpp
  roslib
  std_msgs
  tf
)

find_package(catkin REQUIRED COMPONENTS
        actionlib
        actionlib_msgs
        geometry_msgs
        message_generation
        nav_msgs
        nav_msgs
        roscpp
        serial
        roslib
        rospy
        sensor_msgs
        std_msgs
        tf
        )

# ulimit -c unlimited
# ssh firefly@192.168.1.76
add_compile_options(-g -std=c++11)    #-g -> core dumped

catkin_package(
        INCLUDE_DIRS include
        LIBRARIES huanyu_joy
        #  CATKIN_DEPENDS geometry_msgs message_generation nav_msgs nav_msgs roscpp roslib rospy sensor_msgs std_msgs tf
        DEPENDS system_lib
)

# defind robot status massage
# command atkin_make -DCATKIN_WHITELIST_PACKAGES="new_msg"
include_directories(include ${catkin_INCLUDE_DIRS} ${PCL_INCLUDE_DIRS})
include_directories(
        include
        include/${PROJECT_NAME}
)

add_executable(huanyu_joy_node src/huanyu_joy.cpp)
target_link_libraries(huanyu_joy_node ${catkin_LIBRARIES})