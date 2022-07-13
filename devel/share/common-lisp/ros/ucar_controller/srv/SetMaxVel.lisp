; Auto-generated. Do not edit!


(cl:in-package ucar_controller-srv)


;//! \htmlinclude SetMaxVel-request.msg.html

(cl:defclass <SetMaxVel-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetMaxVel-request (<SetMaxVel-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetMaxVel-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetMaxVel-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ucar_controller-srv:<SetMaxVel-request> is deprecated: use ucar_controller-srv:SetMaxVel-request instead.")))

(cl:ensure-generic-function 'max_linear_velocity-val :lambda-list '(m))
(cl:defmethod max_linear_velocity-val ((m <SetMaxVel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:max_linear_velocity-val is deprecated.  Use ucar_controller-srv:max_linear_velocity instead.")
  (max_linear_velocity m))

(cl:ensure-generic-function 'max_angular_velocity-val :lambda-list '(m))
(cl:defmethod max_angular_velocity-val ((m <SetMaxVel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:max_angular_velocity-val is deprecated.  Use ucar_controller-srv:max_angular_velocity instead.")
  (max_angular_velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetMaxVel-request>) ostream)
  "Serializes a message object of type '<SetMaxVel-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetMaxVel-request>) istream)
  "Deserializes a message object of type '<SetMaxVel-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetMaxVel-request>)))
  "Returns string type for a service object of type '<SetMaxVel-request>"
  "ucar_controller/SetMaxVelRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMaxVel-request)))
  "Returns string type for a service object of type 'SetMaxVel-request"
  "ucar_controller/SetMaxVelRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetMaxVel-request>)))
  "Returns md5sum for a message object of type '<SetMaxVel-request>"
  "62b58549939b0f5c8c78eafc0badef0e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetMaxVel-request)))
  "Returns md5sum for a message object of type 'SetMaxVel-request"
  "62b58549939b0f5c8c78eafc0badef0e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetMaxVel-request>)))
  "Returns full string definition for message of type '<SetMaxVel-request>"
  (cl:format cl:nil "float64 max_linear_velocity~%float64 max_angular_velocity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetMaxVel-request)))
  "Returns full string definition for message of type 'SetMaxVel-request"
  (cl:format cl:nil "float64 max_linear_velocity~%float64 max_angular_velocity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetMaxVel-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetMaxVel-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetMaxVel-request
    (cl:cons ':max_linear_velocity (max_linear_velocity msg))
    (cl:cons ':max_angular_velocity (max_angular_velocity msg))
))
;//! \htmlinclude SetMaxVel-response.msg.html

(cl:defclass <SetMaxVel-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass SetMaxVel-response (<SetMaxVel-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetMaxVel-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetMaxVel-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ucar_controller-srv:<SetMaxVel-response> is deprecated: use ucar_controller-srv:SetMaxVel-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetMaxVel-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:success-val is deprecated.  Use ucar_controller-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <SetMaxVel-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:message-val is deprecated.  Use ucar_controller-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetMaxVel-response>) ostream)
  "Serializes a message object of type '<SetMaxVel-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetMaxVel-response>) istream)
  "Deserializes a message object of type '<SetMaxVel-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetMaxVel-response>)))
  "Returns string type for a service object of type '<SetMaxVel-response>"
  "ucar_controller/SetMaxVelResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMaxVel-response)))
  "Returns string type for a service object of type 'SetMaxVel-response"
  "ucar_controller/SetMaxVelResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetMaxVel-response>)))
  "Returns md5sum for a message object of type '<SetMaxVel-response>"
  "62b58549939b0f5c8c78eafc0badef0e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetMaxVel-response)))
  "Returns md5sum for a message object of type 'SetMaxVel-response"
  "62b58549939b0f5c8c78eafc0badef0e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetMaxVel-response>)))
  "Returns full string definition for message of type '<SetMaxVel-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetMaxVel-response)))
  "Returns full string definition for message of type 'SetMaxVel-response"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetMaxVel-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetMaxVel-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetMaxVel-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetMaxVel)))
  'SetMaxVel-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetMaxVel)))
  'SetMaxVel-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetMaxVel)))
  "Returns string type for a service object of type '<SetMaxVel>"
  "ucar_controller/SetMaxVel")