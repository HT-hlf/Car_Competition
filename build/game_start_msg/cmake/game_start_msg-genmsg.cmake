# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "game_start_msg: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(game_start_msg_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/game_start_msg/srv/Play_TTS_srv.srv" NAME_WE)
add_custom_target(_game_start_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "game_start_msg" "/home/ucar/ROS_xunfei/ucar_ws/src/game_start_msg/srv/Play_TTS_srv.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(game_start_msg
  "/home/ucar/ROS_xunfei/ucar_ws/src/game_start_msg/srv/Play_TTS_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/game_start_msg
)

### Generating Module File
_generate_module_cpp(game_start_msg
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/game_start_msg
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(game_start_msg_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(game_start_msg_generate_messages game_start_msg_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/game_start_msg/srv/Play_TTS_srv.srv" NAME_WE)
add_dependencies(game_start_msg_generate_messages_cpp _game_start_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(game_start_msg_gencpp)
add_dependencies(game_start_msg_gencpp game_start_msg_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS game_start_msg_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(game_start_msg
  "/home/ucar/ROS_xunfei/ucar_ws/src/game_start_msg/srv/Play_TTS_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/game_start_msg
)

### Generating Module File
_generate_module_eus(game_start_msg
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/game_start_msg
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(game_start_msg_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(game_start_msg_generate_messages game_start_msg_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/game_start_msg/srv/Play_TTS_srv.srv" NAME_WE)
add_dependencies(game_start_msg_generate_messages_eus _game_start_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(game_start_msg_geneus)
add_dependencies(game_start_msg_geneus game_start_msg_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS game_start_msg_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(game_start_msg
  "/home/ucar/ROS_xunfei/ucar_ws/src/game_start_msg/srv/Play_TTS_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/game_start_msg
)

### Generating Module File
_generate_module_lisp(game_start_msg
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/game_start_msg
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(game_start_msg_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(game_start_msg_generate_messages game_start_msg_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/game_start_msg/srv/Play_TTS_srv.srv" NAME_WE)
add_dependencies(game_start_msg_generate_messages_lisp _game_start_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(game_start_msg_genlisp)
add_dependencies(game_start_msg_genlisp game_start_msg_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS game_start_msg_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(game_start_msg
  "/home/ucar/ROS_xunfei/ucar_ws/src/game_start_msg/srv/Play_TTS_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/game_start_msg
)

### Generating Module File
_generate_module_nodejs(game_start_msg
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/game_start_msg
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(game_start_msg_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(game_start_msg_generate_messages game_start_msg_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/game_start_msg/srv/Play_TTS_srv.srv" NAME_WE)
add_dependencies(game_start_msg_generate_messages_nodejs _game_start_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(game_start_msg_gennodejs)
add_dependencies(game_start_msg_gennodejs game_start_msg_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS game_start_msg_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(game_start_msg
  "/home/ucar/ROS_xunfei/ucar_ws/src/game_start_msg/srv/Play_TTS_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/game_start_msg
)

### Generating Module File
_generate_module_py(game_start_msg
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/game_start_msg
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(game_start_msg_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(game_start_msg_generate_messages game_start_msg_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ucar/ROS_xunfei/ucar_ws/src/game_start_msg/srv/Play_TTS_srv.srv" NAME_WE)
add_dependencies(game_start_msg_generate_messages_py _game_start_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(game_start_msg_genpy)
add_dependencies(game_start_msg_genpy game_start_msg_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS game_start_msg_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/game_start_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/game_start_msg
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(game_start_msg_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/game_start_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/game_start_msg
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(game_start_msg_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/game_start_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/game_start_msg
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(game_start_msg_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/game_start_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/game_start_msg
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(game_start_msg_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/game_start_msg)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/game_start_msg\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/game_start_msg
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(game_start_msg_generate_messages_py std_msgs_generate_messages_py)
endif()
