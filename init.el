(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;(add-to-list 'package-archives
;	     '("melpa" . "https://melpa.org/packages/"))
;(when (< emacs-major-version 24)
;  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
;(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
;                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;(when (string-equal system-type "darwin")
;  (let ((default-directory "/usr/local/share/emacs/site-lisp/"))
;    (normal-top-level-add-subdirs-to-load-path)))
;(setq server-use-tcp t)
(menu-bar-mode -1)
(require 'env-init-from-melpa)
(require 'init-others)
(require 'init-themes)
(require 'init-org-mode)
(require 'init-yasnippet)
(require 'init-php)
(require 'init-haskell)
(require 'init-markdown)  
(require 'init-semantic)
(require 'init-window-nubmering)
; (require 'init-smex) ; disabled smex, use helm
(require 'init-company)
;(require 'init-ycmd)
(require 'init-projectile)
(require 'init-helm)
(require 'init-go)
(require 'init-python)
(require 'init-rust)
(require 'init-lua)
(require 'init-irony)
(require 'init-circe)
(require 'init-erlang)
(require 'init-typescript)
(require 'init-magit)
(require 'init-powerline)
(require 'init-js)
(require 'init-elm)
					;(require 'init-blog-admin)
(require 'init-hexo)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" default))
 '(package-selected-packages
   '(poly-markdown latex-extra latex-math-preview latex-pretty-symbols latex-preview-pane latex-unicode-math-mode auctex auctex-latexmk hexo company-plsense flycheck-golangci-lint flycheck-perl6 flymake-php flymake-shell perl6-mode company-quickhelp format-all import-js js-auto-format-mode js-doc js-import jsfmt tide typescript-mode docker-compose-mode js2-refactor xref-js2 cargo kotlin-mode elm-mode elm-yasnippets nodejs-repl company-php yaml-mode window-numbering websocket web-mode sublime-themes rustfmt racer projectile-codesearch powerline org-pandoc org-journal omnisharp material-theme markdown-mode man-commands magit js2-mode jekyll-modes irony-eldoc helm-projectile haskell-snippets go-snippets go-eldoc flycheck-rust flycheck-irony flycheck-haskell exec-path-from-shell erlang dockerfile-mode company-tern company-racer company-lua company-jedi company-irony-c-headers company-irony company-go company-ghci company-ghc cmake-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-tooltip ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "steelblue" :foreground "white")))))
