; Auto-generated. Do not edit!


(cl:in-package xf_mic_asr_offline-msg)


;//! \htmlinclude qidong.msg.html

(cl:defclass <qidong> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:string
    :initform ""))
)

(cl:defclass qidong (<qidong>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <qidong>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'qidong)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xf_mic_asr_offline-msg:<qidong> is deprecated: use xf_mic_asr_offline-msg:qidong instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <qidong>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xf_mic_asr_offline-msg:data-val is deprecated.  Use xf_mic_asr_offline-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <qidong>) ostream)
  "Serializes a message object of type '<qidong>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <qidong>) istream)
  "Deserializes a message object of type '<qidong>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'data) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<qidong>)))
  "Returns string type for a message object of type '<qidong>"
  "xf_mic_asr_offline/qidong")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'qidong)))
  "Returns string type for a message object of type 'qidong"
  "xf_mic_asr_offline/qidong")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<qidong>)))
  "Returns md5sum for a message object of type '<qidong>"
  "992ce8a1687cec8c8bd883ec73ca41d1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'qidong)))
  "Returns md5sum for a message object of type 'qidong"
  "992ce8a1687cec8c8bd883ec73ca41d1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<qidong>)))
  "Returns full string definition for message of type '<qidong>"
  (cl:format cl:nil "string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'qidong)))
  "Returns full string definition for message of type 'qidong"
  (cl:format cl:nil "string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <qidong>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <qidong>))
  "Converts a ROS message object to a list"
  (cl:list 'qidong
    (cl:cons ':data (data msg))
))
