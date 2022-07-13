; Auto-generated. Do not edit!


(cl:in-package ucar_controller-srv)


;//! \htmlinclude SetLEDMode-request.msg.html

(cl:defclass <SetLEDMode-request> (roslisp-msg-protocol:ros-message)
  ((mode_type
    :reader mode_type
    :initarg :mode_type
    :type cl:fixnum
    :initform 0)
   (frequency
    :reader frequency
    :initarg :frequency
    :type cl:float
    :initform 0.0)
   (red_value
    :reader red_value
    :initarg :red_value
    :type cl:fixnum
    :initform 0)
   (green_value
    :reader green_value
    :initarg :green_value
    :type cl:fixnum
    :initform 0)
   (blue_value
    :reader blue_value
    :initarg :blue_value
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SetLEDMode-request (<SetLEDMode-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetLEDMode-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetLEDMode-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ucar_controller-srv:<SetLEDMode-request> is deprecated: use ucar_controller-srv:SetLEDMode-request instead.")))

(cl:ensure-generic-function 'mode_type-val :lambda-list '(m))
(cl:defmethod mode_type-val ((m <SetLEDMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:mode_type-val is deprecated.  Use ucar_controller-srv:mode_type instead.")
  (mode_type m))

(cl:ensure-generic-function 'frequency-val :lambda-list '(m))
(cl:defmethod frequency-val ((m <SetLEDMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:frequency-val is deprecated.  Use ucar_controller-srv:frequency instead.")
  (frequency m))

(cl:ensure-generic-function 'red_value-val :lambda-list '(m))
(cl:defmethod red_value-val ((m <SetLEDMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:red_value-val is deprecated.  Use ucar_controller-srv:red_value instead.")
  (red_value m))

(cl:ensure-generic-function 'green_value-val :lambda-list '(m))
(cl:defmethod green_value-val ((m <SetLEDMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:green_value-val is deprecated.  Use ucar_controller-srv:green_value instead.")
  (green_value m))

(cl:ensure-generic-function 'blue_value-val :lambda-list '(m))
(cl:defmethod blue_value-val ((m <SetLEDMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:blue_value-val is deprecated.  Use ucar_controller-srv:blue_value instead.")
  (blue_value m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<SetLEDMode-request>)))
    "Constants for message type '<SetLEDMode-request>"
  '((:MODE_NORMAL . 0)
    (:MODE_BLINK . 1)
    (:MODE_BREATH . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'SetLEDMode-request)))
    "Constants for message type 'SetLEDMode-request"
  '((:MODE_NORMAL . 0)
    (:MODE_BLINK . 1)
    (:MODE_BREATH . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetLEDMode-request>) ostream)
  "Serializes a message object of type '<SetLEDMode-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode_type)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'frequency))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'red_value)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'green_value)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'blue_value)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetLEDMode-request>) istream)
  "Deserializes a message object of type '<SetLEDMode-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode_type)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'frequency) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'red_value)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'green_value)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'blue_value)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetLEDMode-request>)))
  "Returns string type for a service object of type '<SetLEDMode-request>"
  "ucar_controller/SetLEDModeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetLEDMode-request)))
  "Returns string type for a service object of type 'SetLEDMode-request"
  "ucar_controller/SetLEDModeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetLEDMode-request>)))
  "Returns md5sum for a message object of type '<SetLEDMode-request>"
  "4964a3b2c6e612338ad6fbc54b65501d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetLEDMode-request)))
  "Returns md5sum for a message object of type 'SetLEDMode-request"
  "4964a3b2c6e612338ad6fbc54b65501d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetLEDMode-request>)))
  "Returns full string definition for message of type '<SetLEDMode-request>"
  (cl:format cl:nil "uint8 MODE_NORMAL = 0~%uint8 MODE_BLINK  = 1~%uint8 MODE_BREATH = 2~%uint8   mode_type~%float64 frequency~%uint8 red_value~%uint8 green_value~%uint8 blue_value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetLEDMode-request)))
  "Returns full string definition for message of type 'SetLEDMode-request"
  (cl:format cl:nil "uint8 MODE_NORMAL = 0~%uint8 MODE_BLINK  = 1~%uint8 MODE_BREATH = 2~%uint8   mode_type~%float64 frequency~%uint8 red_value~%uint8 green_value~%uint8 blue_value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetLEDMode-request>))
  (cl:+ 0
     1
     8
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetLEDMode-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetLEDMode-request
    (cl:cons ':mode_type (mode_type msg))
    (cl:cons ':frequency (frequency msg))
    (cl:cons ':red_value (red_value msg))
    (cl:cons ':green_value (green_value msg))
    (cl:cons ':blue_value (blue_value msg))
))
;//! \htmlinclude SetLEDMode-response.msg.html

(cl:defclass <SetLEDMode-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetLEDMode-response (<SetLEDMode-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetLEDMode-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetLEDMode-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ucar_controller-srv:<SetLEDMode-response> is deprecated: use ucar_controller-srv:SetLEDMode-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetLEDMode-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:success-val is deprecated.  Use ucar_controller-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <SetLEDMode-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:message-val is deprecated.  Use ucar_controller-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetLEDMode-response>) ostream)
  "Serializes a message object of type '<SetLEDMode-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetLEDMode-response>) istream)
  "Deserializes a message object of type '<SetLEDMode-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetLEDMode-response>)))
  "Returns string type for a service object of type '<SetLEDMode-response>"
  "ucar_controller/SetLEDModeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetLEDMode-response)))
  "Returns string type for a service object of type 'SetLEDMode-response"
  "ucar_controller/SetLEDModeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetLEDMode-response>)))
  "Returns md5sum for a message object of type '<SetLEDMode-response>"
  "4964a3b2c6e612338ad6fbc54b65501d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetLEDMode-response)))
  "Returns md5sum for a message object of type 'SetLEDMode-response"
  "4964a3b2c6e612338ad6fbc54b65501d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetLEDMode-response>)))
  "Returns full string definition for message of type '<SetLEDMode-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetLEDMode-response)))
  "Returns full string definition for message of type 'SetLEDMode-response"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetLEDMode-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetLEDMode-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetLEDMode-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetLEDMode)))
  'SetLEDMode-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetLEDMode)))
  'SetLEDMode-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetLEDMode)))
  "Returns string type for a service object of type '<SetLEDMode>"
  "ucar_controller/SetLEDMode")