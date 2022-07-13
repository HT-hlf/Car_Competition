;; Auto-generated. Do not edit!


(when (boundp 'ht_msg::Ht_n)
  (if (not (find-package "HT_MSG"))
    (make-package "HT_MSG"))
  (shadow 'Ht_n (find-package "HT_MSG")))
(unless (find-package "HT_MSG::HT_N")
  (make-package "HT_MSG::HT_N"))

(in-package "ROS")
;;//! \htmlinclude Ht_n.msg.html


(defclass ht_msg::Ht_n
  :super ros::object
  :slots (_glasses_people _longhair_people _sum_people ))

(defmethod ht_msg::Ht_n
  (:init
   (&key
    ((:glasses_people __glasses_people) 0)
    ((:longhair_people __longhair_people) 0)
    ((:sum_people __sum_people) 0)
    )
   (send-super :init)
   (setq _glasses_people (round __glasses_people))
   (setq _longhair_people (round __longhair_people))
   (setq _sum_people (round __sum_people))
   self)
  (:glasses_people
   (&optional __glasses_people)
   (if __glasses_people (setq _glasses_people __glasses_people)) _glasses_people)
  (:longhair_people
   (&optional __longhair_people)
   (if __longhair_people (setq _longhair_people __longhair_people)) _longhair_people)
  (:sum_people
   (&optional __sum_people)
   (if __sum_people (setq _sum_people __sum_people)) _sum_people)
  (:serialization-length
   ()
   (+
    ;; uint8 _glasses_people
    1
    ;; uint8 _longhair_people
    1
    ;; uint8 _sum_people
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
     ;; uint8 _sum_people
       (write-byte _sum_people s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _glasses_people
     (setq _glasses_people (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _longhair_people
     (setq _longhair_people (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _sum_people
     (setq _sum_people (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ht_msg::Ht_n :md5sum-) "0c743cff3054fd55978a5fd3eccc3803")
(setf (get ht_msg::Ht_n :datatype-) "ht_msg/Ht_n")
(setf (get ht_msg::Ht_n :definition-)
      "uint8 glasses_people
uint8 longhair_people
uint8 sum_people

")



(provide :ht_msg/Ht_n "0c743cff3054fd55978a5fd3eccc3803")


