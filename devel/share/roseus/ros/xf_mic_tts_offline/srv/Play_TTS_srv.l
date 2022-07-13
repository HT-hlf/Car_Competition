;; Auto-generated. Do not edit!


(when (boundp 'xf_mic_tts_offline::Play_TTS_srv)
  (if (not (find-package "XF_MIC_TTS_OFFLINE"))
    (make-package "XF_MIC_TTS_OFFLINE"))
  (shadow 'Play_TTS_srv (find-package "XF_MIC_TTS_OFFLINE")))
(unless (find-package "XF_MIC_TTS_OFFLINE::PLAY_TTS_SRV")
  (make-package "XF_MIC_TTS_OFFLINE::PLAY_TTS_SRV"))
(unless (find-package "XF_MIC_TTS_OFFLINE::PLAY_TTS_SRVREQUEST")
  (make-package "XF_MIC_TTS_OFFLINE::PLAY_TTS_SRVREQUEST"))
(unless (find-package "XF_MIC_TTS_OFFLINE::PLAY_TTS_SRVRESPONSE")
  (make-package "XF_MIC_TTS_OFFLINE::PLAY_TTS_SRVRESPONSE"))

(in-package "ROS")





(defclass xf_mic_tts_offline::Play_TTS_srvRequest
  :super ros::object
  :slots (_text _speakerName ))

(defmethod xf_mic_tts_offline::Play_TTS_srvRequest
  (:init
   (&key
    ((:text __text) "")
    ((:speakerName __speakerName) "")
    )
   (send-super :init)
   (setq _text (string __text))
   (setq _speakerName (string __speakerName))
   self)
  (:text
   (&optional __text)
   (if __text (setq _text __text)) _text)
  (:speakerName
   (&optional __speakerName)
   (if __speakerName (setq _speakerName __speakerName)) _speakerName)
  (:serialization-length
   ()
   (+
    ;; string _text
    4 (length _text)
    ;; string _speakerName
    4 (length _speakerName)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _text
       (write-long (length _text) s) (princ _text s)
     ;; string _speakerName
       (write-long (length _speakerName) s) (princ _speakerName s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _text
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _text (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _speakerName
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _speakerName (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass xf_mic_tts_offline::Play_TTS_srvResponse
  :super ros::object
  :slots (_result _fail_reason ))

(defmethod xf_mic_tts_offline::Play_TTS_srvResponse
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

(defclass xf_mic_tts_offline::Play_TTS_srv
  :super ros::object
  :slots ())

(setf (get xf_mic_tts_offline::Play_TTS_srv :md5sum-) "a69a11dcb98f2002f416b83cdd55c128")
(setf (get xf_mic_tts_offline::Play_TTS_srv :datatype-) "xf_mic_tts_offline/Play_TTS_srv")
(setf (get xf_mic_tts_offline::Play_TTS_srv :request) xf_mic_tts_offline::Play_TTS_srvRequest)
(setf (get xf_mic_tts_offline::Play_TTS_srv :response) xf_mic_tts_offline::Play_TTS_srvResponse)

(defmethod xf_mic_tts_offline::Play_TTS_srvRequest
  (:response () (instance xf_mic_tts_offline::Play_TTS_srvResponse :init)))

(setf (get xf_mic_tts_offline::Play_TTS_srvRequest :md5sum-) "a69a11dcb98f2002f416b83cdd55c128")
(setf (get xf_mic_tts_offline::Play_TTS_srvRequest :datatype-) "xf_mic_tts_offline/Play_TTS_srvRequest")
(setf (get xf_mic_tts_offline::Play_TTS_srvRequest :definition-)
      "string text
string speakerName
---
string result
string fail_reason

")

(setf (get xf_mic_tts_offline::Play_TTS_srvResponse :md5sum-) "a69a11dcb98f2002f416b83cdd55c128")
(setf (get xf_mic_tts_offline::Play_TTS_srvResponse :datatype-) "xf_mic_tts_offline/Play_TTS_srvResponse")
(setf (get xf_mic_tts_offline::Play_TTS_srvResponse :definition-)
      "string text
string speakerName
---
string result
string fail_reason

")



(provide :xf_mic_tts_offline/Play_TTS_srv "a69a11dcb98f2002f416b83cdd55c128")


