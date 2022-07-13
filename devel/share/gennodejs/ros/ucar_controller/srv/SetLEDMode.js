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

class SetLEDModeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mode_type = null;
      this.frequency = null;
      this.red_value = null;
      this.green_value = null;
      this.blue_value = null;
    }
    else {
      if (initObj.hasOwnProperty('mode_type')) {
        this.mode_type = initObj.mode_type
      }
      else {
        this.mode_type = 0;
      }
      if (initObj.hasOwnProperty('frequency')) {
        this.frequency = initObj.frequency
      }
      else {
        this.frequency = 0.0;
      }
      if (initObj.hasOwnProperty('red_value')) {
        this.red_value = initObj.red_value
      }
      else {
        this.red_value = 0;
      }
      if (initObj.hasOwnProperty('green_value')) {
        this.green_value = initObj.green_value
      }
      else {
        this.green_value = 0;
      }
      if (initObj.hasOwnProperty('blue_value')) {
        this.blue_value = initObj.blue_value
      }
      else {
        this.blue_value = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetLEDModeRequest
    // Serialize message field [mode_type]
    bufferOffset = _serializer.uint8(obj.mode_type, buffer, bufferOffset);
    // Serialize message field [frequency]
    bufferOffset = _serializer.float64(obj.frequency, buffer, bufferOffset);
    // Serialize message field [red_value]
    bufferOffset = _serializer.uint8(obj.red_value, buffer, bufferOffset);
    // Serialize message field [green_value]
    bufferOffset = _serializer.uint8(obj.green_value, buffer, bufferOffset);
    // Serialize message field [blue_value]
    bufferOffset = _serializer.uint8(obj.blue_value, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetLEDModeRequest
    let len;
    let data = new SetLEDModeRequest(null);
    // Deserialize message field [mode_type]
    data.mode_type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [frequency]
    data.frequency = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [red_value]
    data.red_value = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [green_value]
    data.green_value = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [blue_value]
    data.blue_value = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ucar_controller/SetLEDModeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7dace3ee43f4ea4c87a956cb1454d456';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 MODE_NORMAL = 0
    uint8 MODE_BLINK  = 1
    uint8 MODE_BREATH = 2
    uint8   mode_type
    float64 frequency
    uint8 red_value
    uint8 green_value
    uint8 blue_value
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetLEDModeRequest(null);
    if (msg.mode_type !== undefined) {
      resolved.mode_type = msg.mode_type;
    }
    else {
      resolved.mode_type = 0
    }

    if (msg.frequency !== undefined) {
      resolved.frequency = msg.frequency;
    }
    else {
      resolved.frequency = 0.0
    }

    if (msg.red_value !== undefined) {
      resolved.red_value = msg.red_value;
    }
    else {
      resolved.red_value = 0
    }

    if (msg.green_value !== undefined) {
      resolved.green_value = msg.green_value;
    }
    else {
      resolved.green_value = 0
    }

    if (msg.blue_value !== undefined) {
      resolved.blue_value = msg.blue_value;
    }
    else {
      resolved.blue_value = 0
    }

    return resolved;
    }
};

// Constants for message
SetLEDModeRequest.Constants = {
  MODE_NORMAL: 0,
  MODE_BLINK: 1,
  MODE_BREATH: 2,
}

class SetLEDModeResponse {
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
    // Serializes a message object of type SetLEDModeResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetLEDModeResponse
    let len;
    let data = new SetLEDModeResponse(null);
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
    return 'ucar_controller/SetLEDModeResponse';
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
    const resolved = new SetLEDModeResponse(null);
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
  Request: SetLEDModeRequest,
  Response: SetLEDModeResponse,
  md5sum() { return '4964a3b2c6e612338ad6fbc54b65501d'; },
  datatype() { return 'ucar_controller/SetLEDMode'; }
};
