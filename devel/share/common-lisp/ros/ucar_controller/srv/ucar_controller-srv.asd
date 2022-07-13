
(cl:in-package :asdf)

(defsystem "ucar_controller-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "GetBatteryInfo" :depends-on ("_package_GetBatteryInfo"))
    (:file "_package_GetBatteryInfo" :depends-on ("_package"))
    (:file "GetMaxVel" :depends-on ("_package_GetMaxVel"))
    (:file "_package_GetMaxVel" :depends-on ("_package"))
    (:file "GetSensorTF" :depends-on ("_package_GetSensorTF"))
    (:file "_package_GetSensorTF" :depends-on ("_package"))
    (:file "SetLEDMode" :depends-on ("_package_SetLEDMode"))
    (:file "_package_SetLEDMode" :depends-on ("_package"))
    (:file "SetMaxVel" :depends-on ("_package_SetMaxVel"))
    (:file "_package_SetMaxVel" :depends-on ("_package"))
    (:file "SetSensorTF" :depends-on ("_package_SetSensorTF"))
    (:file "_package_SetSensorTF" :depends-on ("_package"))
  ))