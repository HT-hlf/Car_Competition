; Auto-generated. Do not edit!


(cl:in-package robot_localization-srv)


;//! \htmlinclude FromLL-request.msg.html

(cl:defclass <FromLL-request> (roslisp-msg-protocol:ros-message)
  ((ll_point
    :reader ll_point
    :initarg :ll_point
    :type geographic_msgs-msg:GeoPoint
    :initform (cl:make-instance 'geographic_msgs-msg:GeoPoint)))
)

(cl:defclass FromLL-request (<FromLL-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FromLL-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FromLL-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_localization-srv:<FromLL-request> is deprecated: use robot_localization-srv:FromLL-request instead.")))

(cl:ensure-generic-function 'll_point-val :lambda-list '(m))
(cl:defmethod ll_point-val ((m <FromLL-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_localization-srv:ll_point-val is deprecated.  Use robot_localization-srv:ll_point instead.")
  (ll_point m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FromLL-request>) ostream)
  "Serializes a message object of type '<FromLL-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'll_point) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FromLL-request>) istream)
  "Deserializes a message object of type '<FromLL-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'll_point) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FromLL-request>)))
  "Returns string type for a service object of type '<FromLL-request>"
  "robot_localization/FromLLRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FromLL-request)))
  "Returns string type for a service object of type 'FromLL-request"
  "robot_localization/FromLLRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FromLL-request>)))
  "Returns md5sum for a message object of type '<FromLL-request>"
  "a6cd7064e35acbe3e4c3ac3dc5fd8265")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FromLL-request)))
  "Returns md5sum for a message object of type 'FromLL-request"
  "a6cd7064e35acbe3e4c3ac3dc5fd8265")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FromLL-request>)))
  "Returns full string definition for message of type '<FromLL-request>"
  (cl:format cl:nil "geographic_msgs/GeoPoint ll_point~%~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FromLL-request)))
  "Returns full string definition for message of type 'FromLL-request"
  (cl:format cl:nil "geographic_msgs/GeoPoint ll_point~%~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FromLL-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'll_point))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FromLL-request>))
  "Converts a ROS message object to a list"
  (cl:list 'FromLL-request
    (cl:cons ':ll_point (ll_point msg))
))
;//! \htmlinclude FromLL-response.msg.html

(cl:defclass <FromLL-response> (roslisp-msg-protocol:ros-message)
  ((map_point
    :reader map_point
    :initarg :map_point
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point)))
)

(cl:defclass FromLL-response (<FromLL-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FromLL-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FromLL-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_localization-srv:<FromLL-response> is deprecated: use robot_localization-srv:FromLL-response instead.")))

(cl:ensure-generic-function 'map_point-val :lambda-list '(m))
(cl:defmethod map_point-val ((m <FromLL-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_localization-srv:map_point-val is deprecated.  Use robot_localization-srv:map_point instead.")
  (map_point m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FromLL-response>) ostream)
  "Serializes a message object of type '<FromLL-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'map_point) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FromLL-response>) istream)
  "Deserializes a message object of type '<FromLL-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'map_point) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FromLL-response>)))
  "Returns string type for a service object of type '<FromLL-response>"
  "robot_localization/FromLLResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FromLL-response)))
  "Returns string type for a service object of type 'FromLL-response"
  "robot_localization/FromLLResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FromLL-response>)))
  "Returns md5sum for a message object of type '<FromLL-response>"
  "a6cd7064e35acbe3e4c3ac3dc5fd8265")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FromLL-response)))
  "Returns md5sum for a message object of type 'FromLL-response"
  "a6cd7064e35acbe3e4c3ac3dc5fd8265")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FromLL-response>)))
  "Returns full string definition for message of type '<FromLL-response>"
  (cl:format cl:nil "geometry_msgs/Point map_point~%~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FromLL-response)))
  "Returns full string definition for message of type 'FromLL-response"
  (cl:format cl:nil "geometry_msgs/Point map_point~%~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FromLL-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'map_point))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FromLL-response>))
  "Converts a ROS message object to a list"
  (cl:list 'FromLL-response
    (cl:cons ':map_point (map_point msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'FromLL)))
  'FromLL-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'FromLL)))
  'FromLL-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FromLL)))
  "Returns string type for a service object of type '<FromLL>"
  "robot_localization/FromLL")