(setq env-init--package-list
      '(company
	go-mode
	go-snippets
	;;go-eldoc
	haskell-mode
	haskell-snippets
	;;ghc
	helm
	helm-core
	;;helm-circe
	helm-projectile
	markdown-mode
	jekyll-modes
	projectile
	projectile-codesearch
	pkg-info
	;;smex
	;;fish-mode
	;;idomenu
	;;kanban
	;;circe
	;;codesearch
	;;company-go
	;;company-web
	;;epresent
	;;fish-mode
	org
	org-journal
	org-pandoc
	;;org-tree-slide
	php-mode
	lua-mode
	js2-mode
	typescript-mode
	web-mode
	yaml-mode
	websocket
	;;xcscope
	sublime-themes
	material-theme
	window-numbering
	yasnippet
	company
	ycmd
	company-ycmd
	flycheck
	flycheck-ycmd
	erlang
	python-environment
	python-info
	python3-info
	man-commands
	magit
	magit-popup
	exec-path-from-shell
	powerline))

(defun env-init--from-melpa ()
  "Develop environment init function"
  (interactive)
  (package-refresh-contents)
  (dolist (pkg env-init--package-list)
    (unless (package-installed-p pkg)
      (package-install pkg)))
  (when (and (package-installed-p 'company) (package-installed-p 'haskell-mode))
    (package-install 'company-ghc)
    (package-install 'company-ghci))
  (when (and (package-installed-p 'go-mode) (not (package-installed-p 'go-eldoc)))
    (package-install 'go-eldoc)))

(provide 'env-init-from-melpa)
