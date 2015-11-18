(require 'package)

;; remove proxy settings
(setenv "http_proxy" nil)
(setenv "https_proxy" nil)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))
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
(require 'init-ycmd)
(require 'init-projectile)
(require 'init-helm)
(require 'init-go)
(require 'init-circe)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" default)))
 '(markdown-command
   "pandoc -f markdown -t html -s -—mathjax -—highlight-style pygments"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
