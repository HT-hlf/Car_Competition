; Auto-generated. Do not edit!


(cl:in-package robot_localization-srv)


;//! \htmlinclude ToLL-request.msg.html

(cl:defclass <ToLL-request> (roslisp-msg-protocol:ros-message)
  ((map_point
    :reader map_point
    :initarg :map_point
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point)))
)

(cl:defclass ToLL-request (<ToLL-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ToLL-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ToLL-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_localization-srv:<ToLL-request> is deprecated: use robot_localization-srv:ToLL-request instead.")))

(cl:ensure-generic-function 'map_point-val :lambda-list '(m))
(cl:defmethod map_point-val ((m <ToLL-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_localization-srv:map_point-val is deprecated.  Use robot_localization-srv:map_point instead.")
  (map_point m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ToLL-request>) ostream)
  "Serializes a message object of type '<ToLL-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'map_point) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ToLL-request>) istream)
  "Deserializes a message object of type '<ToLL-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'map_point) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ToLL-request>)))
  "Returns string type for a service object of type '<ToLL-request>"
  "robot_localization/ToLLRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ToLL-request)))
  "Returns string type for a service object of type 'ToLL-request"
  "robot_localization/ToLLRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ToLL-request>)))
  "Returns md5sum for a message object of type '<ToLL-request>"
  "ad0cbea3b8423e9ccf1b2ebeefc50b92")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ToLL-request)))
  "Returns md5sum for a message object of type 'ToLL-request"
  "ad0cbea3b8423e9ccf1b2ebeefc50b92")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ToLL-request>)))
  "Returns full string definition for message of type '<ToLL-request>"
  (cl:format cl:nil "geometry_msgs/Point map_point~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ToLL-request)))
  "Returns full string definition for message of type 'ToLL-request"
  (cl:format cl:nil "geometry_msgs/Point map_point~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ToLL-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'map_point))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ToLL-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ToLL-request
    (cl:cons ':map_point (map_point msg))
))
;//! \htmlinclude ToLL-response.msg.html

(cl:defclass <ToLL-response> (roslisp-msg-protocol:ros-message)
  ((ll_point
    :reader ll_point
    :initarg :ll_point
    :type geographic_msgs-msg:GeoPoint
    :initform (cl:make-instance 'geographic_msgs-msg:GeoPoint)))
)

(cl:defclass ToLL-response (<ToLL-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ToLL-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ToLL-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_localization-srv:<ToLL-response> is deprecated: use robot_localization-srv:ToLL-response instead.")))

(cl:ensure-generic-function 'll_point-val :lambda-list '(m))
(cl:defmethod ll_point-val ((m <ToLL-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_localization-srv:ll_point-val is deprecated.  Use robot_localization-srv:ll_point instead.")
  (ll_point m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ToLL-response>) ostream)
  "Serializes a message object of type '<ToLL-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'll_point) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ToLL-response>) istream)
  "Deserializes a message object of type '<ToLL-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'll_point) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ToLL-response>)))
  "Returns string type for a service object of type '<ToLL-response>"
  "robot_localization/ToLLResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ToLL-response)))
  "Returns string type for a service object of type 'ToLL-response"
  "robot_localization/ToLLResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ToLL-response>)))
  "Returns md5sum for a message object of type '<ToLL-response>"
  "ad0cbea3b8423e9ccf1b2ebeefc50b92")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ToLL-response)))
  "Returns md5sum for a message object of type 'ToLL-response"
  "ad0cbea3b8423e9ccf1b2ebeefc50b92")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ToLL-response>)))
  "Returns full string definition for message of type '<ToLL-response>"
  (cl:format cl:nil "geographic_msgs/GeoPoint ll_point~%~%~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ToLL-response)))
  "Returns full string definition for message of type 'ToLL-response"
  (cl:format cl:nil "geographic_msgs/GeoPoint ll_point~%~%~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ToLL-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'll_point))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ToLL-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ToLL-response
    (cl:cons ':ll_point (ll_point msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ToLL)))
  'ToLL-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ToLL)))
  'ToLL-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ToLL)))
  "Returns string type for a service object of type '<ToLL>"
  "robot_localization/ToLL")