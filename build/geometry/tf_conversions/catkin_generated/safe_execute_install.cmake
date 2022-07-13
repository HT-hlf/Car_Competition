execute_process(COMMAND "/home/ucar/ROS_xunfei/ucar_ws/build/geometry/tf_conversions/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/ucar/ROS_xunfei/ucar_ws/build/geometry/tf_conversions/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
