(unless (package-installed-p 'window-numbering)
  (package-install 'window-numbering)
  )
(require 'window-numbering)
(window-numbering-mode)

(provide 'init-window-nubmering)
