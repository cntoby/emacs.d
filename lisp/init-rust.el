(when (package-installed-p 'rust-mode)
  (when (package-installed-p 'company-racer)
    ; (setq racer-cmd "/usr/local/bin/racer")
    (unless (getenv "RUST_SRC_PATH")
      (cond ((string-equal system-type "darwin")
	     (setenv "RUST_SRC_PATH" (expand-file-name "~/Devel/src/rust/src")))
	    ((string-equal system-type "gnu/linux")
	     (setenv "RUST_SRC_PATH" (expand-file-name "~/src/rust/src")))))
    (require 'company-racer)
    (with-eval-after-load 'company
      (add-to-list 'company-backends 'company-racer))
    (when (package-installed-p 'racer)
      (add-hook 'rust-mode-hook
		'(lambda ()
		   (racer-activate)
		   (racer-turn-on-eldoc)
		   ;; Use flycheck-rust in rust-mode
		   (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
		   ;; Use company-racer in rust mode
		   (set (make-local-variable 'company-backends) '(company-racer))
		   ;; Key binding to jump to method definition
		   (local-set-key (kbd "M-.") #'racer-find-definition)
		   ;; Key binding to auto complete and indent
		   (local-set-key (kbd "TAB") #'racer-complete-or-indent))))
  (when (package-installed-p 'rustfmt)
    (add-hook 'rust-mode-hook #'rustfmt-enable-on-save)))
(provide 'init-rust)
