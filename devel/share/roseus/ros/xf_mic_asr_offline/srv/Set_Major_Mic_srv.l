;; Auto-generated. Do not edit!


(when (boundp 'xf_mic_asr_offline::Set_Major_Mic_srv)
  (if (not (find-package "XF_MIC_ASR_OFFLINE"))
    (make-package "XF_MIC_ASR_OFFLINE"))
  (shadow 'Set_Major_Mic_srv (find-package "XF_MIC_ASR_OFFLINE")))
(unless (find-package "XF_MIC_ASR_OFFLINE::SET_MAJOR_MIC_SRV")
  (make-package "XF_MIC_ASR_OFFLINE::SET_MAJOR_MIC_SRV"))
(unless (find-package "XF_MIC_ASR_OFFLINE::SET_MAJOR_MIC_SRVREQUEST")
  (make-package "XF_MIC_ASR_OFFLINE::SET_MAJOR_MIC_SRVREQUEST"))
(unless (find-package "XF_MIC_ASR_OFFLINE::SET_MAJOR_MIC_SRVRESPONSE")
  (make-package "XF_MIC_ASR_OFFLINE::SET_MAJOR_MIC_SRVRESPONSE"))

(in-package "ROS")





(defclass xf_mic_asr_offline::Set_Major_Mic_srvRequest
  :super ros::object
  :slots (_mic_id ))

(defmethod xf_mic_asr_offline::Set_Major_Mic_srvRequest
  (:init
   (&key
    ((:mic_id __mic_id) 0)
    )
   (send-super :init)
   (setq _mic_id (round __mic_id))
   self)
  (:mic_id
   (&optional __mic_id)
   (if __mic_id (setq _mic_id __mic_id)) _mic_id)
  (:serialization-length
   ()
   (+
    ;; int8 _mic_id
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _mic_id
       (write-byte _mic_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _mic_id
     (setq _mic_id (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _mic_id 127) (setq _mic_id (- _mic_id 256)))
   ;;
   self)
  )

(defclass xf_mic_asr_offline::Set_Major_Mic_srvResponse
  :super ros::object
  :slots (_result _fail_reason ))

(defmethod xf_mic_asr_offline::Set_Major_Mic_srvResponse
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

(defclass xf_mic_asr_offline::Set_Major_Mic_srv
  :super ros::object
  :slots ())

(setf (get xf_mic_asr_offline::Set_Major_Mic_srv :md5sum-) "d2ed68567849558ac153b311326d297d")
(setf (get xf_mic_asr_offline::Set_Major_Mic_srv :datatype-) "xf_mic_asr_offline/Set_Major_Mic_srv")
(setf (get xf_mic_asr_offline::Set_Major_Mic_srv :request) xf_mic_asr_offline::Set_Major_Mic_srvRequest)
(setf (get xf_mic_asr_offline::Set_Major_Mic_srv :response) xf_mic_asr_offline::Set_Major_Mic_srvResponse)

(defmethod xf_mic_asr_offline::Set_Major_Mic_srvRequest
  (:response () (instance xf_mic_asr_offline::Set_Major_Mic_srvResponse :init)))

(setf (get xf_mic_asr_offline::Set_Major_Mic_srvRequest :md5sum-) "d2ed68567849558ac153b311326d297d")
(setf (get xf_mic_asr_offline::Set_Major_Mic_srvRequest :datatype-) "xf_mic_asr_offline/Set_Major_Mic_srvRequest")
(setf (get xf_mic_asr_offline::Set_Major_Mic_srvRequest :definition-)
      "int8 mic_id
---
string result
string fail_reason

")

(setf (get xf_mic_asr_offline::Set_Major_Mic_srvResponse :md5sum-) "d2ed68567849558ac153b311326d297d")
(setf (get xf_mic_asr_offline::Set_Major_Mic_srvResponse :datatype-) "xf_mic_asr_offline/Set_Major_Mic_srvResponse")
(setf (get xf_mic_asr_offline::Set_Major_Mic_srvResponse :definition-)
      "int8 mic_id
---
string result
string fail_reason

")



(provide :xf_mic_asr_offline/Set_Major_Mic_srv "d2ed68567849558ac153b311326d297d")


