
(cl:in-package :asdf)

(defsystem "xf_mic_tts_offline-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Play_TTS_srv" :depends-on ("_package_Play_TTS_srv"))
    (:file "_package_Play_TTS_srv" :depends-on ("_package"))
  ))