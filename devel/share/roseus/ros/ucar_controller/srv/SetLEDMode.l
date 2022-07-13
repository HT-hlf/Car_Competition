;; Auto-generated. Do not edit!


(when (boundp 'ucar_controller::SetLEDMode)
  (if (not (find-package "UCAR_CONTROLLER"))
    (make-package "UCAR_CONTROLLER"))
  (shadow 'SetLEDMode (find-package "UCAR_CONTROLLER")))
(unless (find-package "UCAR_CONTROLLER::SETLEDMODE")
  (make-package "UCAR_CONTROLLER::SETLEDMODE"))
(unless (find-package "UCAR_CONTROLLER::SETLEDMODEREQUEST")
  (make-package "UCAR_CONTROLLER::SETLEDMODEREQUEST"))
(unless (find-package "UCAR_CONTROLLER::SETLEDMODERESPONSE")
  (make-package "UCAR_CONTROLLER::SETLEDMODERESPONSE"))

(in-package "ROS")





(intern "*MODE_NORMAL*" (find-package "UCAR_CONTROLLER::SETLEDMODEREQUEST"))
(shadow '*MODE_NORMAL* (find-package "UCAR_CONTROLLER::SETLEDMODEREQUEST"))
(defconstant ucar_controller::SetLEDModeRequest::*MODE_NORMAL* 0)
(intern "*MODE_BLINK*" (find-package "UCAR_CONTROLLER::SETLEDMODEREQUEST"))
(shadow '*MODE_BLINK* (find-package "UCAR_CONTROLLER::SETLEDMODEREQUEST"))
(defconstant ucar_controller::SetLEDModeRequest::*MODE_BLINK* 1)
(intern "*MODE_BREATH*" (find-package "UCAR_CONTROLLER::SETLEDMODEREQUEST"))
(shadow '*MODE_BREATH* (find-package "UCAR_CONTROLLER::SETLEDMODEREQUEST"))
(defconstant ucar_controller::SetLEDModeRequest::*MODE_BREATH* 2)
(defclass ucar_controller::SetLEDModeRequest
  :super ros::object
  :slots (_mode_type _frequency _red_value _green_value _blue_value ))

(defmethod ucar_controller::SetLEDModeRequest
  (:init
   (&key
    ((:mode_type __mode_type) 0)
    ((:frequency __frequency) 0.0)
    ((:red_value __red_value) 0)
    ((:green_value __green_value) 0)
    ((:blue_value __blue_value) 0)
    )
   (send-super :init)
   (setq _mode_type (round __mode_type))
   (setq _frequency (float __frequency))
   (setq _red_value (round __red_value))
   (setq _green_value (round __green_value))
   (setq _blue_value (round __blue_value))
   self)
  (:mode_type
   (&optional __mode_type)
   (if __mode_type (setq _mode_type __mode_type)) _mode_type)
  (:frequency
   (&optional __frequency)
   (if __frequency (setq _frequency __frequency)) _frequency)
  (:red_value
   (&optional __red_value)
   (if __red_value (setq _red_value __red_value)) _red_value)
  (:green_value
   (&optional __green_value)
   (if __green_value (setq _green_value __green_value)) _green_value)
  (:blue_value
   (&optional __blue_value)
   (if __blue_value (setq _blue_value __blue_value)) _blue_value)
  (:serialization-length
   ()
   (+
    ;; uint8 _mode_type
    1
    ;; float64 _frequency
    8
    ;; uint8 _red_value
    1
    ;; uint8 _green_value
    1
    ;; uint8 _blue_value
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _mode_type
       (write-byte _mode_type s)
     ;; float64 _frequency
       (sys::poke _frequency (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _red_value
       (write-byte _red_value s)
     ;; uint8 _green_value
       (write-byte _green_value s)
     ;; uint8 _blue_value
       (write-byte _blue_value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _mode_type
     (setq _mode_type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _frequency
     (setq _frequency (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _red_value
     (setq _red_value (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _green_value
     (setq _green_value (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _blue_value
     (setq _blue_value (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass ucar_controller::SetLEDModeResponse
  :super ros::object
  :slots (_success _message ))

(defmethod ucar_controller::SetLEDModeResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ucar_controller::SetLEDMode
  :super ros::object
  :slots ())

(setf (get ucar_controller::SetLEDMode :md5sum-) "4964a3b2c6e612338ad6fbc54b65501d")
(setf (get ucar_controller::SetLEDMode :datatype-) "ucar_controller/SetLEDMode")
(setf (get ucar_controller::SetLEDMode :request) ucar_controller::SetLEDModeRequest)
(setf (get ucar_controller::SetLEDMode :response) ucar_controller::SetLEDModeResponse)

(defmethod ucar_controller::SetLEDModeRequest
  (:response () (instance ucar_controller::SetLEDModeResponse :init)))

(setf (get ucar_controller::SetLEDModeRequest :md5sum-) "4964a3b2c6e612338ad6fbc54b65501d")
(setf (get ucar_controller::SetLEDModeRequest :datatype-) "ucar_controller/SetLEDModeRequest")
(setf (get ucar_controller::SetLEDModeRequest :definition-)
      "uint8 MODE_NORMAL = 0
uint8 MODE_BLINK  = 1
uint8 MODE_BREATH = 2
uint8   mode_type
float64 frequency
uint8 red_value
uint8 green_value
uint8 blue_value
---
bool success
string message
")

(setf (get ucar_controller::SetLEDModeResponse :md5sum-) "4964a3b2c6e612338ad6fbc54b65501d")
(setf (get ucar_controller::SetLEDModeResponse :datatype-) "ucar_controller/SetLEDModeResponse")
(setf (get ucar_controller::SetLEDModeResponse :definition-)
      "uint8 MODE_NORMAL = 0
uint8 MODE_BLINK  = 1
uint8 MODE_BREATH = 2
uint8   mode_type
float64 frequency
uint8 red_value
uint8 green_value
uint8 blue_value
---
bool success
string message
")



(provide :ucar_controller/SetLEDMode "4964a3b2c6e612338ad6fbc54b65501d")


