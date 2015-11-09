(when (package-installed-p 'company)
  (require 'company)
  (add-hook 'after-init-hook 'global-company-mode)
  (when (package-installed-p 'company-web) ; initialize company-web
    (require 'company-web)
    (require 'company-web-html)
    (require 'company-web-jade)
    (require 'company-web-slim)
;    (define-key web-mode-map (kbd "C-c /") 'company-web-html)
    )
  ;; improvement of company-mode
  (setq company-tooltip-limit 20)                       ; bigger popup window
  (setq company-tooltip-align-annotations 't)           ; align annotations to the right tooltip border
  (setq company-idle-delay .3)                          ; decrease delay before autocompletion popup shows
  (setq company-begin-commands '(self-insert-command))  ; start autocompletion only after typing
  (global-set-key (kbd "C-c /") 'company-files)         ; force complete file names on "C-c /" key
  )
(provide 'init-company)
