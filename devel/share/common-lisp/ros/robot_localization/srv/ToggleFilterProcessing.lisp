; Auto-generated. Do not edit!


(cl:in-package robot_localization-srv)


;//! \htmlinclude ToggleFilterProcessing-request.msg.html

(cl:defclass <ToggleFilterProcessing-request> (roslisp-msg-protocol:ros-message)
  ((on
    :reader on
    :initarg :on
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ToggleFilterProcessing-request (<ToggleFilterProcessing-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ToggleFilterProcessing-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ToggleFilterProcessing-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_localization-srv:<ToggleFilterProcessing-request> is deprecated: use robot_localization-srv:ToggleFilterProcessing-request instead.")))

(cl:ensure-generic-function 'on-val :lambda-list '(m))
(cl:defmethod on-val ((m <ToggleFilterProcessing-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_localization-srv:on-val is deprecated.  Use robot_localization-srv:on instead.")
  (on m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ToggleFilterProcessing-request>) ostream)
  "Serializes a message object of type '<ToggleFilterProcessing-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'on) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ToggleFilterProcessing-request>) istream)
  "Deserializes a message object of type '<ToggleFilterProcessing-request>"
    (cl:setf (cl:slot-value msg 'on) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ToggleFilterProcessing-request>)))
  "Returns string type for a service object of type '<ToggleFilterProcessing-request>"
  "robot_localization/ToggleFilterProcessingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ToggleFilterProcessing-request)))
  "Returns string type for a service object of type 'ToggleFilterProcessing-request"
  "robot_localization/ToggleFilterProcessingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ToggleFilterProcessing-request>)))
  "Returns md5sum for a message object of type '<ToggleFilterProcessing-request>"
  "a8e1711976dcda1b8b978eee81e85498")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ToggleFilterProcessing-request)))
  "Returns md5sum for a message object of type 'ToggleFilterProcessing-request"
  "a8e1711976dcda1b8b978eee81e85498")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ToggleFilterProcessing-request>)))
  "Returns full string definition for message of type '<ToggleFilterProcessing-request>"
  (cl:format cl:nil "bool on~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ToggleFilterProcessing-request)))
  "Returns full string definition for message of type 'ToggleFilterProcessing-request"
  (cl:format cl:nil "bool on~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ToggleFilterProcessing-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ToggleFilterProcessing-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ToggleFilterProcessing-request
    (cl:cons ':on (on msg))
))
;//! \htmlinclude ToggleFilterProcessing-response.msg.html

(cl:defclass <ToggleFilterProcessing-response> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ToggleFilterProcessing-response (<ToggleFilterProcessing-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ToggleFilterProcessing-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ToggleFilterProcessing-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_localization-srv:<ToggleFilterProcessing-response> is deprecated: use robot_localization-srv:ToggleFilterProcessing-response instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <ToggleFilterProcessing-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_localization-srv:status-val is deprecated.  Use robot_localization-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ToggleFilterProcessing-response>) ostream)
  "Serializes a message object of type '<ToggleFilterProcessing-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'status) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ToggleFilterProcessing-response>) istream)
  "Deserializes a message object of type '<ToggleFilterProcessing-response>"
    (cl:setf (cl:slot-value msg 'status) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ToggleFilterProcessing-response>)))
  "Returns string type for a service object of type '<ToggleFilterProcessing-response>"
  "robot_localization/ToggleFilterProcessingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ToggleFilterProcessing-response)))
  "Returns string type for a service object of type 'ToggleFilterProcessing-response"
  "robot_localization/ToggleFilterProcessingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ToggleFilterProcessing-response>)))
  "Returns md5sum for a message object of type '<ToggleFilterProcessing-response>"
  "a8e1711976dcda1b8b978eee81e85498")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ToggleFilterProcessing-response)))
  "Returns md5sum for a message object of type 'ToggleFilterProcessing-response"
  "a8e1711976dcda1b8b978eee81e85498")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ToggleFilterProcessing-response>)))
  "Returns full string definition for message of type '<ToggleFilterProcessing-response>"
  (cl:format cl:nil "bool status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ToggleFilterProcessing-response)))
  "Returns full string definition for message of type 'ToggleFilterProcessing-response"
  (cl:format cl:nil "bool status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ToggleFilterProcessing-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ToggleFilterProcessing-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ToggleFilterProcessing-response
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ToggleFilterProcessing)))
  'ToggleFilterProcessing-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ToggleFilterProcessing)))
  'ToggleFilterProcessing-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ToggleFilterProcessing)))
  "Returns string type for a service object of type '<ToggleFilterProcessing>"
  "robot_localization/ToggleFilterProcessing")