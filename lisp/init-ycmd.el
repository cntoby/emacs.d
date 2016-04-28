(when (package-installed-p 'ycmd)
  (require 'ycmd)
  (ycmd-setup)
  (ycmd-toggle-force-semantic-completion)
					;(add-hook 'after-init-hook #'global-ycmd-mode)
  (cond ((string-equal system-type "darwin")
	 (progn
	   (set-variable 'ycmd-server-command (list "/usr/local/bin/python" (expand-file-name "~/.emacs.d/ycmd/ycmd/")))))
	((string-equal system-type "gnu/linux")
	 (progn
	   (set-variable 'ycmd-server-command (list "/usr/bin/python" (expand-file-name "~/.emacs.d/ycmd/ycmd/")))))
	((string-equal system-type "window-nt")
	 (progn
	   (set-variable 'ycmd-server-command (list "/usr/bin/python" (expand-file-name "~/.emacs.d/ycmd/ycmd/"))))))
  (set-variable 'ycmd-global-config (expand-file-name "~/.emacs.d/_ycmd_extra_conf.py"))
  (set-variable 'ycmd-extra-conf-whitelist '("~/Devel/*"))
  (add-hook 'c-mode-hook 'ycmd-mode)
  (add-hook 'c++-mode-hook 'ycmd-mode)
  (add-hook 'php-mode-hook 'ycmd-mode)
  (add-hook 'csharp-mode-hook 'ycmd-mode)

  (when (package-installed-p 'company-ycmd)
    (require 'company-ycmd)
    (company-ycmd-setup))
  ;; initialize flycheck-ycmd
  (when (package-installed-p 'flycheck-ycmd)
    (require 'flycheck-ycmd)
    (flycheck-ycmd-setup)
    (add-hook 'ycmd-file-parse-result-hook 'flycheck-ycmd--cache-parse-results)
    (add-to-list 'flycheck-checkers 'ycmd)))

(provide 'init-ycmd)
