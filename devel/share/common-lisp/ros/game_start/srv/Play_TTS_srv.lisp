; Auto-generated. Do not edit!


(cl:in-package game_start-srv)


;//! \htmlinclude Play_TTS_srv-request.msg.html

(cl:defclass <Play_TTS_srv-request> (roslisp-msg-protocol:ros-message)
  ((text
    :reader text
    :initarg :text
    :type cl:string
    :initform "")
   (speakerName
    :reader speakerName
    :initarg :speakerName
    :type cl:string
    :initform ""))
)

(cl:defclass Play_TTS_srv-request (<Play_TTS_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Play_TTS_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Play_TTS_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name game_start-srv:<Play_TTS_srv-request> is deprecated: use game_start-srv:Play_TTS_srv-request instead.")))

(cl:ensure-generic-function 'text-val :lambda-list '(m))
(cl:defmethod text-val ((m <Play_TTS_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader game_start-srv:text-val is deprecated.  Use game_start-srv:text instead.")
  (text m))

(cl:ensure-generic-function 'speakerName-val :lambda-list '(m))
(cl:defmethod speakerName-val ((m <Play_TTS_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader game_start-srv:speakerName-val is deprecated.  Use game_start-srv:speakerName instead.")
  (speakerName m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Play_TTS_srv-request>) ostream)
  "Serializes a message object of type '<Play_TTS_srv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'text))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'text))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'speakerName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'speakerName))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Play_TTS_srv-request>) istream)
  "Deserializes a message object of type '<Play_TTS_srv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'text) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'text) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speakerName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'speakerName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Play_TTS_srv-request>)))
  "Returns string type for a service object of type '<Play_TTS_srv-request>"
  "game_start/Play_TTS_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Play_TTS_srv-request)))
  "Returns string type for a service object of type 'Play_TTS_srv-request"
  "game_start/Play_TTS_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Play_TTS_srv-request>)))
  "Returns md5sum for a message object of type '<Play_TTS_srv-request>"
  "a69a11dcb98f2002f416b83cdd55c128")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Play_TTS_srv-request)))
  "Returns md5sum for a message object of type 'Play_TTS_srv-request"
  "a69a11dcb98f2002f416b83cdd55c128")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Play_TTS_srv-request>)))
  "Returns full string definition for message of type '<Play_TTS_srv-request>"
  (cl:format cl:nil "string text~%string speakerName~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Play_TTS_srv-request)))
  "Returns full string definition for message of type 'Play_TTS_srv-request"
  (cl:format cl:nil "string text~%string speakerName~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Play_TTS_srv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'text))
     4 (cl:length (cl:slot-value msg 'speakerName))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Play_TTS_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Play_TTS_srv-request
    (cl:cons ':text (text msg))
    (cl:cons ':speakerName (speakerName msg))
))
;//! \htmlinclude Play_TTS_srv-response.msg.html

(cl:defclass <Play_TTS_srv-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass Play_TTS_srv-response (<Play_TTS_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Play_TTS_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Play_TTS_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name game_start-srv:<Play_TTS_srv-response> is deprecated: use game_start-srv:Play_TTS_srv-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <Play_TTS_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader game_start-srv:result-val is deprecated.  Use game_start-srv:result instead.")
  (result m))

(cl:ensure-generic-function 'fail_reason-val :lambda-list '(m))
(cl:defmethod fail_reason-val ((m <Play_TTS_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader game_start-srv:fail_reason-val is deprecated.  Use game_start-srv:fail_reason instead.")
  (fail_reason m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Play_TTS_srv-response>) ostream)
  "Serializes a message object of type '<Play_TTS_srv-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Play_TTS_srv-response>) istream)
  "Deserializes a message object of type '<Play_TTS_srv-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Play_TTS_srv-response>)))
  "Returns string type for a service object of type '<Play_TTS_srv-response>"
  "game_start/Play_TTS_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Play_TTS_srv-response)))
  "Returns string type for a service object of type 'Play_TTS_srv-response"
  "game_start/Play_TTS_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Play_TTS_srv-response>)))
  "Returns md5sum for a message object of type '<Play_TTS_srv-response>"
  "a69a11dcb98f2002f416b83cdd55c128")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Play_TTS_srv-response)))
  "Returns md5sum for a message object of type 'Play_TTS_srv-response"
  "a69a11dcb98f2002f416b83cdd55c128")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Play_TTS_srv-response>)))
  "Returns full string definition for message of type '<Play_TTS_srv-response>"
  (cl:format cl:nil "string result~%string fail_reason~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Play_TTS_srv-response)))
  "Returns full string definition for message of type 'Play_TTS_srv-response"
  (cl:format cl:nil "string result~%string fail_reason~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Play_TTS_srv-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
     4 (cl:length (cl:slot-value msg 'fail_reason))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Play_TTS_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Play_TTS_srv-response
    (cl:cons ':result (result msg))
    (cl:cons ':fail_reason (fail_reason msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Play_TTS_srv)))
  'Play_TTS_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Play_TTS_srv)))
  'Play_TTS_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Play_TTS_srv)))
  "Returns string type for a service object of type '<Play_TTS_srv>"
  "game_start/Play_TTS_srv")