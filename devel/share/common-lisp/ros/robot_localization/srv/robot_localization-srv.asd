
(cl:in-package :asdf)

(defsystem "robot_localization-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geographic_msgs-msg
               :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "FromLL" :depends-on ("_package_FromLL"))
    (:file "_package_FromLL" :depends-on ("_package"))
    (:file "GetState" :depends-on ("_package_GetState"))
    (:file "_package_GetState" :depends-on ("_package"))
    (:file "SetDatum" :depends-on ("_package_SetDatum"))
    (:file "_package_SetDatum" :depends-on ("_package"))
    (:file "SetPose" :depends-on ("_package_SetPose"))
    (:file "_package_SetPose" :depends-on ("_package"))
    (:file "SetUTMZone" :depends-on ("_package_SetUTMZone"))
    (:file "_package_SetUTMZone" :depends-on ("_package"))
    (:file "ToLL" :depends-on ("_package_ToLL"))
    (:file "_package_ToLL" :depends-on ("_package"))
    (:file "ToggleFilterProcessing" :depends-on ("_package_ToggleFilterProcessing"))
    (:file "_package_ToggleFilterProcessing" :depends-on ("_package"))
  ))