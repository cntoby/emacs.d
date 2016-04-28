(when (package-installed-p 'typescript-mode)
  (autoload 'typescript-mode "typescript-mode" "Major mode for editing TypeScript files" t)
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
;  (setq company-tern-property-marker "")
;  (setq company-tern-meta-as-single-line t)
;  (setq company-tooltip-align-annotations t)
  (add-hook 'typescript-mode-hook
	    (lambda ()
	      (set (make-local-variable 'company-backends) '(company-tern)))))

(defun my/js-company-tern ()
  (when (package-installed-p 'company-tern)
    (add-to-list 'company-backends 'company-tern)))
(provide 'init-typescript)
