;; Auto-generated. Do not edit!


(when (boundp 'xf_mic_asr_offline::qidong)
  (if (not (find-package "XF_MIC_ASR_OFFLINE"))
    (make-package "XF_MIC_ASR_OFFLINE"))
  (shadow 'qidong (find-package "XF_MIC_ASR_OFFLINE")))
(unless (find-package "XF_MIC_ASR_OFFLINE::QIDONG")
  (make-package "XF_MIC_ASR_OFFLINE::QIDONG"))

(in-package "ROS")
;;//! \htmlinclude qidong.msg.html


(defclass xf_mic_asr_offline::qidong
  :super ros::object
  :slots (_data ))

(defmethod xf_mic_asr_offline::qidong
  (:init
   (&key
    ((:data __data) "")
    )
   (send-super :init)
   (setq _data (string __data))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; string _data
    4 (length _data)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _data
       (write-long (length _data) s) (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get xf_mic_asr_offline::qidong :md5sum-) "992ce8a1687cec8c8bd883ec73ca41d1")
(setf (get xf_mic_asr_offline::qidong :datatype-) "xf_mic_asr_offline/qidong")
(setf (get xf_mic_asr_offline::qidong :definition-)
      "string data

")



(provide :xf_mic_asr_offline/qidong "992ce8a1687cec8c8bd883ec73ca41d1")


