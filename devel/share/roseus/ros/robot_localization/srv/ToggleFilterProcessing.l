;; Auto-generated. Do not edit!


(when (boundp 'robot_localization::ToggleFilterProcessing)
  (if (not (find-package "ROBOT_LOCALIZATION"))
    (make-package "ROBOT_LOCALIZATION"))
  (shadow 'ToggleFilterProcessing (find-package "ROBOT_LOCALIZATION")))
(unless (find-package "ROBOT_LOCALIZATION::TOGGLEFILTERPROCESSING")
  (make-package "ROBOT_LOCALIZATION::TOGGLEFILTERPROCESSING"))
(unless (find-package "ROBOT_LOCALIZATION::TOGGLEFILTERPROCESSINGREQUEST")
  (make-package "ROBOT_LOCALIZATION::TOGGLEFILTERPROCESSINGREQUEST"))
(unless (find-package "ROBOT_LOCALIZATION::TOGGLEFILTERPROCESSINGRESPONSE")
  (make-package "ROBOT_LOCALIZATION::TOGGLEFILTERPROCESSINGRESPONSE"))

(in-package "ROS")





(defclass robot_localization::ToggleFilterProcessingRequest
  :super ros::object
  :slots (_on ))

(defmethod robot_localization::ToggleFilterProcessingRequest
  (:init
   (&key
    ((:on __on) nil)
    )
   (send-super :init)
   (setq _on __on)
   self)
  (:on
   (&optional __on)
   (if __on (setq _on __on)) _on)
  (:serialization-length
   ()
   (+
    ;; bool _on
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _on
       (if _on (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _on
     (setq _on (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robot_localization::ToggleFilterProcessingResponse
  :super ros::object
  :slots (_status ))

(defmethod robot_localization::ToggleFilterProcessingResponse
  (:init
   (&key
    ((:status __status) nil)
    )
   (send-super :init)
   (setq _status __status)
   self)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; bool _status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _status
       (if _status (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _status
     (setq _status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robot_localization::ToggleFilterProcessing
  :super ros::object
  :slots ())

(setf (get robot_localization::ToggleFilterProcessing :md5sum-) "a8e1711976dcda1b8b978eee81e85498")
(setf (get robot_localization::ToggleFilterProcessing :datatype-) "robot_localization/ToggleFilterProcessing")
(setf (get robot_localization::ToggleFilterProcessing :request) robot_localization::ToggleFilterProcessingRequest)
(setf (get robot_localization::ToggleFilterProcessing :response) robot_localization::ToggleFilterProcessingResponse)

(defmethod robot_localization::ToggleFilterProcessingRequest
  (:response () (instance robot_localization::ToggleFilterProcessingResponse :init)))

(setf (get robot_localization::ToggleFilterProcessingRequest :md5sum-) "a8e1711976dcda1b8b978eee81e85498")
(setf (get robot_localization::ToggleFilterProcessingRequest :datatype-) "robot_localization/ToggleFilterProcessingRequest")
(setf (get robot_localization::ToggleFilterProcessingRequest :definition-)
      "bool on
---
bool status

")

(setf (get robot_localization::ToggleFilterProcessingResponse :md5sum-) "a8e1711976dcda1b8b978eee81e85498")
(setf (get robot_localization::ToggleFilterProcessingResponse :datatype-) "robot_localization/ToggleFilterProcessingResponse")
(setf (get robot_localization::ToggleFilterProcessingResponse :definition-)
      "bool on
---
bool status

")



(provide :robot_localization/ToggleFilterProcessing "a8e1711976dcda1b8b978eee81e85498")


