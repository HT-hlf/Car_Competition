; Auto-generated. Do not edit!


(cl:in-package ht_msg-msg)


;//! \htmlinclude Ht_n.msg.html

(cl:defclass <Ht_n> (roslisp-msg-protocol:ros-message)
  ((glasses_people
    :reader glasses_people
    :initarg :glasses_people
    :type cl:fixnum
    :initform 0)
   (longhair_people
    :reader longhair_people
    :initarg :longhair_people
    :type cl:fixnum
    :initform 0)
   (sum_people
    :reader sum_people
    :initarg :sum_people
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Ht_n (<Ht_n>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Ht_n>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Ht_n)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ht_msg-msg:<Ht_n> is deprecated: use ht_msg-msg:Ht_n instead.")))

(cl:ensure-generic-function 'glasses_people-val :lambda-list '(m))
(cl:defmethod glasses_people-val ((m <Ht_n>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ht_msg-msg:glasses_people-val is deprecated.  Use ht_msg-msg:glasses_people instead.")
  (glasses_people m))

(cl:ensure-generic-function 'longhair_people-val :lambda-list '(m))
(cl:defmethod longhair_people-val ((m <Ht_n>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ht_msg-msg:longhair_people-val is deprecated.  Use ht_msg-msg:longhair_people instead.")
  (longhair_people m))

(cl:ensure-generic-function 'sum_people-val :lambda-list '(m))
(cl:defmethod sum_people-val ((m <Ht_n>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ht_msg-msg:sum_people-val is deprecated.  Use ht_msg-msg:sum_people instead.")
  (sum_people m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Ht_n>) ostream)
  "Serializes a message object of type '<Ht_n>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'glasses_people)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'longhair_people)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sum_people)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Ht_n>) istream)
  "Deserializes a message object of type '<Ht_n>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'glasses_people)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'longhair_people)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sum_people)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Ht_n>)))
  "Returns string type for a message object of type '<Ht_n>"
  "ht_msg/Ht_n")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Ht_n)))
  "Returns string type for a message object of type 'Ht_n"
  "ht_msg/Ht_n")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Ht_n>)))
  "Returns md5sum for a message object of type '<Ht_n>"
  "0c743cff3054fd55978a5fd3eccc3803")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Ht_n)))
  "Returns md5sum for a message object of type 'Ht_n"
  "0c743cff3054fd55978a5fd3eccc3803")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Ht_n>)))
  "Returns full string definition for message of type '<Ht_n>"
  (cl:format cl:nil "uint8 glasses_people~%uint8 longhair_people~%uint8 sum_people~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Ht_n)))
  "Returns full string definition for message of type 'Ht_n"
  (cl:format cl:nil "uint8 glasses_people~%uint8 longhair_people~%uint8 sum_people~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Ht_n>))
  (cl:+ 0
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Ht_n>))
  "Converts a ROS message object to a list"
  (cl:list 'Ht_n
    (cl:cons ':glasses_people (glasses_people msg))
    (cl:cons ':longhair_people (longhair_people msg))
    (cl:cons ':sum_people (sum_people msg))
))
