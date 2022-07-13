// Auto-generated. Do not edit!

// (in-package ht_msg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Ht {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.glasses_people = null;
      this.longhair_people = null;
    }
    else {
      if (initObj.hasOwnProperty('glasses_people')) {
        this.glasses_people = initObj.glasses_people
      }
      else {
        this.glasses_people = 0;
      }
      if (initObj.hasOwnProperty('longhair_people')) {
        this.longhair_people = initObj.longhair_people
      }
      else {
        this.longhair_people = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Ht
    // Serialize message field [glasses_people]
    bufferOffset = _serializer.uint8(obj.glasses_people, buffer, bufferOffset);
    // Serialize message field [longhair_people]
    bufferOffset = _serializer.uint8(obj.longhair_people, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Ht
    let len;
    let data = new Ht(null);
    // Deserialize message field [glasses_people]
    data.glasses_people = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [longhair_people]
    data.longhair_people = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ht_msg/Ht';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '79e7595f09184171ab3ff74ad2c7b38d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 glasses_people
    uint8 longhair_people
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Ht(null);
    if (msg.glasses_people !== undefined) {
      resolved.glasses_people = msg.glasses_people;
    }
    else {
      resolved.glasses_people = 0
    }

    if (msg.longhair_people !== undefined) {
      resolved.longhair_people = msg.longhair_people;
    }
    else {
      resolved.longhair_people = 0
    }

    return resolved;
    }
};

module.exports = Ht;
