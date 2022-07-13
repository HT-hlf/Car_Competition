;; Auto-generated. Do not edit!


(when (boundp 'ucar_controller::GetMaxVel)
  (if (not (find-package "UCAR_CONTROLLER"))
    (make-package "UCAR_CONTROLLER"))
  (shadow 'GetMaxVel (find-package "UCAR_CONTROLLER")))
(unless (find-package "UCAR_CONTROLLER::GETMAXVEL")
  (make-package "UCAR_CONTROLLER::GETMAXVEL"))
(unless (find-package "UCAR_CONTROLLER::GETMAXVELREQUEST")
  (make-package "UCAR_CONTROLLER::GETMAXVELREQUEST"))
(unless (find-package "UCAR_CONTROLLER::GETMAXVELRESPONSE")
  (make-package "UCAR_CONTROLLER::GETMAXVELRESPONSE"))

(in-package "ROS")





(defclass ucar_controller::GetMaxVelRequest
  :super ros::object
  :slots ())

(defmethod ucar_controller::GetMaxVelRequest
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

(defclass ucar_controller::GetMaxVelResponse
  :super ros::object
  :slots (_max_linear_velocity _max_angular_velocity ))

(defmethod ucar_controller::GetMaxVelResponse
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

(defclass ucar_controller::GetMaxVel
  :super ros::object
  :slots ())

(setf (get ucar_controller::GetMaxVel :md5sum-) "c3d002ed0ab158592aaa625149bc3810")
(setf (get ucar_controller::GetMaxVel :datatype-) "ucar_controller/GetMaxVel")
(setf (get ucar_controller::GetMaxVel :request) ucar_controller::GetMaxVelRequest)
(setf (get ucar_controller::GetMaxVel :response) ucar_controller::GetMaxVelResponse)

(defmethod ucar_controller::GetMaxVelRequest
  (:response () (instance ucar_controller::GetMaxVelResponse :init)))

(setf (get ucar_controller::GetMaxVelRequest :md5sum-) "c3d002ed0ab158592aaa625149bc3810")
(setf (get ucar_controller::GetMaxVelRequest :datatype-) "ucar_controller/GetMaxVelRequest")
(setf (get ucar_controller::GetMaxVelRequest :definition-)
      "---
float64 max_linear_velocity
float64 max_angular_velocity
")

(setf (get ucar_controller::GetMaxVelResponse :md5sum-) "c3d002ed0ab158592aaa625149bc3810")
(setf (get ucar_controller::GetMaxVelResponse :datatype-) "ucar_controller/GetMaxVelResponse")
(setf (get ucar_controller::GetMaxVelResponse :definition-)
      "---
float64 max_linear_velocity
float64 max_angular_velocity
")



(provide :ucar_controller/GetMaxVel "c3d002ed0ab158592aaa625149bc3810")


