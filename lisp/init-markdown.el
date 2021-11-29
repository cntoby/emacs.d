;; check and install markdown-mode
(when (package-installed-p 'markdown-mode)
  (require 'markdown-mode)
  (autoload 'markdown-mode "markdown-mode" "Major mode for edting Markdown files" t)
  (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  (if (package-installed-p 'jekyll-modes)
      (progn
	(add-to-list 'auto-mode-alist '("\\.md\\'" . jekyll-markdown-mode))
	(add-to-list 'auto-mode-alist '("\\.html" . jekyll-html-mode))
	)
    )
  )

(provide 'init-markdown)
