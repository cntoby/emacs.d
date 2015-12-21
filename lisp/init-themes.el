(unless (package-installed-p 'sublime-themes)
  (package-install 'sublime-themes)
  )
;;(load-theme 'tango-dark t)
(load-theme 'material t)

(provide 'init-themes)
