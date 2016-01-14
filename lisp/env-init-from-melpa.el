(setq env-init--package-list
      '(company
	go-mode
	haskell-mode
	helm
	markdown-mode
	php-mode
	projectile
	;;smex
	sublime-themes
	material-theme
	window-numbering
	yasnippet
	go-snippets
	haskell-snippets
	ycmd
	company-ycmd
	flycheck
	flycheck-ycmd
	erlang
	python-info
	python3-info
	man-commands
	magit
	exec-path-from-shell))

(defun env-init-from-melpa ()
  "Develop environment init function"
  (interactive)
  (package-refresh-contents)
  (dolist (pkg env-init--package-list)
    (unless (package-installed-p pkg)
      (package-install pkg)))
  (when (and (package-installed-p 'company) (package-installed-p 'haskell-mode))
    (package-install 'company-ghc)
    (package-install 'company-ghci)))

(provide 'env-init-from-melpa)
