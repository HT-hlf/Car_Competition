; Auto-generated. Do not edit!


(cl:in-package ucar_controller-srv)


;//! \htmlinclude GetSensorTF-request.msg.html

(cl:defclass <GetSensorTF-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetSensorTF-request (<GetSensorTF-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetSensorTF-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetSensorTF-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ucar_controller-srv:<GetSensorTF-request> is deprecated: use ucar_controller-srv:GetSensorTF-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetSensorTF-request>) ostream)
  "Serializes a message object of type '<GetSensorTF-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetSensorTF-request>) istream)
  "Deserializes a message object of type '<GetSensorTF-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetSensorTF-request>)))
  "Returns string type for a service object of type '<GetSensorTF-request>"
  "ucar_controller/GetSensorTFRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetSensorTF-request)))
  "Returns string type for a service object of type 'GetSensorTF-request"
  "ucar_controller/GetSensorTFRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetSensorTF-request>)))
  "Returns md5sum for a message object of type '<GetSensorTF-request>"
  "c539823f1bf23f7b686643f4bd7617b3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetSensorTF-request)))
  "Returns md5sum for a message object of type 'GetSensorTF-request"
  "c539823f1bf23f7b686643f4bd7617b3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetSensorTF-request>)))
  "Returns full string definition for message of type '<GetSensorTF-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetSensorTF-request)))
  "Returns full string definition for message of type 'GetSensorTF-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetSensorTF-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetSensorTF-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetSensorTF-request
))
;//! \htmlinclude GetSensorTF-response.msg.html

(cl:defclass <GetSensorTF-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass GetSensorTF-response (<GetSensorTF-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetSensorTF-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetSensorTF-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ucar_controller-srv:<GetSensorTF-response> is deprecated: use ucar_controller-srv:GetSensorTF-response instead.")))

(cl:ensure-generic-function 'pose_x-val :lambda-list '(m))
(cl:defmethod pose_x-val ((m <GetSensorTF-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:pose_x-val is deprecated.  Use ucar_controller-srv:pose_x instead.")
  (pose_x m))

(cl:ensure-generic-function 'pose_y-val :lambda-list '(m))
(cl:defmethod pose_y-val ((m <GetSensorTF-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:pose_y-val is deprecated.  Use ucar_controller-srv:pose_y instead.")
  (pose_y m))

(cl:ensure-generic-function 'pose_z-val :lambda-list '(m))
(cl:defmethod pose_z-val ((m <GetSensorTF-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:pose_z-val is deprecated.  Use ucar_controller-srv:pose_z instead.")
  (pose_z m))

(cl:ensure-generic-function 'euler_r-val :lambda-list '(m))
(cl:defmethod euler_r-val ((m <GetSensorTF-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:euler_r-val is deprecated.  Use ucar_controller-srv:euler_r instead.")
  (euler_r m))

(cl:ensure-generic-function 'euler_p-val :lambda-list '(m))
(cl:defmethod euler_p-val ((m <GetSensorTF-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:euler_p-val is deprecated.  Use ucar_controller-srv:euler_p instead.")
  (euler_p m))

(cl:ensure-generic-function 'euler_y-val :lambda-list '(m))
(cl:defmethod euler_y-val ((m <GetSensorTF-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ucar_controller-srv:euler_y-val is deprecated.  Use ucar_controller-srv:euler_y instead.")
  (euler_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetSensorTF-response>) ostream)
  "Serializes a message object of type '<GetSensorTF-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetSensorTF-response>) istream)
  "Deserializes a message object of type '<GetSensorTF-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetSensorTF-response>)))
  "Returns string type for a service object of type '<GetSensorTF-response>"
  "ucar_controller/GetSensorTFResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetSensorTF-response)))
  "Returns string type for a service object of type 'GetSensorTF-response"
  "ucar_controller/GetSensorTFResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetSensorTF-response>)))
  "Returns md5sum for a message object of type '<GetSensorTF-response>"
  "c539823f1bf23f7b686643f4bd7617b3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetSensorTF-response)))
  "Returns md5sum for a message object of type 'GetSensorTF-response"
  "c539823f1bf23f7b686643f4bd7617b3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetSensorTF-response>)))
  "Returns full string definition for message of type '<GetSensorTF-response>"
  (cl:format cl:nil "float64  pose_x~%float64  pose_y~%float64  pose_z~%float64  euler_r~%float64  euler_p~%float64  euler_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetSensorTF-response)))
  "Returns full string definition for message of type 'GetSensorTF-response"
  (cl:format cl:nil "float64  pose_x~%float64  pose_y~%float64  pose_z~%float64  euler_r~%float64  euler_p~%float64  euler_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetSensorTF-response>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetSensorTF-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetSensorTF-response
    (cl:cons ':pose_x (pose_x msg))
    (cl:cons ':pose_y (pose_y msg))
    (cl:cons ':pose_z (pose_z msg))
    (cl:cons ':euler_r (euler_r msg))
    (cl:cons ':euler_p (euler_p msg))
    (cl:cons ':euler_y (euler_y msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetSensorTF)))
  'GetSensorTF-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetSensorTF)))
  'GetSensorTF-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetSensorTF)))
  "Returns string type for a service object of type '<GetSensorTF>"
  "ucar_controller/GetSensorTF")