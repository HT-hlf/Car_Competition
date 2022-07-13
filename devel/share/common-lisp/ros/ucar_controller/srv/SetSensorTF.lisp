; Auto-generated. Do not edit!


(cl:in-package ucar_controller-srv)


;//! \htmlinclude SetSensorTF-request.msg.html

(cl:defclass <SetSensorTF-request> (roslisp-msg-protocol:ros-message)
  ((pose_x
    :reader pose_x
    :initarg :pose_x
    :type cl:float
    :initform 0.0)
   (pose_y
    :reader pose_y
    :initarg :pose_y
    :type cl:float
    :initform 0.0)
   (pose_z
    :reader pose_z
    :initarg :pose_z
    :type cl:float
    :initform 0.0)
   (euler_r
    :reader euler_r
    :initarg :euler_r
    :type cl:float
    :initform 0.0)
   (euler_p
    :reader euler_p
    :initarg :euler_p
    :type cl:float
    :initform 0.0)
   (euler_y
    :reader euler_y
    :initarg :euler_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass SetSensorTF-request (<SetSensorTF-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetSensorTF-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetSensorTF-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ucar_controller-srv:<SetSensorTF-request> is deprecated: use ucar_controller-srv:SetSensorTF-request instead.")))

(cl:ensure-generic-function 'pose_x-val :lambda-list '(m))
(cl:defmethod pose_x-val ((m <SetSensorTF-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:pose_x-val is deprecated.  Use ucar_controller-srv:pose_x instead.")
  (pose_x m))

(cl:ensure-generic-function 'pose_y-val :lambda-list '(m))
(cl:defmethod pose_y-val ((m <SetSensorTF-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:pose_y-val is deprecated.  Use ucar_controller-srv:pose_y instead.")
  (pose_y m))

(cl:ensure-generic-function 'pose_z-val :lambda-list '(m))
(cl:defmethod pose_z-val ((m <SetSensorTF-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:pose_z-val is deprecated.  Use ucar_controller-srv:pose_z instead.")
  (pose_z m))

(cl:ensure-generic-function 'euler_r-val :lambda-list '(m))
(cl:defmethod euler_r-val ((m <SetSensorTF-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:euler_r-val is deprecated.  Use ucar_controller-srv:euler_r instead.")
  (euler_r m))

(cl:ensure-generic-function 'euler_p-val :lambda-list '(m))
(cl:defmethod euler_p-val ((m <SetSensorTF-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:euler_p-val is deprecated.  Use ucar_controller-srv:euler_p instead.")
  (euler_p m))

(cl:ensure-generic-function 'euler_y-val :lambda-list '(m))
(cl:defmethod euler_y-val ((m <SetSensorTF-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:euler_y-val is deprecated.  Use ucar_controller-srv:euler_y instead.")
  (euler_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetSensorTF-request>) ostream)
  "Serializes a message object of type '<SetSensorTF-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pose_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pose_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pose_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'euler_r))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'euler_p))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'euler_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetSensorTF-request>) istream)
  "Deserializes a message object of type '<SetSensorTF-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pose_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pose_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pose_z) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'euler_r) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'euler_p) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'euler_y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetSensorTF-request>)))
  "Returns string type for a service object of type '<SetSensorTF-request>"
  "ucar_controller/SetSensorTFRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSensorTF-request)))
  "Returns string type for a service object of type 'SetSensorTF-request"
  "ucar_controller/SetSensorTFRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetSensorTF-request>)))
  "Returns md5sum for a message object of type '<SetSensorTF-request>"
  "a6cc398312db9fcdb32a0a56126c3fa5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetSensorTF-request)))
  "Returns md5sum for a message object of type 'SetSensorTF-request"
  "a6cc398312db9fcdb32a0a56126c3fa5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetSensorTF-request>)))
  "Returns full string definition for message of type '<SetSensorTF-request>"
  (cl:format cl:nil "float64  pose_x~%float64  pose_y~%float64  pose_z~%float64  euler_r~%float64  euler_p~%float64  euler_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetSensorTF-request)))
  "Returns full string definition for message of type 'SetSensorTF-request"
  (cl:format cl:nil "float64  pose_x~%float64  pose_y~%float64  pose_z~%float64  euler_r~%float64  euler_p~%float64  euler_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetSensorTF-request>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetSensorTF-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetSensorTF-request
    (cl:cons ':pose_x (pose_x msg))
    (cl:cons ':pose_y (pose_y msg))
    (cl:cons ':pose_z (pose_z msg))
    (cl:cons ':euler_r (euler_r msg))
    (cl:cons ':euler_p (euler_p msg))
    (cl:cons ':euler_y (euler_y msg))
))
;//! \htmlinclude SetSensorTF-response.msg.html

(cl:defclass <SetSensorTF-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetSensorTF-response (<SetSensorTF-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetSensorTF-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetSensorTF-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ucar_controller-srv:<SetSensorTF-response> is deprecated: use ucar_controller-srv:SetSensorTF-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetSensorTF-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:success-val is deprecated.  Use ucar_controller-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <SetSensorTF-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:message-val is deprecated.  Use ucar_controller-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetSensorTF-response>) ostream)
  "Serializes a message object of type '<SetSensorTF-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetSensorTF-response>) istream)
  "Deserializes a message object of type '<SetSensorTF-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetSensorTF-response>)))
  "Returns string type for a service object of type '<SetSensorTF-response>"
  "ucar_controller/SetSensorTFResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSensorTF-response)))
  "Returns string type for a service object of type 'SetSensorTF-response"
  "ucar_controller/SetSensorTFResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetSensorTF-response>)))
  "Returns md5sum for a message object of type '<SetSensorTF-response>"
  "a6cc398312db9fcdb32a0a56126c3fa5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetSensorTF-response)))
  "Returns md5sum for a message object of type 'SetSensorTF-response"
  "a6cc398312db9fcdb32a0a56126c3fa5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetSensorTF-response>)))
  "Returns full string definition for message of type '<SetSensorTF-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetSensorTF-response)))
  "Returns full string definition for message of type 'SetSensorTF-response"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetSensorTF-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetSensorTF-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetSensorTF-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetSensorTF)))
  'SetSensorTF-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetSensorTF)))
  'SetSensorTF-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSensorTF)))
  "Returns string type for a service object of type '<SetSensorTF>"
  "ucar_controller/SetSensorTF")