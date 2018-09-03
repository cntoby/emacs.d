(when (package-installed-p 'projectile)
  (projectile-global-mode) ; enable all
  (setq projectile-indexing-method 'alien)
  (global-set-key (kbd "C-c p D") 'projectile-dired)

  (if (package-installed-p 'helm-projectile)
      (progn
	;; (helm-proje ctile)
	(global-set-key (kbd "C-c ;") 'helm-projectile)
	)
      )
  )

(provide 'init-projectile)
