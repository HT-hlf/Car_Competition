; Auto-generated. Do not edit!


(cl:in-package xf_mic_asr_offline-srv)


;//! \htmlinclude Set_Awake_Word_srv-request.msg.html

(cl:defclass <Set_Awake_Word_srv-request> (roslisp-msg-protocol:ros-message)
  ((awake_word
    :reader awake_word
    :initarg :awake_word
    :type cl:string
    :initform ""))
)

(cl:defclass Set_Awake_Word_srv-request (<Set_Awake_Word_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Set_Awake_Word_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Set_Awake_Word_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xf_mic_asr_offline-srv:<Set_Awake_Word_srv-request> is deprecated: use xf_mic_asr_offline-srv:Set_Awake_Word_srv-request instead.")))

(cl:ensure-generic-function 'awake_word-val :lambda-list '(m))
(cl:defmethod awake_word-val ((m <Set_Awake_Word_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xf_mic_asr_offline-srv:awake_word-val is deprecated.  Use xf_mic_asr_offline-srv:awake_word instead.")
  (awake_word m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Set_Awake_Word_srv-request>) ostream)
  "Serializes a message object of type '<Set_Awake_Word_srv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'awake_word))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'awake_word))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Set_Awake_Word_srv-request>) istream)
  "Deserializes a message object of type '<Set_Awake_Word_srv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'awake_word) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'awake_word) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Set_Awake_Word_srv-request>)))
  "Returns string type for a service object of type '<Set_Awake_Word_srv-request>"
  "xf_mic_asr_offline/Set_Awake_Word_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Set_Awake_Word_srv-request)))
  "Returns string type for a service object of type 'Set_Awake_Word_srv-request"
  "xf_mic_asr_offline/Set_Awake_Word_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Set_Awake_Word_srv-request>)))
  "Returns md5sum for a message object of type '<Set_Awake_Word_srv-request>"
  "7e4b0be2dab296a055fbdac61a8ae954")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Set_Awake_Word_srv-request)))
  "Returns md5sum for a message object of type 'Set_Awake_Word_srv-request"
  "7e4b0be2dab296a055fbdac61a8ae954")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Set_Awake_Word_srv-request>)))
  "Returns full string definition for message of type '<Set_Awake_Word_srv-request>"
  (cl:format cl:nil "string awake_word~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Set_Awake_Word_srv-request)))
  "Returns full string definition for message of type 'Set_Awake_Word_srv-request"
  (cl:format cl:nil "string awake_word~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Set_Awake_Word_srv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'awake_word))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Set_Awake_Word_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Set_Awake_Word_srv-request
    (cl:cons ':awake_word (awake_word msg))
))
;//! \htmlinclude Set_Awake_Word_srv-response.msg.html

(cl:defclass <Set_Awake_Word_srv-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass Set_Awake_Word_srv-response (<Set_Awake_Word_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Set_Awake_Word_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Set_Awake_Word_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xf_mic_asr_offline-srv:<Set_Awake_Word_srv-response> is deprecated: use xf_mic_asr_offline-srv:Set_Awake_Word_srv-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <Set_Awake_Word_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xf_mic_asr_offline-srv:result-val is deprecated.  Use xf_mic_asr_offline-srv:result instead.")
  (result m))

(cl:ensure-generic-function 'fail_reason-val :lambda-list '(m))
(cl:defmethod fail_reason-val ((m <Set_Awake_Word_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xf_mic_asr_offline-srv:fail_reason-val is deprecated.  Use xf_mic_asr_offline-srv:fail_reason instead.")
  (fail_reason m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Set_Awake_Word_srv-response>) ostream)
  "Serializes a message object of type '<Set_Awake_Word_srv-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Set_Awake_Word_srv-response>) istream)
  "Deserializes a message object of type '<Set_Awake_Word_srv-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Set_Awake_Word_srv-response>)))
  "Returns string type for a service object of type '<Set_Awake_Word_srv-response>"
  "xf_mic_asr_offline/Set_Awake_Word_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Set_Awake_Word_srv-response)))
  "Returns string type for a service object of type 'Set_Awake_Word_srv-response"
  "xf_mic_asr_offline/Set_Awake_Word_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Set_Awake_Word_srv-response>)))
  "Returns md5sum for a message object of type '<Set_Awake_Word_srv-response>"
  "7e4b0be2dab296a055fbdac61a8ae954")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Set_Awake_Word_srv-response)))
  "Returns md5sum for a message object of type 'Set_Awake_Word_srv-response"
  "7e4b0be2dab296a055fbdac61a8ae954")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Set_Awake_Word_srv-response>)))
  "Returns full string definition for message of type '<Set_Awake_Word_srv-response>"
  (cl:format cl:nil "string result~%string fail_reason~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Set_Awake_Word_srv-response)))
  "Returns full string definition for message of type 'Set_Awake_Word_srv-response"
  (cl:format cl:nil "string result~%string fail_reason~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Set_Awake_Word_srv-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
     4 (cl:length (cl:slot-value msg 'fail_reason))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Set_Awake_Word_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Set_Awake_Word_srv-response
    (cl:cons ':result (result msg))
    (cl:cons ':fail_reason (fail_reason msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Set_Awake_Word_srv)))
  'Set_Awake_Word_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Set_Awake_Word_srv)))
  'Set_Awake_Word_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Set_Awake_Word_srv)))
  "Returns string type for a service object of type '<Set_Awake_Word_srv>"
  "xf_mic_asr_offline/Set_Awake_Word_srv")