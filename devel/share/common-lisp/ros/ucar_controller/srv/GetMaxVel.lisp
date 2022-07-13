; Auto-generated. Do not edit!


(cl:in-package ucar_controller-srv)


;//! \htmlinclude GetMaxVel-request.msg.html

(cl:defclass <GetMaxVel-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetMaxVel-request (<GetMaxVel-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetMaxVel-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetMaxVel-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ucar_controller-srv:<GetMaxVel-request> is deprecated: use ucar_controller-srv:GetMaxVel-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetMaxVel-request>) ostream)
  "Serializes a message object of type '<GetMaxVel-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetMaxVel-request>) istream)
  "Deserializes a message object of type '<GetMaxVel-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetMaxVel-request>)))
  "Returns string type for a service object of type '<GetMaxVel-request>"
  "ucar_controller/GetMaxVelRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetMaxVel-request)))
  "Returns string type for a service object of type 'GetMaxVel-request"
  "ucar_controller/GetMaxVelRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetMaxVel-request>)))
  "Returns md5sum for a message object of type '<GetMaxVel-request>"
  "c3d002ed0ab158592aaa625149bc3810")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetMaxVel-request)))
  "Returns md5sum for a message object of type 'GetMaxVel-request"
  "c3d002ed0ab158592aaa625149bc3810")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetMaxVel-request>)))
  "Returns full string definition for message of type '<GetMaxVel-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetMaxVel-request)))
  "Returns full string definition for message of type 'GetMaxVel-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetMaxVel-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetMaxVel-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetMaxVel-request
))
;//! \htmlinclude GetMaxVel-response.msg.html

(cl:defclass <GetMaxVel-response> (roslisp-msg-protocol:ros-message)
  ((max_linear_velocity
    :reader max_linear_velocity
    :initarg :max_linear_velocity
    :type cl:float
    :initform 0.0)
   (max_angular_velocity
    :reader max_angular_velocity
    :initarg :max_angular_velocity
    :type cl:float
    :initform 0.0))
)

(cl:defclass GetMaxVel-response (<GetMaxVel-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetMaxVel-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetMaxVel-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ucar_controller-srv:<GetMaxVel-response> is deprecated: use ucar_controller-srv:GetMaxVel-response instead.")))

(cl:ensure-generic-function 'max_linear_velocity-val :lambda-list '(m))
(cl:defmethod max_linear_velocity-val ((m <GetMaxVel-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:max_linear_velocity-val is deprecated.  Use ucar_controller-srv:max_linear_velocity instead.")
  (max_linear_velocity m))

(cl:ensure-generic-function 'max_angular_velocity-val :lambda-list '(m))
(cl:defmethod max_angular_velocity-val ((m <GetMaxVel-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:max_angular_velocity-val is deprecated.  Use ucar_controller-srv:max_angular_velocity instead.")
  (max_angular_velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetMaxVel-response>) ostream)
  "Serializes a message object of type '<GetMaxVel-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'max_linear_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'max_angular_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetMaxVel-response>) istream)
  "Deserializes a message object of type '<GetMaxVel-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_linear_velocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_angular_velocity) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetMaxVel-response>)))
  "Returns string type for a service object of type '<GetMaxVel-response>"
  "ucar_controller/GetMaxVelResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetMaxVel-response)))
  "Returns string type for a service object of type 'GetMaxVel-response"
  "ucar_controller/GetMaxVelResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetMaxVel-response>)))
  "Returns md5sum for a message object of type '<GetMaxVel-response>"
  "c3d002ed0ab158592aaa625149bc3810")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetMaxVel-response)))
  "Returns md5sum for a message object of type 'GetMaxVel-response"
  "c3d002ed0ab158592aaa625149bc3810")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetMaxVel-response>)))
  "Returns full string definition for message of type '<GetMaxVel-response>"
  (cl:format cl:nil "float64 max_linear_velocity~%float64 max_angular_velocity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetMaxVel-response)))
  "Returns full string definition for message of type 'GetMaxVel-response"
  (cl:format cl:nil "float64 max_linear_velocity~%float64 max_angular_velocity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetMaxVel-response>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetMaxVel-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetMaxVel-response
    (cl:cons ':max_linear_velocity (max_linear_velocity msg))
    (cl:cons ':max_angular_velocity (max_angular_velocity msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetMaxVel)))
  'GetMaxVel-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetMaxVel)))
  'GetMaxVel-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetMaxVel)))
  "Returns string type for a service object of type '<GetMaxVel>"
  "ucar_controller/GetMaxVel")