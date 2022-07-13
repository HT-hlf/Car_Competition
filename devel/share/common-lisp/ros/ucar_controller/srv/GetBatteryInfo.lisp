; Auto-generated. Do not edit!


(cl:in-package ucar_controller-srv)


;//! \htmlinclude GetBatteryInfo-request.msg.html

(cl:defclass <GetBatteryInfo-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetBatteryInfo-request (<GetBatteryInfo-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetBatteryInfo-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetBatteryInfo-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ucar_controller-srv:<GetBatteryInfo-request> is deprecated: use ucar_controller-srv:GetBatteryInfo-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetBatteryInfo-request>) ostream)
  "Serializes a message object of type '<GetBatteryInfo-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetBatteryInfo-request>) istream)
  "Deserializes a message object of type '<GetBatteryInfo-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetBatteryInfo-request>)))
  "Returns string type for a service object of type '<GetBatteryInfo-request>"
  "ucar_controller/GetBatteryInfoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetBatteryInfo-request)))
  "Returns string type for a service object of type 'GetBatteryInfo-request"
  "ucar_controller/GetBatteryInfoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetBatteryInfo-request>)))
  "Returns md5sum for a message object of type '<GetBatteryInfo-request>"
  "0f586d9a0cd4ac8575cd2b82e8d112d3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetBatteryInfo-request)))
  "Returns md5sum for a message object of type 'GetBatteryInfo-request"
  "0f586d9a0cd4ac8575cd2b82e8d112d3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetBatteryInfo-request>)))
  "Returns full string definition for message of type '<GetBatteryInfo-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetBatteryInfo-request)))
  "Returns full string definition for message of type 'GetBatteryInfo-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetBatteryInfo-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetBatteryInfo-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetBatteryInfo-request
))
;//! \htmlinclude GetBatteryInfo-response.msg.html

(cl:defclass <GetBatteryInfo-response> (roslisp-msg-protocol:ros-message)
  ((battery_state
    :reader battery_state
    :initarg :battery_state
    :type sensor_msgs-msg:BatteryState
    :initform (cl:make-instance 'sensor_msgs-msg:BatteryState)))
)

(cl:defclass GetBatteryInfo-response (<GetBatteryInfo-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetBatteryInfo-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetBatteryInfo-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ucar_controller-srv:<GetBatteryInfo-response> is deprecated: use ucar_controller-srv:GetBatteryInfo-response instead.")))

(cl:ensure-generic-function 'battery_state-val :lambda-list '(m))
(cl:defmethod battery_state-val ((m <GetBatteryInfo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:battery_state-val is deprecated.  Use ucar_controller-srv:battery_state instead.")
  (battery_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetBatteryInfo-response>) ostream)
  "Serializes a message object of type '<GetBatteryInfo-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'battery_state) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetBatteryInfo-response>) istream)
  "Deserializes a message object of type '<GetBatteryInfo-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'battery_state) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetBatteryInfo-response>)))
  "Returns string type for a service object of type '<GetBatteryInfo-response>"
  "ucar_controller/GetBatteryInfoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetBatteryInfo-response)))
  "Returns string type for a service object of type 'GetBatteryInfo-response"
  "ucar_controller/GetBatteryInfoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetBatteryInfo-response>)))
  "Returns md5sum for a message object of type '<GetBatteryInfo-response>"
  "0f586d9a0cd4ac8575cd2b82e8d112d3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetBatteryInfo-response)))
  "Returns md5sum for a message object of type 'GetBatteryInfo-response"
  "0f586d9a0cd4ac8575cd2b82e8d112d3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetBatteryInfo-response>)))
  "Returns full string definition for message of type '<GetBatteryInfo-response>"
  (cl:format cl:nil "sensor_msgs/BatteryState battery_state~%~%================================================================================~%MSG: sensor_msgs/BatteryState~%~%# Constants are chosen to match the enums in the linux kernel~%# defined in include/linux/power_supply.h as of version 3.7~%# The one difference is for style reasons the constants are~%# all uppercase not mixed case.~%~%# Power supply status constants~%uint8 POWER_SUPPLY_STATUS_UNKNOWN = 0~%uint8 POWER_SUPPLY_STATUS_CHARGING = 1~%uint8 POWER_SUPPLY_STATUS_DISCHARGING = 2~%uint8 POWER_SUPPLY_STATUS_NOT_CHARGING = 3~%uint8 POWER_SUPPLY_STATUS_FULL = 4~%~%# Power supply health constants~%uint8 POWER_SUPPLY_HEALTH_UNKNOWN = 0~%uint8 POWER_SUPPLY_HEALTH_GOOD = 1~%uint8 POWER_SUPPLY_HEALTH_OVERHEAT = 2~%uint8 POWER_SUPPLY_HEALTH_DEAD = 3~%uint8 POWER_SUPPLY_HEALTH_OVERVOLTAGE = 4~%uint8 POWER_SUPPLY_HEALTH_UNSPEC_FAILURE = 5~%uint8 POWER_SUPPLY_HEALTH_COLD = 6~%uint8 POWER_SUPPLY_HEALTH_WATCHDOG_TIMER_EXPIRE = 7~%uint8 POWER_SUPPLY_HEALTH_SAFETY_TIMER_EXPIRE = 8~%~%# Power supply technology (chemistry) constants~%uint8 POWER_SUPPLY_TECHNOLOGY_UNKNOWN = 0~%uint8 POWER_SUPPLY_TECHNOLOGY_NIMH = 1~%uint8 POWER_SUPPLY_TECHNOLOGY_LION = 2~%uint8 POWER_SUPPLY_TECHNOLOGY_LIPO = 3~%uint8 POWER_SUPPLY_TECHNOLOGY_LIFE = 4~%uint8 POWER_SUPPLY_TECHNOLOGY_NICD = 5~%uint8 POWER_SUPPLY_TECHNOLOGY_LIMN = 6~%~%Header  header~%float32 voltage          # Voltage in Volts (Mandatory)~%float32 current          # Negative when discharging (A)  (If unmeasured NaN)~%float32 charge           # Current charge in Ah  (If unmeasured NaN)~%float32 capacity         # Capacity in Ah (last full capacity)  (If unmeasured NaN)~%float32 design_capacity  # Capacity in Ah (design capacity)  (If unmeasured NaN)~%float32 percentage       # Charge percentage on 0 to 1 range  (If unmeasured NaN)~%uint8   power_supply_status     # The charging status as reported. Values defined above~%uint8   power_supply_health     # The battery health metric. Values defined above~%uint8   power_supply_technology # The battery chemistry. Values defined above~%bool    present          # True if the battery is present~%~%float32[] cell_voltage   # An array of individual cell voltages for each cell in the pack~%                         # If individual voltages unknown but number of cells known set each to NaN~%string location          # The location into which the battery is inserted. (slot number or plug)~%string serial_number     # The best approximation of the battery serial number~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetBatteryInfo-response)))
  "Returns full string definition for message of type 'GetBatteryInfo-response"
  (cl:format cl:nil "sensor_msgs/BatteryState battery_state~%~%================================================================================~%MSG: sensor_msgs/BatteryState~%~%# Constants are chosen to match the enums in the linux kernel~%# defined in include/linux/power_supply.h as of version 3.7~%# The one difference is for style reasons the constants are~%# all uppercase not mixed case.~%~%# Power supply status constants~%uint8 POWER_SUPPLY_STATUS_UNKNOWN = 0~%uint8 POWER_SUPPLY_STATUS_CHARGING = 1~%uint8 POWER_SUPPLY_STATUS_DISCHARGING = 2~%uint8 POWER_SUPPLY_STATUS_NOT_CHARGING = 3~%uint8 POWER_SUPPLY_STATUS_FULL = 4~%~%# Power supply health constants~%uint8 POWER_SUPPLY_HEALTH_UNKNOWN = 0~%uint8 POWER_SUPPLY_HEALTH_GOOD = 1~%uint8 POWER_SUPPLY_HEALTH_OVERHEAT = 2~%uint8 POWER_SUPPLY_HEALTH_DEAD = 3~%uint8 POWER_SUPPLY_HEALTH_OVERVOLTAGE = 4~%uint8 POWER_SUPPLY_HEALTH_UNSPEC_FAILURE = 5~%uint8 POWER_SUPPLY_HEALTH_COLD = 6~%uint8 POWER_SUPPLY_HEALTH_WATCHDOG_TIMER_EXPIRE = 7~%uint8 POWER_SUPPLY_HEALTH_SAFETY_TIMER_EXPIRE = 8~%~%# Power supply technology (chemistry) constants~%uint8 POWER_SUPPLY_TECHNOLOGY_UNKNOWN = 0~%uint8 POWER_SUPPLY_TECHNOLOGY_NIMH = 1~%uint8 POWER_SUPPLY_TECHNOLOGY_LION = 2~%uint8 POWER_SUPPLY_TECHNOLOGY_LIPO = 3~%uint8 POWER_SUPPLY_TECHNOLOGY_LIFE = 4~%uint8 POWER_SUPPLY_TECHNOLOGY_NICD = 5~%uint8 POWER_SUPPLY_TECHNOLOGY_LIMN = 6~%~%Header  header~%float32 voltage          # Voltage in Volts (Mandatory)~%float32 current          # Negative when discharging (A)  (If unmeasured NaN)~%float32 charge           # Current charge in Ah  (If unmeasured NaN)~%float32 capacity         # Capacity in Ah (last full capacity)  (If unmeasured NaN)~%float32 design_capacity  # Capacity in Ah (design capacity)  (If unmeasured NaN)~%float32 percentage       # Charge percentage on 0 to 1 range  (If unmeasured NaN)~%uint8   power_supply_status     # The charging status as reported. Values defined above~%uint8   power_supply_health     # The battery health metric. Values defined above~%uint8   power_supply_technology # The battery chemistry. Values defined above~%bool    present          # True if the battery is present~%~%float32[] cell_voltage   # An array of individual cell voltages for each cell in the pack~%                         # If individual voltages unknown but number of cells known set each to NaN~%string location          # The location into which the battery is inserted. (slot number or plug)~%string serial_number     # The best approximation of the battery serial number~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetBatteryInfo-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'battery_state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetBatteryInfo-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetBatteryInfo-response
    (cl:cons ':battery_state (battery_state msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetBatteryInfo)))
  'GetBatteryInfo-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetBatteryInfo)))
  'GetBatteryInfo-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetBatteryInfo)))
  "Returns string type for a service object of type '<GetBatteryInfo>"
  "ucar_controller/GetBatteryInfo")