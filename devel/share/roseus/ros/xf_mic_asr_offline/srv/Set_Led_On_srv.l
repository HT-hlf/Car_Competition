;; Auto-generated. Do not edit!


(when (boundp 'xf_mic_asr_offline::Set_Led_On_srv)
  (if (not (find-package "XF_MIC_ASR_OFFLINE"))
    (make-package "XF_MIC_ASR_OFFLINE"))
  (shadow 'Set_Led_On_srv (find-package "XF_MIC_ASR_OFFLINE")))
(unless (find-package "XF_MIC_ASR_OFFLINE::SET_LED_ON_SRV")
  (make-package "XF_MIC_ASR_OFFLINE::SET_LED_ON_SRV"))
(unless (find-package "XF_MIC_ASR_OFFLINE::SET_LED_ON_SRVREQUEST")
  (make-package "XF_MIC_ASR_OFFLINE::SET_LED_ON_SRVREQUEST"))
(unless (find-package "XF_MIC_ASR_OFFLINE::SET_LED_ON_SRVRESPONSE")
  (make-package "XF_MIC_ASR_OFFLINE::SET_LED_ON_SRVRESPONSE"))

(in-package "ROS")





(defclass xf_mic_asr_offline::Set_Led_On_srvRequest
  :super ros::object
  :slots (_led_id ))

(defmethod xf_mic_asr_offline::Set_Led_On_srvRequest
  (:init
   (&key
    ((:led_id __led_id) 0)
    )
   (send-super :init)
   (setq _led_id (round __led_id))
   self)
  (:led_id
   (&optional __led_id)
   (if __led_id (setq _led_id __led_id)) _led_id)
  (:serialization-length
   ()
   (+
    ;; int8 _led_id
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _led_id
       (write-byte _led_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _led_id
     (setq _led_id (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _led_id 127) (setq _led_id (- _led_id 256)))
   ;;
   self)
  )

(defclass xf_mic_asr_offline::Set_Led_On_srvResponse
  :super ros::object
  :slots (_result _fail_reason ))

(defmethod xf_mic_asr_offline::Set_Led_On_srvResponse
  (:init
   (&key
    ((:result __result) "")
    ((:fail_reason __fail_reason) "")
    )
   (send-super :init)
   (setq _result (string __result))
   (setq _fail_reason (string __fail_reason))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:fail_reason
   (&optional __fail_reason)
   (if __fail_reason (setq _fail_reason __fail_reason)) _fail_reason)
  (:serialization-length
   ()
   (+
    ;; string _result
    4 (length _result)
    ;; string _fail_reason
    4 (length _fail_reason)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _result
       (write-long (length _result) s) (princ _result s)
     ;; string _fail_reason
       (write-long (length _fail_reason) s) (princ _fail_reason s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _result
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _result (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _fail_reason
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _fail_reason (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass xf_mic_asr_offline::Set_Led_On_srv
  :super ros::object
  :slots ())

(setf (get xf_mic_asr_offline::Set_Led_On_srv :md5sum-) "8714bec2ad75b727b5f6fac35cbcb6ff")
(setf (get xf_mic_asr_offline::Set_Led_On_srv :datatype-) "xf_mic_asr_offline/Set_Led_On_srv")
(setf (get xf_mic_asr_offline::Set_Led_On_srv :request) xf_mic_asr_offline::Set_Led_On_srvRequest)
(setf (get xf_mic_asr_offline::Set_Led_On_srv :response) xf_mic_asr_offline::Set_Led_On_srvResponse)

(defmethod xf_mic_asr_offline::Set_Led_On_srvRequest
  (:response () (instance xf_mic_asr_offline::Set_Led_On_srvResponse :init)))

(setf (get xf_mic_asr_offline::Set_Led_On_srvRequest :md5sum-) "8714bec2ad75b727b5f6fac35cbcb6ff")
(setf (get xf_mic_asr_offline::Set_Led_On_srvRequest :datatype-) "xf_mic_asr_offline/Set_Led_On_srvRequest")
(setf (get xf_mic_asr_offline::Set_Led_On_srvRequest :definition-)
      "int8 led_id
---
string result
string fail_reason

")

(setf (get xf_mic_asr_offline::Set_Led_On_srvResponse :md5sum-) "8714bec2ad75b727b5f6fac35cbcb6ff")
(setf (get xf_mic_asr_offline::Set_Led_On_srvResponse :datatype-) "xf_mic_asr_offline/Set_Led_On_srvResponse")
(setf (get xf_mic_asr_offline::Set_Led_On_srvResponse :definition-)
      "int8 led_id
---
string result
string fail_reason

")



(provide :xf_mic_asr_offline/Set_Led_On_srv "8714bec2ad75b727b5f6fac35cbcb6ff")


