;; Auto-generated. Do not edit!


(when (boundp 'ht_msg::Ht_d)
  (if (not (find-package "HT_MSG"))
    (make-package "HT_MSG"))
  (shadow 'Ht_d (find-package "HT_MSG")))
(unless (find-package "HT_MSG::HT_D")
  (make-package "HT_MSG::HT_D"))

(in-package "ROS")
;;//! \htmlinclude Ht_d.msg.html


(defclass ht_msg::Ht_d
  :super ros::object
  :slots (_detect ))

(defmethod ht_msg::Ht_d
  (:init
   (&key
    ((:detect __detect) nil)
    )
   (send-super :init)
   (setq _detect __detect)
   self)
  (:detect
   (&optional __detect)
   (if __detect (setq _detect __detect)) _detect)
  (:serialization-length
   ()
   (+
    ;; bool _detect
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _detect
       (if _detect (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _detect
     (setq _detect (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ht_msg::Ht_d :md5sum-) "75e83bb3bd22c91435365dfc6ce294b7")
(setf (get ht_msg::Ht_d :datatype-) "ht_msg/Ht_d")
(setf (get ht_msg::Ht_d :definition-)
      "bool detect

")



(provide :ht_msg/Ht_d "75e83bb3bd22c91435365dfc6ce294b7")


