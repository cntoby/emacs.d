(if (display-graphic-p)
    (progn
      ;; set chinese fonts
      ;; (use-cjk-char-width-table 'zh_CN)
      (setq fonts
	    (cond ((eq system-type 'darwin)     '("Monaco"    "STHeiti"))
		  ((eq system-type 'gnu/linux)  '("Menlo"     "WenQuanYi Zen Hei"))
		  ((eq system-type 'windows-nt) '("Consolas"  "Microsoft Yahei"))))
      (setq face-font-rescale-alist '(("STHeiti" . 1.1) ("Microsoft Yahei" . 1.1) ("WenQuanYi Zen Hei" . 1.1)))
      (set-face-attribute 'default nil :font
			  (format "%s:pixelsize=%d" (car fonts) 12))
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font (frame-parameter nil 'font) charset
			  (font-spec :family (car (cdr fonts)))))

      ;; set window size and position
      (add-to-list 'default-frame-alist '(tool-bar-lines . 0))
      (add-to-list 'default-frame-alist '(menu-bar-lines . 0))
      (scroll-bar-mode -1)
      (add-to-list 'default-frame-alist '(width . 200))
      (add-to-list 'default-frame-alist '(height . 63)) ; (frame-height) (frame-char-height) 
      ;;      (add-to-list 'default-frame-alist (cons 'left (/ (- (x-display-pixel-width) 200) (frame-char-width))))
      (add-to-list 'default-frame-alist (cons 'left (* 30 (frame-char-width)))) ;; new way to set left of the Emacs init window
      ;; init exec-path-from-shell for window based Emacs
      (when (package-installed-p 'exec-path-from-shell)
	(unless (featurep 'exec-path-from-shell-initialize)
	  (require 'exec-path-from-shell))
	(exec-path-from-shell-initialize))))

;(add-hook 'emacs-lisp-mode-hook
;	  'enable-paren-auto-pairs)

(add-hook 'after-init-hook 'enable-paren-auto-pairs)
;(global-set-key (kbd "C-m") nil)
(setq default-fill-column 80) ; limit line length to 80 character

(setq inhibit-startup-message t) ;; don't display the startup message
(global-linum-mode t) ;; show line number

(defun enable-paren-auto-pairs ()
  (interactive)
  (show-paren-mode)
  ;; automatically insert the right matching bracket
  (electric-pair-mode 1)
  (setq electric-pair-pairs
	'(
	  (?\" . ?\")
	  (?\{ . ?\})
	  )
	)
  )
(provide 'init-others)
