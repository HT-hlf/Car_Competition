
"use strict";

let GetBatteryInfo = require('./GetBatteryInfo.js')
let GetSensorTF = require('./GetSensorTF.js')
let SetMaxVel = require('./SetMaxVel.js')
let SetLEDMode = require('./SetLEDMode.js')
let GetMaxVel = require('./GetMaxVel.js')
let SetSensorTF = require('./SetSensorTF.js')

module.exports = {
  GetBatteryInfo: GetBatteryInfo,
  GetSensorTF: GetSensorTF,
  SetMaxVel: SetMaxVel,
  SetLEDMode: SetLEDMode,
  GetMaxVel: GetMaxVel,
  SetSensorTF: SetSensorTF,
};
