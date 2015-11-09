(unless (package-installed-p 'sublime-themes)
  (package-install 'sublime-themes)
  )
(load-theme 'tango-dark)

(provide 'init-themes)
