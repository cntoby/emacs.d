(when (package-installed-p 'php-mode)
  (require 'php-mode)
  (add-hook 'php-mode-hook 'init-php-mode)
  )

(defun init-php-mode ()
  (when (and (package-installed-p 'ac-php) (featurep 'ac-config-default))
    (require 'ac-php)
    (auto-complete-mode t)
    (setq ac-sources '(ac-source-php))
    (define-key php-mode-map (kbd "C-]") 'ac-php-find-symbol-at-point) ; define
    (define-key php-mode-map (kbd "C-t") 'ac-php-location-stack-back) ; go back
    )
  )

(provide 'init-php)
