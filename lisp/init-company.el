(when (package-installed-p 'company)
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0)
  )
(provide 'init-company)