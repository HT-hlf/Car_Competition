;; Auto-generated. Do not edit!


(when (boundp 'ucar_controller::GetSensorTF)
  (if (not (find-package "UCAR_CONTROLLER"))
    (make-package "UCAR_CONTROLLER"))
  (shadow 'GetSensorTF (find-package "UCAR_CONTROLLER")))
(unless (find-package "UCAR_CONTROLLER::GETSENSORTF")
  (make-package "UCAR_CONTROLLER::GETSENSORTF"))
(unless (find-package "UCAR_CONTROLLER::GETSENSORTFREQUEST")
  (make-package "UCAR_CONTROLLER::GETSENSORTFREQUEST"))
(unless (find-package "UCAR_CONTROLLER::GETSENSORTFRESPONSE")
  (make-package "UCAR_CONTROLLER::GETSENSORTFRESPONSE"))

(in-package "ROS")





(defclass ucar_controller::GetSensorTFRequest
  :super ros::object
  :slots ())

(defmethod ucar_controller::GetSensorTFRequest
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

(defclass ucar_controller::GetSensorTFResponse
  :super ros::object
  :slots (_pose_x _pose_y _pose_z _euler_r _euler_p _euler_y ))

(defmethod ucar_controller::GetSensorTFResponse
  (:init
   (&key
    ((:pose_x __pose_x) 0.0)
    ((:pose_y __pose_y) 0.0)
    ((:pose_z __pose_z) 0.0)
    ((:euler_r __euler_r) 0.0)
    ((:euler_p __euler_p) 0.0)
    ((:euler_y __euler_y) 0.0)
    )
   (send-super :init)
   (setq _pose_x (float __pose_x))
   (setq _pose_y (float __pose_y))
   (setq _pose_z (float __pose_z))
   (setq _euler_r (float __euler_r))
   (setq _euler_p (float __euler_p))
   (setq _euler_y (float __euler_y))
   self)
  (:pose_x
   (&optional __pose_x)
   (if __pose_x (setq _pose_x __pose_x)) _pose_x)
  (:pose_y
   (&optional __pose_y)
   (if __pose_y (setq _pose_y __pose_y)) _pose_y)
  (:pose_z
   (&optional __pose_z)
   (if __pose_z (setq _pose_z __pose_z)) _pose_z)
  (:euler_r
   (&optional __euler_r)
   (if __euler_r (setq _euler_r __euler_r)) _euler_r)
  (:euler_p
   (&optional __euler_p)
   (if __euler_p (setq _euler_p __euler_p)) _euler_p)
  (:euler_y
   (&optional __euler_y)
   (if __euler_y (setq _euler_y __euler_y)) _euler_y)
  (:serialization-length
   ()
   (+
    ;; float64 _pose_x
    8
    ;; float64 _pose_y
    8
    ;; float64 _pose_z
    8
    ;; float64 _euler_r
    8
    ;; float64 _euler_p
    8
    ;; float64 _euler_y
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _pose_x
       (sys::poke _pose_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pose_y
       (sys::poke _pose_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pose_z
       (sys::poke _pose_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _euler_r
       (sys::poke _euler_r (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _euler_p
       (sys::poke _euler_p (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _euler_y
       (sys::poke _euler_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _pose_x
     (setq _pose_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pose_y
     (setq _pose_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pose_z
     (setq _pose_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _euler_r
     (setq _euler_r (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _euler_p
     (setq _euler_p (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _euler_y
     (setq _euler_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass ucar_controller::GetSensorTF
  :super ros::object
  :slots ())

(setf (get ucar_controller::GetSensorTF :md5sum-) "c539823f1bf23f7b686643f4bd7617b3")
(setf (get ucar_controller::GetSensorTF :datatype-) "ucar_controller/GetSensorTF")
(setf (get ucar_controller::GetSensorTF :request) ucar_controller::GetSensorTFRequest)
(setf (get ucar_controller::GetSensorTF :response) ucar_controller::GetSensorTFResponse)

(defmethod ucar_controller::GetSensorTFRequest
  (:response () (instance ucar_controller::GetSensorTFResponse :init)))

(setf (get ucar_controller::GetSensorTFRequest :md5sum-) "c539823f1bf23f7b686643f4bd7617b3")
(setf (get ucar_controller::GetSensorTFRequest :datatype-) "ucar_controller/GetSensorTFRequest")
(setf (get ucar_controller::GetSensorTFRequest :definition-)
      "
---
float64  pose_x
float64  pose_y
float64  pose_z
float64  euler_r
float64  euler_p
float64  euler_y
")

(setf (get ucar_controller::GetSensorTFResponse :md5sum-) "c539823f1bf23f7b686643f4bd7617b3")
(setf (get ucar_controller::GetSensorTFResponse :datatype-) "ucar_controller/GetSensorTFResponse")
(setf (get ucar_controller::GetSensorTFResponse :definition-)
      "
---
float64  pose_x
float64  pose_y
float64  pose_z
float64  euler_r
float64  euler_p
float64  euler_y
")



(provide :ucar_controller/GetSensorTF "c539823f1bf23f7b686643f4bd7617b3")


