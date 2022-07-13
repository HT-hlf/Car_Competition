;; Auto-generated. Do not edit!


(when (boundp 'ucar_controller::SetSensorTF)
  (if (not (find-package "UCAR_CONTROLLER"))
    (make-package "UCAR_CONTROLLER"))
  (shadow 'SetSensorTF (find-package "UCAR_CONTROLLER")))
(unless (find-package "UCAR_CONTROLLER::SETSENSORTF")
  (make-package "UCAR_CONTROLLER::SETSENSORTF"))
(unless (find-package "UCAR_CONTROLLER::SETSENSORTFREQUEST")
  (make-package "UCAR_CONTROLLER::SETSENSORTFREQUEST"))
(unless (find-package "UCAR_CONTROLLER::SETSENSORTFRESPONSE")
  (make-package "UCAR_CONTROLLER::SETSENSORTFRESPONSE"))

(in-package "ROS")





(defclass ucar_controller::SetSensorTFRequest
  :super ros::object
  :slots (_pose_x _pose_y _pose_z _euler_r _euler_p _euler_y ))

(defmethod ucar_controller::SetSensorTFRequest
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

(defclass ucar_controller::SetSensorTFResponse
  :super ros::object
  :slots (_success _message ))

(defmethod ucar_controller::SetSensorTFResponse
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

(defclass ucar_controller::SetSensorTF
  :super ros::object
  :slots ())

(setf (get ucar_controller::SetSensorTF :md5sum-) "a6cc398312db9fcdb32a0a56126c3fa5")
(setf (get ucar_controller::SetSensorTF :datatype-) "ucar_controller/SetSensorTF")
(setf (get ucar_controller::SetSensorTF :request) ucar_controller::SetSensorTFRequest)
(setf (get ucar_controller::SetSensorTF :response) ucar_controller::SetSensorTFResponse)

(defmethod ucar_controller::SetSensorTFRequest
  (:response () (instance ucar_controller::SetSensorTFResponse :init)))

(setf (get ucar_controller::SetSensorTFRequest :md5sum-) "a6cc398312db9fcdb32a0a56126c3fa5")
(setf (get ucar_controller::SetSensorTFRequest :datatype-) "ucar_controller/SetSensorTFRequest")
(setf (get ucar_controller::SetSensorTFRequest :definition-)
      "float64  pose_x
float64  pose_y
float64  pose_z
float64  euler_r
float64  euler_p
float64  euler_y
---
bool success
string message
")

(setf (get ucar_controller::SetSensorTFResponse :md5sum-) "a6cc398312db9fcdb32a0a56126c3fa5")
(setf (get ucar_controller::SetSensorTFResponse :datatype-) "ucar_controller/SetSensorTFResponse")
(setf (get ucar_controller::SetSensorTFResponse :definition-)
      "float64  pose_x
float64  pose_y
float64  pose_z
float64  euler_r
float64  euler_p
float64  euler_y
---
bool success
string message
")



(provide :ucar_controller/SetSensorTF "a6cc398312db9fcdb32a0a56126c3fa5")


