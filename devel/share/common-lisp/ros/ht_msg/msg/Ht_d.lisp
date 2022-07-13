; Auto-generated. Do not edit!


(cl:in-package ht_msg-msg)


;//! \htmlinclude Ht_d.msg.html

(cl:defclass <Ht_d> (roslisp-msg-protocol:ros-message)
  ((detect
    :reader detect
    :initarg :detect
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Ht_d (<Ht_d>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Ht_d>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Ht_d)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ht_msg-msg:<Ht_d> is deprecated: use ht_msg-msg:Ht_d instead.")))

(cl:ensure-generic-function 'detect-val :lambda-list '(m))
(cl:defmethod detect-val ((m <Ht_d>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ht_msg-msg:detect-val is deprecated.  Use ht_msg-msg:detect instead.")
  (detect m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Ht_d>) ostream)
  "Serializes a message object of type '<Ht_d>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'detect) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Ht_d>) istream)
  "Deserializes a message object of type '<Ht_d>"
    (cl:setf (cl:slot-value msg 'detect) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Ht_d>)))
  "Returns string type for a message object of type '<Ht_d>"
  "ht_msg/Ht_d")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Ht_d)))
  "Returns string type for a message object of type 'Ht_d"
  "ht_msg/Ht_d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Ht_d>)))
  "Returns md5sum for a message object of type '<Ht_d>"
  "75e83bb3bd22c91435365dfc6ce294b7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Ht_d)))
  "Returns md5sum for a message object of type 'Ht_d"
  "75e83bb3bd22c91435365dfc6ce294b7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Ht_d>)))
  "Returns full string definition for message of type '<Ht_d>"
  (cl:format cl:nil "bool detect~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Ht_d)))
  "Returns full string definition for message of type 'Ht_d"
  (cl:format cl:nil "bool detect~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Ht_d>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Ht_d>))
  "Converts a ROS message object to a list"
  (cl:list 'Ht_d
    (cl:cons ':detect (detect msg))
))
