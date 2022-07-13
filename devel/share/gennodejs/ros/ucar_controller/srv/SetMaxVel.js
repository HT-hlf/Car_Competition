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

class SetMaxVelRequest {
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
    // Serializes a message object of type SetMaxVelRequest
    // Serialize message field [max_linear_velocity]
    bufferOffset = _serializer.float64(obj.max_linear_velocity, buffer, bufferOffset);
    // Serialize message field [max_angular_velocity]
    bufferOffset = _serializer.float64(obj.max_angular_velocity, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetMaxVelRequest
    let len;
    let data = new SetMaxVelRequest(null);
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
    return 'ucar_controller/SetMaxVelRequest';
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
    const resolved = new SetMaxVelRequest(null);
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

class SetMaxVelResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetMaxVelResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetMaxVelResponse
    let len;
    let data = new SetMaxVelResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.message.length;
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ucar_controller/SetMaxVelResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '937c9679a518e3a18d831e57125ea522';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    string message
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetMaxVelResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: SetMaxVelRequest,
  Response: SetMaxVelResponse,
  md5sum() { return '62b58549939b0f5c8c78eafc0badef0e'; },
  datatype() { return 'ucar_controller/SetMaxVel'; }
};
