;; check and install haskell-mode
(when (package-installed-p 'haskell-mode)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  (when (package-installed-p 'haskell-snippets)
    (require 'haskell-snippets)
    )
  )
(provide 'init-haskell)
