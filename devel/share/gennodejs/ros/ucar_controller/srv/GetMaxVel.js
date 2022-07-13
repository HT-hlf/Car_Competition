// Auto-generated. Do not edit!

// (in-package ucar_controller.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GetMaxVelRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetMaxVelRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetMaxVelRequest
    let len;
    let data = new GetMaxVelRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ucar_controller/GetMaxVelRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetMaxVelRequest(null);
    return resolved;
    }
};

class GetMaxVelResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.max_linear_velocity = null;
      this.max_angular_velocity = null;
    }
    else {
      if (initObj.hasOwnProperty('max_linear_velocity')) {
        this.max_linear_velocity = initObj.max_linear_velocity
      }
      else {
        this.max_linear_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('max_angular_velocity')) {
        this.max_angular_velocity = initObj.max_angular_velocity
      }
      else {
        this.max_angular_velocity = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetMaxVelResponse
    // Serialize message field [max_linear_velocity]
    bufferOffset = _serializer.float64(obj.max_linear_velocity, buffer, bufferOffset);
    // Serialize message field [max_angular_velocity]
    bufferOffset = _serializer.float64(obj.max_angular_velocity, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetMaxVelResponse
    let len;
    let data = new GetMaxVelResponse(null);
    // Deserialize message field [max_linear_velocity]
    data.max_linear_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [max_angular_velocity]
    data.max_angular_velocity = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ucar_controller/GetMaxVelResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c3d002ed0ab158592aaa625149bc3810';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 max_linear_velocity
    float64 max_angular_velocity
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetMaxVelResponse(null);
    if (msg.max_linear_velocity !== undefined) {
      resolved.max_linear_velocity = msg.max_linear_velocity;
    }
    else {
      resolved.max_linear_velocity = 0.0
    }

    if (msg.max_angular_velocity !== undefined) {
      resolved.max_angular_velocity = msg.max_angular_velocity;
    }
    else {
      resolved.max_angular_velocity = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: GetMaxVelRequest,
  Response: GetMaxVelResponse,
  md5sum() { return 'c3d002ed0ab158592aaa625149bc3810'; },
  datatype() { return 'ucar_controller/GetMaxVel'; }
};
