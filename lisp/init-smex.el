(when (package-installed-p 'smex)
  (require 'smex)
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; old M-x function called
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
  )

(provide 'init-smex)
