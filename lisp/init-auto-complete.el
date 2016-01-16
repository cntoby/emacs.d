;; for auto-complete
(when (package-installed-p 'auto-complete)
  (require 'auto-complete-config)
  (ac-config-default))


(provide 'init-auto-complete)
