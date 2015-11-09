;; check and install haskell-mode
(unless (package-installed-p 'haskell-mode)
  (package-install 'haskell-mode)
  )
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(provide 'init-haskell)
