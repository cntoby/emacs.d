(unless (package-installed-p 'sublime-themes)
  (package-refresh-contents)
  (package-install 'sublime-themes)
  )
(load-theme 'tango-dark)

(provide 'init-themes)
