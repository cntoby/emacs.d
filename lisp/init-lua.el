(when (package-installed-p 'company-lua)
  (add-hook 'lua-mode-hook
	    (lambda ()
	      (require 'company-lua)
	      (set (make-local-variable 'company-backends) '(company-lua)))))
(provide 'init-lua)
