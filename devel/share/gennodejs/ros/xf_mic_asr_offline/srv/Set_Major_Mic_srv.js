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

class Set_Major_Mic_srvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mic_id = null;
    }
    else {
      if (initObj.hasOwnProperty('mic_id')) {
        this.mic_id = initObj.mic_id
      }
      else {
        this.mic_id = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Set_Major_Mic_srvRequest
    // Serialize message field [mic_id]
    bufferOffset = _serializer.int8(obj.mic_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Set_Major_Mic_srvRequest
    let len;
    let data = new Set_Major_Mic_srvRequest(null);
    // Deserialize message field [mic_id]
    data.mic_id = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'xf_mic_asr_offline/Set_Major_Mic_srvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7f380dfab200f6a5cd81c0b74e87b242';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 mic_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Set_Major_Mic_srvRequest(null);
    if (msg.mic_id !== undefined) {
      resolved.mic_id = msg.mic_id;
    }
    else {
      resolved.mic_id = 0
    }

    return resolved;
    }
};

class Set_Major_Mic_srvResponse {
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
    // Serializes a message object of type Set_Major_Mic_srvResponse
    // Serialize message field [result]
    bufferOffset = _serializer.string(obj.result, buffer, bufferOffset);
    // Serialize message field [fail_reason]
    bufferOffset = _serializer.string(obj.fail_reason, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Set_Major_Mic_srvResponse
    let len;
    let data = new Set_Major_Mic_srvResponse(null);
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
    return 'xf_mic_asr_offline/Set_Major_Mic_srvResponse';
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
    const resolved = new Set_Major_Mic_srvResponse(null);
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
  Request: Set_Major_Mic_srvRequest,
  Response: Set_Major_Mic_srvResponse,
  md5sum() { return 'd2ed68567849558ac153b311326d297d'; },
  datatype() { return 'xf_mic_asr_offline/Set_Major_Mic_srv'; }
};
