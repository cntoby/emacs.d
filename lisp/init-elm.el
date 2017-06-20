(when (package-installed-p 'elm-mode)
  (setq elm-format-on-save t)
  (add-to-list 'company-backends 'company-elm))

(provide 'init-elm)
