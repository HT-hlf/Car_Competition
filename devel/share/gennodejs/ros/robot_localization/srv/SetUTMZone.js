// Auto-generated. Do not edit!

// (in-package robot_localization.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetUTMZoneRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.utm_zone = null;
    }
    else {
      if (initObj.hasOwnProperty('utm_zone')) {
        this.utm_zone = initObj.utm_zone
      }
      else {
        this.utm_zone = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetUTMZoneRequest
    // Serialize message field [utm_zone]
    bufferOffset = _serializer.string(obj.utm_zone, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetUTMZoneRequest
    let len;
    let data = new SetUTMZoneRequest(null);
    // Deserialize message field [utm_zone]
    data.utm_zone = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.utm_zone.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_localization/SetUTMZoneRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '893fd74d45efde020666acda18d3cccc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    string utm_zone
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetUTMZoneRequest(null);
    if (msg.utm_zone !== undefined) {
      resolved.utm_zone = msg.utm_zone;
    }
    else {
      resolved.utm_zone = ''
    }

    return resolved;
    }
};

class SetUTMZoneResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetUTMZoneResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetUTMZoneResponse
    let len;
    let data = new SetUTMZoneResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_localization/SetUTMZoneResponse';
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
    const resolved = new SetUTMZoneResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: SetUTMZoneRequest,
  Response: SetUTMZoneResponse,
  md5sum() { return '893fd74d45efde020666acda18d3cccc'; },
  datatype() { return 'robot_localization/SetUTMZone'; }
};
