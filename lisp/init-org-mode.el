(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-journal-dir (expand-file-name "~/Dropbox/Documents/journal/"))
(setq org-journal-file-format "%Y%m%d.md")
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

(provide 'init-org-mode)
