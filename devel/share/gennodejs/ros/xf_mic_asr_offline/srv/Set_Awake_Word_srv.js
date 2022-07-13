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

class Set_Awake_Word_srvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.awake_word = null;
    }
    else {
      if (initObj.hasOwnProperty('awake_word')) {
        this.awake_word = initObj.awake_word
      }
      else {
        this.awake_word = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Set_Awake_Word_srvRequest
    // Serialize message field [awake_word]
    bufferOffset = _serializer.string(obj.awake_word, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Set_Awake_Word_srvRequest
    let len;
    let data = new Set_Awake_Word_srvRequest(null);
    // Deserialize message field [awake_word]
    data.awake_word = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.awake_word.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'xf_mic_asr_offline/Set_Awake_Word_srvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e4b7751b86b1463b7ade61da9ad51992';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string awake_word
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Set_Awake_Word_srvRequest(null);
    if (msg.awake_word !== undefined) {
      resolved.awake_word = msg.awake_word;
    }
    else {
      resolved.awake_word = ''
    }

    return resolved;
    }
};

class Set_Awake_Word_srvResponse {
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
    // Serializes a message object of type Set_Awake_Word_srvResponse
    // Serialize message field [result]
    bufferOffset = _serializer.string(obj.result, buffer, bufferOffset);
    // Serialize message field [fail_reason]
    bufferOffset = _serializer.string(obj.fail_reason, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Set_Awake_Word_srvResponse
    let len;
    let data = new Set_Awake_Word_srvResponse(null);
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
    return 'xf_mic_asr_offline/Set_Awake_Word_srvResponse';
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
    const resolved = new Set_Awake_Word_srvResponse(null);
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
  Request: Set_Awake_Word_srvRequest,
  Response: Set_Awake_Word_srvResponse,
  md5sum() { return '7e4b0be2dab296a055fbdac61a8ae954'; },
  datatype() { return 'xf_mic_asr_offline/Set_Awake_Word_srv'; }
};
