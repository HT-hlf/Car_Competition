; Auto-generated. Do not edit!


(cl:in-package robot_localization-srv)


;//! \htmlinclude SetUTMZone-request.msg.html

(cl:defclass <SetUTMZone-request> (roslisp-msg-protocol:ros-message)
  ((utm_zone
    :reader utm_zone
    :initarg :utm_zone
    :type cl:string
    :initform ""))
)

(cl:defclass SetUTMZone-request (<SetUTMZone-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetUTMZone-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetUTMZone-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_localization-srv:<SetUTMZone-request> is deprecated: use robot_localization-srv:SetUTMZone-request instead.")))

(cl:ensure-generic-function 'utm_zone-val :lambda-list '(m))
(cl:defmethod utm_zone-val ((m <SetUTMZone-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_localization-srv:utm_zone-val is deprecated.  Use robot_localization-srv:utm_zone instead.")
  (utm_zone m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetUTMZone-request>) ostream)
  "Serializes a message object of type '<SetUTMZone-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'utm_zone))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'utm_zone))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetUTMZone-request>) istream)
  "Deserializes a message object of type '<SetUTMZone-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'utm_zone) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'utm_zone) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetUTMZone-request>)))
  "Returns string type for a service object of type '<SetUTMZone-request>"
  "robot_localization/SetUTMZoneRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetUTMZone-request)))
  "Returns string type for a service object of type 'SetUTMZone-request"
  "robot_localization/SetUTMZoneRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetUTMZone-request>)))
  "Returns md5sum for a message object of type '<SetUTMZone-request>"
  "893fd74d45efde020666acda18d3cccc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetUTMZone-request)))
  "Returns md5sum for a message object of type 'SetUTMZone-request"
  "893fd74d45efde020666acda18d3cccc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetUTMZone-request>)))
  "Returns full string definition for message of type '<SetUTMZone-request>"
  (cl:format cl:nil "~%~%string utm_zone~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetUTMZone-request)))
  "Returns full string definition for message of type 'SetUTMZone-request"
  (cl:format cl:nil "~%~%string utm_zone~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetUTMZone-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'utm_zone))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetUTMZone-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetUTMZone-request
    (cl:cons ':utm_zone (utm_zone msg))
))
;//! \htmlinclude SetUTMZone-response.msg.html

(cl:defclass <SetUTMZone-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetUTMZone-response (<SetUTMZone-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetUTMZone-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetUTMZone-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_localization-srv:<SetUTMZone-response> is deprecated: use robot_localization-srv:SetUTMZone-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetUTMZone-response>) ostream)
  "Serializes a message object of type '<SetUTMZone-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetUTMZone-response>) istream)
  "Deserializes a message object of type '<SetUTMZone-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetUTMZone-response>)))
  "Returns string type for a service object of type '<SetUTMZone-response>"
  "robot_localization/SetUTMZoneResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetUTMZone-response)))
  "Returns string type for a service object of type 'SetUTMZone-response"
  "robot_localization/SetUTMZoneResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetUTMZone-response>)))
  "Returns md5sum for a message object of type '<SetUTMZone-response>"
  "893fd74d45efde020666acda18d3cccc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetUTMZone-response)))
  "Returns md5sum for a message object of type 'SetUTMZone-response"
  "893fd74d45efde020666acda18d3cccc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetUTMZone-response>)))
  "Returns full string definition for message of type '<SetUTMZone-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetUTMZone-response)))
  "Returns full string definition for message of type 'SetUTMZone-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetUTMZone-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetUTMZone-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetUTMZone-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetUTMZone)))
  'SetUTMZone-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetUTMZone)))
  'SetUTMZone-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetUTMZone)))
  "Returns string type for a service object of type '<SetUTMZone>"
  "robot_localization/SetUTMZone")