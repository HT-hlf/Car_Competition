;; Auto-generated. Do not edit!


(when (boundp 'ht_msg::Ht)
  (if (not (find-package "HT_MSG"))
    (make-package "HT_MSG"))
  (shadow 'Ht (find-package "HT_MSG")))
(unless (find-package "HT_MSG::HT")
  (make-package "HT_MSG::HT"))

(in-package "ROS")
;;//! \htmlinclude Ht.msg.html


(defclass ht_msg::Ht
  :super ros::object
  :slots (_glasses_people _longhair_people ))

(defmethod ht_msg::Ht
  (:init
   (&key
    ((:glasses_people __glasses_people) 0)
    ((:longhair_people __longhair_people) 0)
    )
   (send-super :init)
   (setq _glasses_people (round __glasses_people))
   (setq _longhair_people (round __longhair_people))
   self)
  (:glasses_people
   (&optional __glasses_people)
   (if __glasses_people (setq _glasses_people __glasses_people)) _glasses_people)
  (:longhair_people
   (&optional __longhair_people)
   (if __longhair_people (setq _longhair_people __longhair_people)) _longhair_people)
  (:serialization-length
   ()
   (+
    ;; uint8 _glasses_people
    1
    ;; uint8 _longhair_people
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _glasses_people
       (write-byte _glasses_people s)
     ;; uint8 _longhair_people
       (write-byte _longhair_people s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _glasses_people
     (setq _glasses_people (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _longhair_people
     (setq _longhair_people (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ht_msg::Ht :md5sum-) "79e7595f09184171ab3ff74ad2c7b38d")
(setf (get ht_msg::Ht :datatype-) "ht_msg/Ht")
(setf (get ht_msg::Ht :definition-)
      "uint8 glasses_people
uint8 longhair_people

")



(provide :ht_msg/Ht "79e7595f09184171ab3ff74ad2c7b38d")


