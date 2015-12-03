(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-journal-dir (expand-file-name "~/我的坚果云/Documents/journal/"))
(setq org-journal-file-format "%Y%m%d.md")

(provide 'init-org-mode)
