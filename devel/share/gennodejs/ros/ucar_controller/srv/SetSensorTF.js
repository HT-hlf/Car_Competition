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

class SetSensorTFRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pose_x = null;
      this.pose_y = null;
      this.pose_z = null;
      this.euler_r = null;
      this.euler_p = null;
      this.euler_y = null;
    }
    else {
      if (initObj.hasOwnProperty('pose_x')) {
        this.pose_x = initObj.pose_x
      }
      else {
        this.pose_x = 0.0;
      }
      if (initObj.hasOwnProperty('pose_y')) {
        this.pose_y = initObj.pose_y
      }
      else {
        this.pose_y = 0.0;
      }
      if (initObj.hasOwnProperty('pose_z')) {
        this.pose_z = initObj.pose_z
      }
      else {
        this.pose_z = 0.0;
      }
      if (initObj.hasOwnProperty('euler_r')) {
        this.euler_r = initObj.euler_r
      }
      else {
        this.euler_r = 0.0;
      }
      if (initObj.hasOwnProperty('euler_p')) {
        this.euler_p = initObj.euler_p
      }
      else {
        this.euler_p = 0.0;
      }
      if (initObj.hasOwnProperty('euler_y')) {
        this.euler_y = initObj.euler_y
      }
      else {
        this.euler_y = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetSensorTFRequest
    // Serialize message field [pose_x]
    bufferOffset = _serializer.float64(obj.pose_x, buffer, bufferOffset);
    // Serialize message field [pose_y]
    bufferOffset = _serializer.float64(obj.pose_y, buffer, bufferOffset);
    // Serialize message field [pose_z]
    bufferOffset = _serializer.float64(obj.pose_z, buffer, bufferOffset);
    // Serialize message field [euler_r]
    bufferOffset = _serializer.float64(obj.euler_r, buffer, bufferOffset);
    // Serialize message field [euler_p]
    bufferOffset = _serializer.float64(obj.euler_p, buffer, bufferOffset);
    // Serialize message field [euler_y]
    bufferOffset = _serializer.float64(obj.euler_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetSensorTFRequest
    let len;
    let data = new SetSensorTFRequest(null);
    // Deserialize message field [pose_x]
    data.pose_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pose_y]
    data.pose_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pose_z]
    data.pose_z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [euler_r]
    data.euler_r = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [euler_p]
    data.euler_p = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [euler_y]
    data.euler_y = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ucar_controller/SetSensorTFRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c539823f1bf23f7b686643f4bd7617b3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64  pose_x
    float64  pose_y
    float64  pose_z
    float64  euler_r
    float64  euler_p
    float64  euler_y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetSensorTFRequest(null);
    if (msg.pose_x !== undefined) {
      resolved.pose_x = msg.pose_x;
    }
    else {
      resolved.pose_x = 0.0
    }

    if (msg.pose_y !== undefined) {
      resolved.pose_y = msg.pose_y;
    }
    else {
      resolved.pose_y = 0.0
    }

    if (msg.pose_z !== undefined) {
      resolved.pose_z = msg.pose_z;
    }
    else {
      resolved.pose_z = 0.0
    }

    if (msg.euler_r !== undefined) {
      resolved.euler_r = msg.euler_r;
    }
    else {
      resolved.euler_r = 0.0
    }

    if (msg.euler_p !== undefined) {
      resolved.euler_p = msg.euler_p;
    }
    else {
      resolved.euler_p = 0.0
    }

    if (msg.euler_y !== undefined) {
      resolved.euler_y = msg.euler_y;
    }
    else {
      resolved.euler_y = 0.0
    }

    return resolved;
    }
};

class SetSensorTFResponse {
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
    // Serializes a message object of type SetSensorTFResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetSensorTFResponse
    let len;
    let data = new SetSensorTFResponse(null);
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
    return 'ucar_controller/SetSensorTFResponse';
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
    const resolved = new SetSensorTFResponse(null);
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
  Request: SetSensorTFRequest,
  Response: SetSensorTFResponse,
  md5sum() { return 'a6cc398312db9fcdb32a0a56126c3fa5'; },
  datatype() { return 'ucar_controller/SetSensorTF'; }
};
