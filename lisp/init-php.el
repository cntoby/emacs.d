(when (package-installed-p 'php-mode)
  (require 'php-mode)
  (add-hook 'php-mode-hook
	    '(lambda ()
	       (require 'company-php)
	       (company-mode t)
	       (add-to-list 'company-backends 'company-ac-php-backend))))

(provide 'init-php)
