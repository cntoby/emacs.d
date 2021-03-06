(when (package-installed-p 'js2-mode)
  (setq auto-mode-alist
	(append
	 '(("\\.js\\'" . js2-mode))
	 '(("\\.json\\'" . js2-mode))
	 auto-mode-alist))
  (add-hook 'js2-mode-hook (lambda ()
			     (require 'company)
			     (require 'company-tern)
			     (tern-mode)
			     (set (make-local-variable 'company-backends) '(company-tern))
			     (company-mode)))

  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (add-hook 'js2-mode-hook (lambda ()
			     (js2r-add-keybindings-with-prefix "C-c C-r")
			     (define-key js2-mode-map (kbd "C-k") #'js2r-kill)
			     (define-key js-mode-map (kbd "M-.") nil)
			     (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))
(provide 'init-js)
