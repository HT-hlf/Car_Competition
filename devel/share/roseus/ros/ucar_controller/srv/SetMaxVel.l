;; Auto-generated. Do not edit!


(when (boundp 'ucar_controller::SetMaxVel)
  (if (not (find-package "UCAR_CONTROLLER"))
    (make-package "UCAR_CONTROLLER"))
  (shadow 'SetMaxVel (find-package "UCAR_CONTROLLER")))
(unless (find-package "UCAR_CONTROLLER::SETMAXVEL")
  (make-package "UCAR_CONTROLLER::SETMAXVEL"))
(unless (find-package "UCAR_CONTROLLER::SETMAXVELREQUEST")
  (make-package "UCAR_CONTROLLER::SETMAXVELREQUEST"))
(unless (find-package "UCAR_CONTROLLER::SETMAXVELRESPONSE")
  (make-package "UCAR_CONTROLLER::SETMAXVELRESPONSE"))

(in-package "ROS")





(defclass ucar_controller::SetMaxVelRequest
  :super ros::object
  :slots (_max_linear_velocity _max_angular_velocity ))

(defmethod ucar_controller::SetMaxVelRequest
  (:init
   (&key
    ((:max_linear_velocity __max_linear_velocity) 0.0)
    ((:max_angular_velocity __max_angular_velocity) 0.0)
    )
   (send-super :init)
   (setq _max_linear_velocity (float __max_linear_velocity))
   (setq _max_angular_velocity (float __max_angular_velocity))
   self)
  (:max_linear_velocity
   (&optional __max_linear_velocity)
   (if __max_linear_velocity (setq _max_linear_velocity __max_linear_velocity)) _max_linear_velocity)
  (:max_angular_velocity
   (&optional __max_angular_velocity)
   (if __max_angular_velocity (setq _max_angular_velocity __max_angular_velocity)) _max_angular_velocity)
  (:serialization-length
   ()
   (+
    ;; float64 _max_linear_velocity
    8
    ;; float64 _max_angular_velocity
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _max_linear_velocity
       (sys::poke _max_linear_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _max_angular_velocity
       (sys::poke _max_angular_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _max_linear_velocity
     (setq _max_linear_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _max_angular_velocity
     (setq _max_angular_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass ucar_controller::SetMaxVelResponse
  :super ros::object
  :slots (_success _message ))

(defmethod ucar_controller::SetMaxVelResponse
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

(defclass ucar_controller::SetMaxVel
  :super ros::object
  :slots ())

(setf (get ucar_controller::SetMaxVel :md5sum-) "62b58549939b0f5c8c78eafc0badef0e")
(setf (get ucar_controller::SetMaxVel :datatype-) "ucar_controller/SetMaxVel")
(setf (get ucar_controller::SetMaxVel :request) ucar_controller::SetMaxVelRequest)
(setf (get ucar_controller::SetMaxVel :response) ucar_controller::SetMaxVelResponse)

(defmethod ucar_controller::SetMaxVelRequest
  (:response () (instance ucar_controller::SetMaxVelResponse :init)))

(setf (get ucar_controller::SetMaxVelRequest :md5sum-) "62b58549939b0f5c8c78eafc0badef0e")
(setf (get ucar_controller::SetMaxVelRequest :datatype-) "ucar_controller/SetMaxVelRequest")
(setf (get ucar_controller::SetMaxVelRequest :definition-)
      "float64 max_linear_velocity
float64 max_angular_velocity
---
bool success
string message
")

(setf (get ucar_controller::SetMaxVelResponse :md5sum-) "62b58549939b0f5c8c78eafc0badef0e")
(setf (get ucar_controller::SetMaxVelResponse :datatype-) "ucar_controller/SetMaxVelResponse")
(setf (get ucar_controller::SetMaxVelResponse :definition-)
      "float64 max_linear_velocity
float64 max_angular_velocity
---
bool success
string message
")



(provide :ucar_controller/SetMaxVel "62b58549939b0f5c8c78eafc0badef0e")


