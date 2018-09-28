(setq env-init--package-list
      '(company
	go-mode
	go-snippets
	go-eldoc
	go-guru
	haskell-mode
	haskell-snippets
	;;ghc
	helm
	helm-core
	;;helm-circe
	helm-projectile
	markdown-mode
	jekyll-modes
	cmake-mode
	projectile
	projectile-codesearch
	pkg-info
	;;smex
	;;fish-mode
	;;idomenu
	;;kanban
	;;circe
	;;codesearch
	;;company-web
	;;epresent
	;;fish-mode
	org
	org-journal
	;;org-pandoc
	;;org-tree-slide
	;;php-mode
	; company-php
	lua-mode
	;; javascript & typescript
	js2-mode
	js2-refactor
	import-js
	js-import
	js-auto-format-mode
	js-doc
	jsfmt
	nodejs-repl
	typescript-mode
	tide
	;; other
	web-mode
	yaml-mode
	rust-mode
	;;rustfmt
	websocket
	;;xcscope
	sublime-themes
	material-theme
	window-numbering
	yasnippet
	company
	company-go
	company-jedi
	company-lua
	racer
	company-racer
	cargo
	company-tern
	irony
	irony-eldoc
	company-irony
	company-irony-c-headers
	;;ycmd
	;;company-ycmd
	flycheck
	flycheck-rust
	flycheck-haskell
	;;flycheck-ycmd
	flycheck-irony
	erlang
;;	python-environment
	;python-info
	;python3-info
	man-commands
	magit
	magit-popup
	dockerfile-mode
	exec-path-from-shell
	powerline))

(defun env-init--from-melpa ()
  "Develop environment init function"
  (interactive)
  (package-refresh-contents)
  (package-install 'org)
  (dolist (pkg env-init--package-list)
    (unless (package-installed-p pkg)
      (package-install pkg)))
  (when (and (package-installed-p 'company) (package-installed-p 'haskell-mode))
    (package-install 'company-ghc)
    (package-install 'company-ghci))
  (when (and (package-installed-p 'go-mode) (not (package-installed-p 'go-eldoc)))
    (package-install 'go-eldoc)))

(provide 'env-init-from-melpa)
