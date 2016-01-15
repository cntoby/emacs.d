(when (package-installed-p 'powerline)
  (if (package-installed-p 'airline-themes)
      (progn
	(require 'airline-themes)
	(load-theme 'airline-light))
    (progn
      (require 'powerline)
      (powerline-default-theme))))
(provide 'init-powerline)
