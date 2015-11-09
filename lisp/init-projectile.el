(when (package-installed-p 'projectile)
  (projectile-global-mode) ; enable all
  (setq projectile-indexing-method 'alien)
  (if (package-installed-p 'helm-projectile)
      (progn
	;; (helm-proje ctile)
	(global-set-key (kbd "C-c ;") 'helm-projectile)
	)
      )
  )

(provide 'init-projectile)
