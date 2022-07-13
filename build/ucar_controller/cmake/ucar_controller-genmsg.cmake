# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ucar_controller: 0 messages, 6 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ucar_controller_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetMaxVel.srv" NAME_WE)
add_custom_target(_ucar_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ucar_controller" "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetMaxVel.srv" ""
)

get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetMaxVel.srv" NAME_WE)
add_custom_target(_ucar_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ucar_controller" "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetMaxVel.srv" ""
)

get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetSensorTF.srv" NAME_WE)
add_custom_target(_ucar_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ucar_controller" "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetSensorTF.srv" ""
)

get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetSensorTF.srv" NAME_WE)
add_custom_target(_ucar_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ucar_controller" "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetSensorTF.srv" ""
)

get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetBatteryInfo.srv" NAME_WE)
add_custom_target(_ucar_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ucar_controller" "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetBatteryInfo.srv" "std_msgs/Header:sensor_msgs/BatteryState"
)

get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetLEDMode.srv" NAME_WE)
add_custom_target(_ucar_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ucar_controller" "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetLEDMode.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetMaxVel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ucar_controller
)
_generate_srv_cpp(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetMaxVel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ucar_controller
)
_generate_srv_cpp(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetSensorTF.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ucar_controller
)
_generate_srv_cpp(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetSensorTF.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ucar_controller
)
_generate_srv_cpp(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetBatteryInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/BatteryState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ucar_controller
)
_generate_srv_cpp(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetLEDMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ucar_controller
)

### Generating Module File
_generate_module_cpp(ucar_controller
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ucar_controller
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ucar_controller_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ucar_controller_generate_messages ucar_controller_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetMaxVel.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_cpp _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetMaxVel.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_cpp _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetSensorTF.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_cpp _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetSensorTF.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_cpp _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetBatteryInfo.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_cpp _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetLEDMode.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_cpp _ucar_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ucar_controller_gencpp)
add_dependencies(ucar_controller_gencpp ucar_controller_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ucar_controller_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetMaxVel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ucar_controller
)
_generate_srv_eus(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetMaxVel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ucar_controller
)
_generate_srv_eus(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetSensorTF.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ucar_controller
)
_generate_srv_eus(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetSensorTF.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ucar_controller
)
_generate_srv_eus(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetBatteryInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/BatteryState.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ucar_controller
)
_generate_srv_eus(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetLEDMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ucar_controller
)

### Generating Module File
_generate_module_eus(ucar_controller
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ucar_controller
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ucar_controller_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ucar_controller_generate_messages ucar_controller_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetMaxVel.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_eus _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetMaxVel.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_eus _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetSensorTF.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_eus _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetSensorTF.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_eus _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetBatteryInfo.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_eus _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetLEDMode.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_eus _ucar_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ucar_controller_geneus)
add_dependencies(ucar_controller_geneus ucar_controller_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ucar_controller_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetMaxVel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ucar_controller
)
_generate_srv_lisp(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetMaxVel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ucar_controller
)
_generate_srv_lisp(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetSensorTF.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ucar_controller
)
_generate_srv_lisp(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetSensorTF.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ucar_controller
)
_generate_srv_lisp(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetBatteryInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/BatteryState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ucar_controller
)
_generate_srv_lisp(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetLEDMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ucar_controller
)

### Generating Module File
_generate_module_lisp(ucar_controller
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ucar_controller
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ucar_controller_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ucar_controller_generate_messages ucar_controller_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetMaxVel.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_lisp _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetMaxVel.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_lisp _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetSensorTF.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_lisp _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetSensorTF.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_lisp _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetBatteryInfo.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_lisp _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetLEDMode.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_lisp _ucar_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ucar_controller_genlisp)
add_dependencies(ucar_controller_genlisp ucar_controller_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ucar_controller_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetMaxVel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ucar_controller
)
_generate_srv_nodejs(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetMaxVel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ucar_controller
)
_generate_srv_nodejs(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetSensorTF.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ucar_controller
)
_generate_srv_nodejs(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetSensorTF.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ucar_controller
)
_generate_srv_nodejs(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetBatteryInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/BatteryState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ucar_controller
)
_generate_srv_nodejs(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetLEDMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ucar_controller
)

### Generating Module File
_generate_module_nodejs(ucar_controller
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ucar_controller
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ucar_controller_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ucar_controller_generate_messages ucar_controller_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetMaxVel.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_nodejs _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetMaxVel.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_nodejs _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetSensorTF.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_nodejs _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetSensorTF.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_nodejs _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetBatteryInfo.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_nodejs _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetLEDMode.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_nodejs _ucar_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ucar_controller_gennodejs)
add_dependencies(ucar_controller_gennodejs ucar_controller_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ucar_controller_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetMaxVel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ucar_controller
)
_generate_srv_py(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetMaxVel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ucar_controller
)
_generate_srv_py(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetSensorTF.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ucar_controller
)
_generate_srv_py(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetSensorTF.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ucar_controller
)
_generate_srv_py(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetBatteryInfo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/BatteryState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ucar_controller
)
_generate_srv_py(ucar_controller
  "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetLEDMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ucar_controller
)

### Generating Module File
_generate_module_py(ucar_controller
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ucar_controller
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ucar_controller_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ucar_controller_generate_messages ucar_controller_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetMaxVel.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_py _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetMaxVel.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_py _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetSensorTF.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_py _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetSensorTF.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_py _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/GetBatteryInfo.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_py _ucar_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/ucar_controller/srv/SetLEDMode.srv" NAME_WE)
add_dependencies(ucar_controller_generate_messages_py _ucar_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ucar_controller_genpy)
add_dependencies(ucar_controller_genpy ucar_controller_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ucar_controller_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ucar_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ucar_controller
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ucar_controller_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(ucar_controller_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(ucar_controller_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ucar_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ucar_controller
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ucar_controller_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(ucar_controller_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(ucar_controller_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ucar_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ucar_controller
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ucar_controller_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(ucar_controller_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(ucar_controller_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ucar_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ucar_controller
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ucar_controller_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(ucar_controller_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(ucar_controller_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ucar_controller)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ucar_controller\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ucar_controller
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ucar_controller_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(ucar_controller_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(ucar_controller_generate_messages_py geometry_msgs_generate_messages_py)
endif()
