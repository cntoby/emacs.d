(unless (package-installed-p 'sublime-themes)
  (package-install 'sublime-themes)
  )
(load-theme 'tango-dark t)

(provide 'init-themes)
