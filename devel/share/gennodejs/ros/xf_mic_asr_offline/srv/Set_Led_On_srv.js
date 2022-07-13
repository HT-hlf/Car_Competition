// Auto-generated. Do not edit!

// (in-package xf_mic_asr_offline.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class Set_Led_On_srvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.led_id = null;
    }
    else {
      if (initObj.hasOwnProperty('led_id')) {
        this.led_id = initObj.led_id
      }
      else {
        this.led_id = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Set_Led_On_srvRequest
    // Serialize message field [led_id]
    bufferOffset = _serializer.int8(obj.led_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Set_Led_On_srvRequest
    let len;
    let data = new Set_Led_On_srvRequest(null);
    // Deserialize message field [led_id]
    data.led_id = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'xf_mic_asr_offline/Set_Led_On_srvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '140fe1e6ec825f25339d3d3cbb46c64d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 led_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Set_Led_On_srvRequest(null);
    if (msg.led_id !== undefined) {
      resolved.led_id = msg.led_id;
    }
    else {
      resolved.led_id = 0
    }

    return resolved;
    }
};

class Set_Led_On_srvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
      this.fail_reason = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = '';
      }
      if (initObj.hasOwnProperty('fail_reason')) {
        this.fail_reason = initObj.fail_reason
      }
      else {
        this.fail_reason = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Set_Led_On_srvResponse
    // Serialize message field [result]
    bufferOffset = _serializer.string(obj.result, buffer, bufferOffset);
    // Serialize message field [fail_reason]
    bufferOffset = _serializer.string(obj.fail_reason, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Set_Led_On_srvResponse
    let len;
    let data = new Set_Led_On_srvResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [fail_reason]
    data.fail_reason = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.result.length;
    length += object.fail_reason.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'xf_mic_asr_offline/Set_Led_On_srvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c69ca9071ec7e43db13595b361d43ae5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string result
    string fail_reason
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Set_Led_On_srvResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = ''
    }

    if (msg.fail_reason !== undefined) {
      resolved.fail_reason = msg.fail_reason;
    }
    else {
      resolved.fail_reason = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: Set_Led_On_srvRequest,
  Response: Set_Led_On_srvResponse,
  md5sum() { return '8714bec2ad75b727b5f6fac35cbcb6ff'; },
  datatype() { return 'xf_mic_asr_offline/Set_Led_On_srv'; }
};
