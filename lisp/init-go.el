(when (package-installed-p 'go-mode)
  (require 'go-mode)
  (add-hook 'go-mode-hook (lambda ()
			    (local-set-key (kbd "M-.") #'godef-jump)))
  (add-hook 'before-save-hook #'gofmt-before-save) ; format code before save
  (add-hook 'go-mode-hook (lambda ()
			    (local-set-key (kbd "C-c i") 'go-goto-imports)
			    (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

  (when (package-installed-p 'go-eldoc)
    (require 'go-eldoc)
    (add-hook 'go-mode-hook 'go-eldoc-setup)
    (set-face-attribute 'eldoc-highlight-function-argument nil
			:underline t :foreground "green"
			:weight 'bold))
  (when (package-installed-p 'go-snippets)
    (require 'go-snippets))
  (when (memq window-system '(mac ns))
    (when (featurep 'exec-path-from-shell-initialize)
      (exec-path-from-shell-copy-env "GOPATH")))
  (when (package-installed-p 'go-guru)
    (require 'go-guru)
    (go-guru-hl-identifier-mode)
    (add-hook 'go-mode-hook #'go-guru-hl-identifier-mode))
  (when (package-installed-p 'company-go)
    (require 'company-go)
    (add-hook 'go-mode-hook
	      (lambda ()
		 (set (make-local-variable 'company-backends) '(company-go))
		 (company-mode))))
  ;(when (package-installed-p 'flycheck)
  ;  (add-hook 'go-mode-hook 'flycheck-mode))
  )
(provide 'init-go)
