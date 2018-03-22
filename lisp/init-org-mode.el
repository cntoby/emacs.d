(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-journal-dir (expand-file-name "~/Dropbox/Documents/journal/"))
(setq org-journal-file-format "%Y%m%d.md")
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-cb" 'org-iswitchb)
(setq org-log-done t)
(setq org-agenda-files (list "~/Documents/gtd/"))
(defun gtd ()
    (interactive)
    (find-file (concat "~/Documents/gtd/" (format-time-string "%Y-%m-%d") "-todo.org")))
;(load-library "find-lisp")
;(setq org-agenda-files (find-lisp-find-files "~/Documents/gtd" "\.org$"))

(provide 'init-org-mode)
