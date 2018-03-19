(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-journal-dir (expand-file-name "~/Dropbox/Documents/journal/"))
(setq org-journal-file-format "%Y%m%d.md")
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/Dropbox/Documents/org/work.org"
			     "~/Dropbox/Documents/org/home.org"
			     "~/Dropbox/Documents/org/writing.org"
			     "~/Dropbox/Documents/org/daily.org"
			     "~/Dropbox/Documents/org/finance.org"))

(provide 'init-org-mode)
