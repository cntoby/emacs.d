(when (package-installed-p 'omnisharp)
  (require 'csharp-mode)
  (add-hook 'csharp-mode-hook
	    '(lambda ()
	       (setq c-basic-offset 4)
	       (c-set-offset 'substatement-open 0)
	       (c-set-offset 'case-label '+)
	       (c-set-offset 'arglist-intro '+)
	       (c-set-offset 'arglist-close 0)))
  (add-hook 'csharp-mode-hook 'omnisharp-mode)
  (add-hook 'csharp-mode-hook 'turn-on-eldoc-mode))

(provide 'init-csharp)
