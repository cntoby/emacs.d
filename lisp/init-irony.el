(when (package-installed-p 'irony) ;; must install developer tools, in mac os x, run `xcode-select --install' in terminal
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (when (package-installed-p 'company-irony)
    (if (package-installed-p 'company-irony-c-headers)
	(progn
	  (eval-after-load 'company
	    '(add-to-list 'company-backends '(company-irony-c-headers company-irony))))
      (progn
	(eval-after-load 'company
	  '(add-to-list 'company-backends 'company-irony)))))
  (when (package-installed-p 'irony-eldoc)
    (add-hook 'irony-mode-hook 'irony-eldoc))
  (when (package-installed-p 'flycheck-irony)
    (eval-after-load 'flycheck
      '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))))
;; execute irony-install-server first time
(provide 'init-irony)