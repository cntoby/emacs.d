(when (package-installed-p 'typescript-mode)
  (autoload 'typescript-mode "typescript-mode" "Major mode for editing TypeScript files" t)
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode)))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

;  (setq company-tern-property-marker "")
;  (setq company-tern-meta-as-single-line t)
;  (setq company-tooltip-align-annotations t)
;  (add-hook 'typescript-mode-hook
;	    (lambda ()
;	      (set (make-local-variable 'company-backends) '(company-tern)))))
;(defun my/js-company-tern ()
;  (when (package-installed-p 'company-tern)
;    (add-to-list 'company-backends 'company-tern)))
(provide 'init-typescript)
