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
  (setq company-tooltip-align-annotations t)            ; align annotations to the right tooltip border
  (setq company-idle-delay .3)                          ; decrease delay before autocompletion popup shows
  (setq company-echo-delay 0)                           ; remove annoying blinking
  (setq company-minimum-prefix-length 2)                ; 
  (setq company-begin-commands '(self-insert-command))  ; start autocompletion only after typing
  (custom-set-faces
   '(company-preview
     ((t (:foreground "darkgray" :underline t))))
   '(company-preview-common
     ((t (:inherit company-preview))))
   '(company-tooltip
     ((t (:background "lightgray" :foreground "black"))))
   '(company-tooltip-selection
     ((t (:background "steelblue" :foreground "white"))))
   '(company-tooltip-common
     ((((type x)) (:inherit company-tooltip :weight bold))
      (t (:inherit company-tooltip))))
   '(company-tooltip-common-selection
     ((((type x)) (:inherit company-tooltip-selection :weight bold))
      (t (:inherit company-tooltip-selection)))))
  (global-set-key (kbd "C-c /") 'company-files)         ; force complete file names on "C-c /" key
  )
(provide 'init-company)
