// Auto-generated. Do not edit!

// (in-package robot_localization.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

let geographic_msgs = _finder('geographic_msgs');

//-----------------------------------------------------------

class ToLLRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.map_point = null;
    }
    else {
      if (initObj.hasOwnProperty('map_point')) {
        this.map_point = initObj.map_point
      }
      else {
        this.map_point = new geometry_msgs.msg.Point();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ToLLRequest
    // Serialize message field [map_point]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.map_point, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ToLLRequest
    let len;
    let data = new ToLLRequest(null);
    // Deserialize message field [map_point]
    data.map_point = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_localization/ToLLRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '326fc0ec1385c52a253c06e024d9f49e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point map_point
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ToLLRequest(null);
    if (msg.map_point !== undefined) {
      resolved.map_point = geometry_msgs.msg.Point.Resolve(msg.map_point)
    }
    else {
      resolved.map_point = new geometry_msgs.msg.Point()
    }

    return resolved;
    }
};

class ToLLResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ll_point = null;
    }
    else {
      if (initObj.hasOwnProperty('ll_point')) {
        this.ll_point = initObj.ll_point
      }
      else {
        this.ll_point = new geographic_msgs.msg.GeoPoint();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ToLLResponse
    // Serialize message field [ll_point]
    bufferOffset = geographic_msgs.msg.GeoPoint.serialize(obj.ll_point, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ToLLResponse
    let len;
    let data = new ToLLResponse(null);
    // Deserialize message field [ll_point]
    data.ll_point = geographic_msgs.msg.GeoPoint.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_localization/ToLLResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '191f0513cae6fcb95b63e2ec2e976938';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geographic_msgs/GeoPoint ll_point
    
    
    ================================================================================
    MSG: geographic_msgs/GeoPoint
    # Geographic point, using the WGS 84 reference ellipsoid.
    
    # Latitude [degrees]. Positive is north of equator; negative is south
    # (-90 <= latitude <= +90).
    float64 latitude
    
    # Longitude [degrees]. Positive is east of prime meridian; negative is
    # west (-180 <= longitude <= +180). At the poles, latitude is -90 or
    # +90, and longitude is irrelevant, but must be in range.
    float64 longitude
    
    # Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).
    float64 altitude
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ToLLResponse(null);
    if (msg.ll_point !== undefined) {
      resolved.ll_point = geographic_msgs.msg.GeoPoint.Resolve(msg.ll_point)
    }
    else {
      resolved.ll_point = new geographic_msgs.msg.GeoPoint()
    }

    return resolved;
    }
};

module.exports = {
  Request: ToLLRequest,
  Response: ToLLResponse,
  md5sum() { return 'ad0cbea3b8423e9ccf1b2ebeefc50b92'; },
  datatype() { return 'robot_localization/ToLL'; }
};
