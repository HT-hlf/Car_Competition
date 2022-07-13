;; Auto-generated. Do not edit!


(when (boundp 'xf_mic_asr_offline::Start_Record_srv)
  (if (not (find-package "XF_MIC_ASR_OFFLINE"))
    (make-package "XF_MIC_ASR_OFFLINE"))
  (shadow 'Start_Record_srv (find-package "XF_MIC_ASR_OFFLINE")))
(unless (find-package "XF_MIC_ASR_OFFLINE::START_RECORD_SRV")
  (make-package "XF_MIC_ASR_OFFLINE::START_RECORD_SRV"))
(unless (find-package "XF_MIC_ASR_OFFLINE::START_RECORD_SRVREQUEST")
  (make-package "XF_MIC_ASR_OFFLINE::START_RECORD_SRVREQUEST"))
(unless (find-package "XF_MIC_ASR_OFFLINE::START_RECORD_SRVRESPONSE")
  (make-package "XF_MIC_ASR_OFFLINE::START_RECORD_SRVRESPONSE"))

(in-package "ROS")





(defclass xf_mic_asr_offline::Start_Record_srvRequest
  :super ros::object
  :slots (_whether_start ))

(defmethod xf_mic_asr_offline::Start_Record_srvRequest
  (:init
   (&key
    ((:whether_start __whether_start) 0)
    )
   (send-super :init)
   (setq _whether_start (round __whether_start))
   self)
  (:whether_start
   (&optional __whether_start)
   (if __whether_start (setq _whether_start __whether_start)) _whether_start)
  (:serialization-length
   ()
   (+
    ;; int8 _whether_start
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _whether_start
       (write-byte _whether_start s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _whether_start
     (setq _whether_start (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _whether_start 127) (setq _whether_start (- _whether_start 256)))
   ;;
   self)
  )

(defclass xf_mic_asr_offline::Start_Record_srvResponse
  :super ros::object
  :slots (_result _fail_reason ))

(defmethod xf_mic_asr_offline::Start_Record_srvResponse
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

(defclass xf_mic_asr_offline::Start_Record_srv
  :super ros::object
  :slots ())

(setf (get xf_mic_asr_offline::Start_Record_srv :md5sum-) "f1d612a6ac6a6d5f9f90acdc04ae715a")
(setf (get xf_mic_asr_offline::Start_Record_srv :datatype-) "xf_mic_asr_offline/Start_Record_srv")
(setf (get xf_mic_asr_offline::Start_Record_srv :request) xf_mic_asr_offline::Start_Record_srvRequest)
(setf (get xf_mic_asr_offline::Start_Record_srv :response) xf_mic_asr_offline::Start_Record_srvResponse)

(defmethod xf_mic_asr_offline::Start_Record_srvRequest
  (:response () (instance xf_mic_asr_offline::Start_Record_srvResponse :init)))

(setf (get xf_mic_asr_offline::Start_Record_srvRequest :md5sum-) "f1d612a6ac6a6d5f9f90acdc04ae715a")
(setf (get xf_mic_asr_offline::Start_Record_srvRequest :datatype-) "xf_mic_asr_offline/Start_Record_srvRequest")
(setf (get xf_mic_asr_offline::Start_Record_srvRequest :definition-)
      "int8 whether_start
---
string result
string fail_reason

")

(setf (get xf_mic_asr_offline::Start_Record_srvResponse :md5sum-) "f1d612a6ac6a6d5f9f90acdc04ae715a")
(setf (get xf_mic_asr_offline::Start_Record_srvResponse :datatype-) "xf_mic_asr_offline/Start_Record_srvResponse")
(setf (get xf_mic_asr_offline::Start_Record_srvResponse :definition-)
      "int8 whether_start
---
string result
string fail_reason

")



(provide :xf_mic_asr_offline/Start_Record_srv "f1d612a6ac6a6d5f9f90acdc04ae715a")


