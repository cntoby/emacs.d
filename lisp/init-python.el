(when (package-installed-p 'company-jedi)
  (add-hook 'python-mode-hook
	    (lambda ()
	      (require 'jedi-core)
	      (setq jedi:complete-on-dot t)
	      (setq jedi:use-shortcuts t)
	      (add-to-list 'company-backends 'company-jedi)
	      (local-set-key (kbd "M-.") #'jedi:goto-definition)
	      (local-set-key (kbd "C-c C-d") #'jedi:show-doc)))
  (add-hook 'python-mode-hook '(lambda ()
				 (set (make-local-variable 'python-indent-offset) 2)
					;(add-to-list 'interpreter-mode-alist '("python" . python-mode))
					;(turn-on-eldoc-mode)
				 )
	    t))
; (add-hook 'python-mode-hook 'jedi:setup) ; execute jedi:install-server when first running
(provide 'init-python)
