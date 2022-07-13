; Auto-generated. Do not edit!


(cl:in-package xf_mic_asr_offline-srv)


;//! \htmlinclude Start_Record_srv-request.msg.html

(cl:defclass <Start_Record_srv-request> (roslisp-msg-protocol:ros-message)
  ((whether_start
    :reader whether_start
    :initarg :whether_start
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Start_Record_srv-request (<Start_Record_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Start_Record_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Start_Record_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xf_mic_asr_offline-srv:<Start_Record_srv-request> is deprecated: use xf_mic_asr_offline-srv:Start_Record_srv-request instead.")))

(cl:ensure-generic-function 'whether_start-val :lambda-list '(m))
(cl:defmethod whether_start-val ((m <Start_Record_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xf_mic_asr_offline-srv:whether_start-val is deprecated.  Use xf_mic_asr_offline-srv:whether_start instead.")
  (whether_start m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Start_Record_srv-request>) ostream)
  "Serializes a message object of type '<Start_Record_srv-request>"
  (cl:let* ((signed (cl:slot-value msg 'whether_start)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Start_Record_srv-request>) istream)
  "Deserializes a message object of type '<Start_Record_srv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'whether_start) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Start_Record_srv-request>)))
  "Returns string type for a service object of type '<Start_Record_srv-request>"
  "xf_mic_asr_offline/Start_Record_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Start_Record_srv-request)))
  "Returns string type for a service object of type 'Start_Record_srv-request"
  "xf_mic_asr_offline/Start_Record_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Start_Record_srv-request>)))
  "Returns md5sum for a message object of type '<Start_Record_srv-request>"
  "f1d612a6ac6a6d5f9f90acdc04ae715a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Start_Record_srv-request)))
  "Returns md5sum for a message object of type 'Start_Record_srv-request"
  "f1d612a6ac6a6d5f9f90acdc04ae715a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Start_Record_srv-request>)))
  "Returns full string definition for message of type '<Start_Record_srv-request>"
  (cl:format cl:nil "int8 whether_start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Start_Record_srv-request)))
  "Returns full string definition for message of type 'Start_Record_srv-request"
  (cl:format cl:nil "int8 whether_start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Start_Record_srv-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Start_Record_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Start_Record_srv-request
    (cl:cons ':whether_start (whether_start msg))
))
;//! \htmlinclude Start_Record_srv-response.msg.html

(cl:defclass <Start_Record_srv-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:string
    :initform "")
   (fail_reason
    :reader fail_reason
    :initarg :fail_reason
    :type cl:string
    :initform ""))
)

(cl:defclass Start_Record_srv-response (<Start_Record_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Start_Record_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Start_Record_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xf_mic_asr_offline-srv:<Start_Record_srv-response> is deprecated: use xf_mic_asr_offline-srv:Start_Record_srv-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <Start_Record_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xf_mic_asr_offline-srv:result-val is deprecated.  Use xf_mic_asr_offline-srv:result instead.")
  (result m))

(cl:ensure-generic-function 'fail_reason-val :lambda-list '(m))
(cl:defmethod fail_reason-val ((m <Start_Record_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xf_mic_asr_offline-srv:fail_reason-val is deprecated.  Use xf_mic_asr_offline-srv:fail_reason instead.")
  (fail_reason m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Start_Record_srv-response>) ostream)
  "Serializes a message object of type '<Start_Record_srv-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'fail_reason))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'fail_reason))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Start_Record_srv-response>) istream)
  "Deserializes a message object of type '<Start_Record_srv-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'result) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fail_reason) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'fail_reason) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Start_Record_srv-response>)))
  "Returns string type for a service object of type '<Start_Record_srv-response>"
  "xf_mic_asr_offline/Start_Record_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Start_Record_srv-response)))
  "Returns string type for a service object of type 'Start_Record_srv-response"
  "xf_mic_asr_offline/Start_Record_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Start_Record_srv-response>)))
  "Returns md5sum for a message object of type '<Start_Record_srv-response>"
  "f1d612a6ac6a6d5f9f90acdc04ae715a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Start_Record_srv-response)))
  "Returns md5sum for a message object of type 'Start_Record_srv-response"
  "f1d612a6ac6a6d5f9f90acdc04ae715a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Start_Record_srv-response>)))
  "Returns full string definition for message of type '<Start_Record_srv-response>"
  (cl:format cl:nil "string result~%string fail_reason~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Start_Record_srv-response)))
  "Returns full string definition for message of type 'Start_Record_srv-response"
  (cl:format cl:nil "string result~%string fail_reason~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Start_Record_srv-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
     4 (cl:length (cl:slot-value msg 'fail_reason))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Start_Record_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Start_Record_srv-response
    (cl:cons ':result (result msg))
    (cl:cons ':fail_reason (fail_reason msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Start_Record_srv)))
  'Start_Record_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Start_Record_srv)))
  'Start_Record_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Start_Record_srv)))
  "Returns string type for a service object of type '<Start_Record_srv>"
  "xf_mic_asr_offline/Start_Record_srv")