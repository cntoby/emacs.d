(when (package-installed-p 'go-mode)
  (setenv "GOPATH" (expand-file-name "~/Devel/goprojects/"))
  (require 'go-mode-autoloads)
  (add-hook 'go-mode-hook (lambda ()
			    (local-set-key (kbd "M-.") #'godef-jump)))
  (add-hook 'before-save-hook #'gofmt-before-save) ; format code before save

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
      (exec-path-from-shell-copy-env "GOPATH"))))
(provide 'init-go)
