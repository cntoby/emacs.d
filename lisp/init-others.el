(if (display-graphic-p)
    (progn
      (add-to-list 'default-frame-alist '(tool-bar-lines . 0))
      (add-to-list 'default-frame-alist '(menu-bar-lines . 1))
      (scroll-bar-mode -1)
      (add-to-list 'default-frame-alist '(width . 200))
      (add-to-list 'default-frame-alist '(height . 70))
      ;;      (add-to-list 'default-frame-alist (cons 'left (/ (- (x-display-pixel-width) 200) (frame-char-width))))
      (add-to-list 'default-frame-alist (cons 'left (* 30 (frame-char-width)))) ;; new way to set left of the Emacs init window
      )
  )

;(add-hook 'emacs-lisp-mode-hook
;	  'enable-paren-auto-pairs)

(add-hook 'after-init-hook 'enable-paren-auto-pairs)

(setq default-fill-column 80) ; limit line length to 80 character

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
;; init exec-path-from-shell for window based Emacs
(when (package-installed-p 'exec-path-from-shell)
  (unless (featurep 'exec-path-from-shell-initialize)
    (require 'exec-path-from-shell))
  (exec-path-from-shell-initialize))
(provide 'init-others)
