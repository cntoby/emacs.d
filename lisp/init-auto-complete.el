(unless (package-installed-p 'auto-complete)
  (package-install 'auto-complete)
  )
;; for auto-complete
(require 'auto-complete-config)
(ac-config-default)

(provide 'init-auto-complete)
