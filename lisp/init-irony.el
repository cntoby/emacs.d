(when (package-installed-p 'irony) ;; must install developer tools, in mac os x, run `xcode-select --install' in terminal

  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
    
  (when (package-installed-p 'irony-eldoc)
    (add-hook 'irony-mode-hook 'irony-eldoc))
  (when (package-installed-p 'flycheck-irony)
    (eval-after-load 'flycheck
      '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))

  (defun my-company-irony-c ()
    (irony-mode)
    (when (package-installed-p 'company-irony)
      (unless (memq 'company-irony company-backends)
        (setq-local company-backends (cons 'company-irony company-backends))))
    (when (package-installed-p 'company-irony-c-headers)
      (unless (memq 'company-irony-c-headers company-backends)
        (setq-local company-backends (cons 'company-irony-c-headers company-backends)))))
  (add-hook 'c++-mode-hook #'my-company-irony-c)
  (add-hook 'c-mode-hook #'my-company-irony-c)
  (add-hook 'objc-mode-hook #'my-company-irony-c))
;; execute irony-install-server first time
(provide 'init-irony)
