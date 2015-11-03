(require 'package)

;; remove proxy settings
(setenv "http_proxy" nil)
(setenv "https_proxy" nil)
(if (display-graphic-p)
    (progn
      (add-to-list 'default-frame-alist '(tool-bar-lines . 0))
      (add-to-list 'default-frame-alist '(menu-bar-lines . 1))
      (add-to-list 'default-frame-alist '(width . 200))
      (add-to-list 'default-frame-alist '(height . 70))
      )
    (load-theme 'tango-dark)
  )

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; check and install markdown-mode
(unless (package-installed-p 'markdown-mode)
  (package-refresh-contents)
  (package-install 'markdown-mode)
  )
(autoload 'markdown-mode "markdown-mode" "Major mode for edting Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;;(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; check jekyll-modes
(unless (package-installed-p 'jekyll-modes)
  (package-refresh-contents)
  (package-install 'jekyll-modes)
  )
(add-to-list 'auto-mode-alist '("\\.md$" . jekyll-markdown-mode))
;;(add-to-list 'auto-mode-alist '("\\.html" . jekyll-html-mode))

;; check and install haskell-mode
(unless (package-installed-p 'haskell-mode)
  (package-refresh-contents)
  (package-install 'haskell-mode)
  )
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(unless (package-installed-p 'ac-php)
  (package-refresh-contents)
  (package-install 'ac-php)
  )
(add-hook 'php-mode-hook '(lambda ()
			    (auto-complete-mode t)
			    (require 'ac-php)
			    (setq ac-sources '(ac-source-php ))
			    (yas-global-mode 1)

			    (define-key php-mode-map (kbd "C-]") 'ac-php-find-symbol-at-point) ; goto define
			    (define-key php-mode-map (kbd "C-t") 'ac-php-location-stack-back ) ; go back
			    ))
	  


(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(unless (package-installed-p 'auto-complete)
  (package-refresh-contents)
  (package-install 'auto-complete)
  )
;; for auto-complete
(require 'auto-complete-config)
(ac-config-default)

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
