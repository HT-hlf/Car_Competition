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

class Ht_n {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.glasses_people = null;
      this.longhair_people = null;
      this.sum_people = null;
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
      if (initObj.hasOwnProperty('sum_people')) {
        this.sum_people = initObj.sum_people
      }
      else {
        this.sum_people = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Ht_n
    // Serialize message field [glasses_people]
    bufferOffset = _serializer.uint8(obj.glasses_people, buffer, bufferOffset);
    // Serialize message field [longhair_people]
    bufferOffset = _serializer.uint8(obj.longhair_people, buffer, bufferOffset);
    // Serialize message field [sum_people]
    bufferOffset = _serializer.uint8(obj.sum_people, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Ht_n
    let len;
    let data = new Ht_n(null);
    // Deserialize message field [glasses_people]
    data.glasses_people = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [longhair_people]
    data.longhair_people = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [sum_people]
    data.sum_people = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 3;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ht_msg/Ht_n';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0c743cff3054fd55978a5fd3eccc3803';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 glasses_people
    uint8 longhair_people
    uint8 sum_people
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Ht_n(null);
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

    if (msg.sum_people !== undefined) {
      resolved.sum_people = msg.sum_people;
    }
    else {
      resolved.sum_people = 0
    }

    return resolved;
    }
};

module.exports = Ht_n;
