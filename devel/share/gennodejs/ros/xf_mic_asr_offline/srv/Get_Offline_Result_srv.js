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

class Get_Offline_Result_srvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.offline_recognise_start = null;
      this.confidence_threshold = null;
      this.time_per_order = null;
    }
    else {
      if (initObj.hasOwnProperty('offline_recognise_start')) {
        this.offline_recognise_start = initObj.offline_recognise_start
      }
      else {
        this.offline_recognise_start = 0;
      }
      if (initObj.hasOwnProperty('confidence_threshold')) {
        this.confidence_threshold = initObj.confidence_threshold
      }
      else {
        this.confidence_threshold = 0;
      }
      if (initObj.hasOwnProperty('time_per_order')) {
        this.time_per_order = initObj.time_per_order
      }
      else {
        this.time_per_order = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Get_Offline_Result_srvRequest
    // Serialize message field [offline_recognise_start]
    bufferOffset = _serializer.int8(obj.offline_recognise_start, buffer, bufferOffset);
    // Serialize message field [confidence_threshold]
    bufferOffset = _serializer.int8(obj.confidence_threshold, buffer, bufferOffset);
    // Serialize message field [time_per_order]
    bufferOffset = _serializer.int8(obj.time_per_order, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Get_Offline_Result_srvRequest
    let len;
    let data = new Get_Offline_Result_srvRequest(null);
    // Deserialize message field [offline_recognise_start]
    data.offline_recognise_start = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [confidence_threshold]
    data.confidence_threshold = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [time_per_order]
    data.time_per_order = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 3;
  }

  static datatype() {
    // Returns string type for a service object
    return 'xf_mic_asr_offline/Get_Offline_Result_srvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '820f3ed766cd949404133c9745d8edac';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 offline_recognise_start
    int8 confidence_threshold
    int8 time_per_order
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Get_Offline_Result_srvRequest(null);
    if (msg.offline_recognise_start !== undefined) {
      resolved.offline_recognise_start = msg.offline_recognise_start;
    }
    else {
      resolved.offline_recognise_start = 0
    }

    if (msg.confidence_threshold !== undefined) {
      resolved.confidence_threshold = msg.confidence_threshold;
    }
    else {
      resolved.confidence_threshold = 0
    }

    if (msg.time_per_order !== undefined) {
      resolved.time_per_order = msg.time_per_order;
    }
    else {
      resolved.time_per_order = 0
    }

    return resolved;
    }
};

class Get_Offline_Result_srvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
      this.fail_reason = null;
      this.text = null;
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
      if (initObj.hasOwnProperty('text')) {
        this.text = initObj.text
      }
      else {
        this.text = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Get_Offline_Result_srvResponse
    // Serialize message field [result]
    bufferOffset = _serializer.string(obj.result, buffer, bufferOffset);
    // Serialize message field [fail_reason]
    bufferOffset = _serializer.string(obj.fail_reason, buffer, bufferOffset);
    // Serialize message field [text]
    bufferOffset = _serializer.string(obj.text, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Get_Offline_Result_srvResponse
    let len;
    let data = new Get_Offline_Result_srvResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [fail_reason]
    data.fail_reason = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [text]
    data.text = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.result.length;
    length += object.fail_reason.length;
    length += object.text.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'xf_mic_asr_offline/Get_Offline_Result_srvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3d345f7c38cbf099d9598b4c8bbccd33';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string result
    string fail_reason
    string text
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Get_Offline_Result_srvResponse(null);
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

    if (msg.text !== undefined) {
      resolved.text = msg.text;
    }
    else {
      resolved.text = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: Get_Offline_Result_srvRequest,
  Response: Get_Offline_Result_srvResponse,
  md5sum() { return '28bc8539466b604fc9101f0b3a34c375'; },
  datatype() { return 'xf_mic_asr_offline/Get_Offline_Result_srv'; }
};
