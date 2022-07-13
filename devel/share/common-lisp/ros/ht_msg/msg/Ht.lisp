; Auto-generated. Do not edit!


(cl:in-package ht_msg-msg)


;//! \htmlinclude Ht.msg.html

(cl:defclass <Ht> (roslisp-msg-protocol:ros-message)
  ((glasses_people
    :reader glasses_people
    :initarg :glasses_people
    :type cl:fixnum
    :initform 0)
   (longhair_people
    :reader longhair_people
    :initarg :longhair_people
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Ht (<Ht>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Ht>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Ht)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ht_msg-msg:<Ht> is deprecated: use ht_msg-msg:Ht instead.")))

(cl:ensure-generic-function 'glasses_people-val :lambda-list '(m))
(cl:defmethod glasses_people-val ((m <Ht>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ht_msg-msg:glasses_people-val is deprecated.  Use ht_msg-msg:glasses_people instead.")
  (glasses_people m))

(cl:ensure-generic-function 'longhair_people-val :lambda-list '(m))
(cl:defmethod longhair_people-val ((m <Ht>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ht_msg-msg:longhair_people-val is deprecated.  Use ht_msg-msg:longhair_people instead.")
  (longhair_people m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Ht>) ostream)
  "Serializes a message object of type '<Ht>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'glasses_people)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'longhair_people)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Ht>) istream)
  "Deserializes a message object of type '<Ht>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'glasses_people)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'longhair_people)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Ht>)))
  "Returns string type for a message object of type '<Ht>"
  "ht_msg/Ht")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Ht)))
  "Returns string type for a message object of type 'Ht"
  "ht_msg/Ht")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Ht>)))
  "Returns md5sum for a message object of type '<Ht>"
  "79e7595f09184171ab3ff74ad2c7b38d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Ht)))
  "Returns md5sum for a message object of type 'Ht"
  "79e7595f09184171ab3ff74ad2c7b38d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Ht>)))
  "Returns full string definition for message of type '<Ht>"
  (cl:format cl:nil "uint8 glasses_people~%uint8 longhair_people~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Ht)))
  "Returns full string definition for message of type 'Ht"
  (cl:format cl:nil "uint8 glasses_people~%uint8 longhair_people~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Ht>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Ht>))
  "Converts a ROS message object to a list"
  (cl:list 'Ht
    (cl:cons ':glasses_people (glasses_people msg))
    (cl:cons ':longhair_people (longhair_people msg))
))
