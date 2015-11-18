(when (package-installed-p 'circe)
  (setq circe-network-options
	'(("Freenode"
	   :tls t
	   :nick "cntoby"
	   :sasl-username "cntoby"
	   :sasl-password ""
	   :channels ("#emacs-circe")))))

(provide 'init-circe)
