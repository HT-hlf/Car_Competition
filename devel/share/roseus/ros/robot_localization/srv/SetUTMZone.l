;; Auto-generated. Do not edit!


(when (boundp 'robot_localization::SetUTMZone)
  (if (not (find-package "ROBOT_LOCALIZATION"))
    (make-package "ROBOT_LOCALIZATION"))
  (shadow 'SetUTMZone (find-package "ROBOT_LOCALIZATION")))
(unless (find-package "ROBOT_LOCALIZATION::SETUTMZONE")
  (make-package "ROBOT_LOCALIZATION::SETUTMZONE"))
(unless (find-package "ROBOT_LOCALIZATION::SETUTMZONEREQUEST")
  (make-package "ROBOT_LOCALIZATION::SETUTMZONEREQUEST"))
(unless (find-package "ROBOT_LOCALIZATION::SETUTMZONERESPONSE")
  (make-package "ROBOT_LOCALIZATION::SETUTMZONERESPONSE"))

(in-package "ROS")





(defclass robot_localization::SetUTMZoneRequest
  :super ros::object
  :slots (_utm_zone ))

(defmethod robot_localization::SetUTMZoneRequest
  (:init
   (&key
    ((:utm_zone __utm_zone) "")
    )
   (send-super :init)
   (setq _utm_zone (string __utm_zone))
   self)
  (:utm_zone
   (&optional __utm_zone)
   (if __utm_zone (setq _utm_zone __utm_zone)) _utm_zone)
  (:serialization-length
   ()
   (+
    ;; string _utm_zone
    4 (length _utm_zone)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _utm_zone
       (write-long (length _utm_zone) s) (princ _utm_zone s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _utm_zone
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _utm_zone (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robot_localization::SetUTMZoneResponse
  :super ros::object
  :slots ())

(defmethod robot_localization::SetUTMZoneResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass robot_localization::SetUTMZone
  :super ros::object
  :slots ())

(setf (get robot_localization::SetUTMZone :md5sum-) "893fd74d45efde020666acda18d3cccc")
(setf (get robot_localization::SetUTMZone :datatype-) "robot_localization/SetUTMZone")
(setf (get robot_localization::SetUTMZone :request) robot_localization::SetUTMZoneRequest)
(setf (get robot_localization::SetUTMZone :response) robot_localization::SetUTMZoneResponse)

(defmethod robot_localization::SetUTMZoneRequest
  (:response () (instance robot_localization::SetUTMZoneResponse :init)))

(setf (get robot_localization::SetUTMZoneRequest :md5sum-) "893fd74d45efde020666acda18d3cccc")
(setf (get robot_localization::SetUTMZoneRequest :datatype-) "robot_localization/SetUTMZoneRequest")
(setf (get robot_localization::SetUTMZoneRequest :definition-)
      "

string utm_zone
---

")

(setf (get robot_localization::SetUTMZoneResponse :md5sum-) "893fd74d45efde020666acda18d3cccc")
(setf (get robot_localization::SetUTMZoneResponse :datatype-) "robot_localization/SetUTMZoneResponse")
(setf (get robot_localization::SetUTMZoneResponse :definition-)
      "

string utm_zone
---

")



(provide :robot_localization/SetUTMZone "893fd74d45efde020666acda18d3cccc")


