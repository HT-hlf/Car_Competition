;; Auto-generated. Do not edit!


(when (boundp 'xf_mic_asr_offline::Set_Awake_Word_srv)
  (if (not (find-package "XF_MIC_ASR_OFFLINE"))
    (make-package "XF_MIC_ASR_OFFLINE"))
  (shadow 'Set_Awake_Word_srv (find-package "XF_MIC_ASR_OFFLINE")))
(unless (find-package "XF_MIC_ASR_OFFLINE::SET_AWAKE_WORD_SRV")
  (make-package "XF_MIC_ASR_OFFLINE::SET_AWAKE_WORD_SRV"))
(unless (find-package "XF_MIC_ASR_OFFLINE::SET_AWAKE_WORD_SRVREQUEST")
  (make-package "XF_MIC_ASR_OFFLINE::SET_AWAKE_WORD_SRVREQUEST"))
(unless (find-package "XF_MIC_ASR_OFFLINE::SET_AWAKE_WORD_SRVRESPONSE")
  (make-package "XF_MIC_ASR_OFFLINE::SET_AWAKE_WORD_SRVRESPONSE"))

(in-package "ROS")





(defclass xf_mic_asr_offline::Set_Awake_Word_srvRequest
  :super ros::object
  :slots (_awake_word ))

(defmethod xf_mic_asr_offline::Set_Awake_Word_srvRequest
  (:init
   (&key
    ((:awake_word __awake_word) "")
    )
   (send-super :init)
   (setq _awake_word (string __awake_word))
   self)
  (:awake_word
   (&optional __awake_word)
   (if __awake_word (setq _awake_word __awake_word)) _awake_word)
  (:serialization-length
   ()
   (+
    ;; string _awake_word
    4 (length _awake_word)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _awake_word
       (write-long (length _awake_word) s) (princ _awake_word s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _awake_word
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _awake_word (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass xf_mic_asr_offline::Set_Awake_Word_srvResponse
  :super ros::object
  :slots (_result _fail_reason ))

(defmethod xf_mic_asr_offline::Set_Awake_Word_srvResponse
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

(defclass xf_mic_asr_offline::Set_Awake_Word_srv
  :super ros::object
  :slots ())

(setf (get xf_mic_asr_offline::Set_Awake_Word_srv :md5sum-) "7e4b0be2dab296a055fbdac61a8ae954")
(setf (get xf_mic_asr_offline::Set_Awake_Word_srv :datatype-) "xf_mic_asr_offline/Set_Awake_Word_srv")
(setf (get xf_mic_asr_offline::Set_Awake_Word_srv :request) xf_mic_asr_offline::Set_Awake_Word_srvRequest)
(setf (get xf_mic_asr_offline::Set_Awake_Word_srv :response) xf_mic_asr_offline::Set_Awake_Word_srvResponse)

(defmethod xf_mic_asr_offline::Set_Awake_Word_srvRequest
  (:response () (instance xf_mic_asr_offline::Set_Awake_Word_srvResponse :init)))

(setf (get xf_mic_asr_offline::Set_Awake_Word_srvRequest :md5sum-) "7e4b0be2dab296a055fbdac61a8ae954")
(setf (get xf_mic_asr_offline::Set_Awake_Word_srvRequest :datatype-) "xf_mic_asr_offline/Set_Awake_Word_srvRequest")
(setf (get xf_mic_asr_offline::Set_Awake_Word_srvRequest :definition-)
      "string awake_word
---
string result
string fail_reason

")

(setf (get xf_mic_asr_offline::Set_Awake_Word_srvResponse :md5sum-) "7e4b0be2dab296a055fbdac61a8ae954")
(setf (get xf_mic_asr_offline::Set_Awake_Word_srvResponse :datatype-) "xf_mic_asr_offline/Set_Awake_Word_srvResponse")
(setf (get xf_mic_asr_offline::Set_Awake_Word_srvResponse :definition-)
      "string awake_word
---
string result
string fail_reason

")



(provide :xf_mic_asr_offline/Set_Awake_Word_srv "7e4b0be2dab296a055fbdac61a8ae954")


