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

class Get_Awake_Angle_srvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Get_Awake_Angle_srvRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Get_Awake_Angle_srvRequest
    let len;
    let data = new Get_Awake_Angle_srvRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'xf_mic_asr_offline/Get_Awake_Angle_srvRequest';
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
    const resolved = new Get_Awake_Angle_srvRequest(null);
    return resolved;
    }
};

class Get_Awake_Angle_srvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
      this.awake_angle = null;
      this.fail_reason = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = '';
      }
      if (initObj.hasOwnProperty('awake_angle')) {
        this.awake_angle = initObj.awake_angle
      }
      else {
        this.awake_angle = 0;
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
    // Serializes a message object of type Get_Awake_Angle_srvResponse
    // Serialize message field [result]
    bufferOffset = _serializer.string(obj.result, buffer, bufferOffset);
    // Serialize message field [awake_angle]
    bufferOffset = _serializer.int32(obj.awake_angle, buffer, bufferOffset);
    // Serialize message field [fail_reason]
    bufferOffset = _serializer.string(obj.fail_reason, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Get_Awake_Angle_srvResponse
    let len;
    let data = new Get_Awake_Angle_srvResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [awake_angle]
    data.awake_angle = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [fail_reason]
    data.fail_reason = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.result.length;
    length += object.fail_reason.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'xf_mic_asr_offline/Get_Awake_Angle_srvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '855bb7af07835de2687b3e34b41da9c3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string result
    int32 awake_angle
    string fail_reason
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Get_Awake_Angle_srvResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = ''
    }

    if (msg.awake_angle !== undefined) {
      resolved.awake_angle = msg.awake_angle;
    }
    else {
      resolved.awake_angle = 0
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
  Request: Get_Awake_Angle_srvRequest,
  Response: Get_Awake_Angle_srvResponse,
  md5sum() { return '855bb7af07835de2687b3e34b41da9c3'; },
  datatype() { return 'xf_mic_asr_offline/Get_Awake_Angle_srv'; }
};
