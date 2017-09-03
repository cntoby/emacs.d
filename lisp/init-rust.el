(when (package-installed-p 'rust-mode)
  (when (package-installed-p 'company-racer)
    ; (setq racer-cmd "/usr/local/bin/racer")
    ;(unless (getenv "RUST_SRC_PATH")
    ;  (cond ((string-equal system-type "darwin")
	;     (setenv "RUST_SRC_PATH" (expand-file-name "~/Devel/src/rust/src")))
	;    ((string-equal system-type "gnu/linux")
	;     (setenv "RUST_SRC_PATH" (expand-file-name "~/src/rust/src")))))
    ;(require 'company-racer)
    ;(with-eval-after-load 'company
    ;  (add-to-list 'company-backends 'company-racer))
    ;(when (package-installed-p 'racer)
    ;  (add-hook 'rust-mode-hook #'racer-mode)
    ;  (add-hook 'racer-mode-hook #'eldoc-mode)
    ;  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
    ;  (local-set-key (kbd "M-.") #'racer-find-definition)
    ;  (local-set-key (kbd "TAB") #'company-indent-or-complete-common))
  ;(when (package-installed-p 'rustfmt)
					;  (add-hook 'rust-mode-hook #'rustfmt-enable-on-save))

    ;; Enable company globally for all mode
    ;(global-company-mode)

    ;; Reduce the time after which the company auto completion popup opens
    ;(setq company-idle-delay 0.2)

    ;; Reduce the number of characters before company kicks in
    ;(setq company-minimum-prefix-length 1)
    ;; Set path to racer binary
    (setq racer-cmd (expand-file-name "~/.cargo/bin/racer"))

    ;; Set path to rust src directory
    (setq racer-rust-src-path (expand-file-name "~/.rust/src/"))

    ;; Load rust-mode when you open `.rs` files
    (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

    ;; Setting up configurations when you load rust-mode
    (add-hook 'rust-mode-hook
	      '(lambda ()
		 ;; Enable racer
		 (racer-activate)

		 ;; Hook in racer with eldoc to provide documentation
		 (racer-turn-on-eldoc)

		 ;; Use flycheck-rust in rust-mode
		 (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

		 ;; Use company-racer in rust mode
		 (set (make-local-variable 'company-backends) '(company-racer))

		 ;; Key binding to jump to method definition
		 (local-set-key (kbd "M-.") #'racer-find-definition)

		 ;; Key binding to auto complete and indent
		 (local-set-key (kbd "TAB") #'racer-complete-or-indent)))))
(provide 'init-rust)
