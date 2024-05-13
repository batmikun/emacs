(provide 'c-lsp)

;; LSP
(use-package
 eglot
 :ensure t
 :bind
 (("C-c ." . eglot-code-action-quickfix)
  ("C-c C-i" . eglot-find-implementation)
  ("C-c C-d" . eldoc)
  ("C-c C-e" . eglot-rename)
  ("C-c C-f" . eglot-format-buffer))
 :hook
 ((go-mode . eglot-ensure)
  (web-mode . eglot-ensure)
  (rust-mode . eglot-ensure)
  (python-mode . eglot-ensure)
  (c-mode . eglot-ensure)
  (lua-mode . eglot-ensure)
  (markdown-mode . eglot-ensure))
 :config
 (add-to-list 'eglot-server-programs
              '(web-mode . ("typescript-language-server" "--stdio"))
              '(python-mode . ("pyright-langserver" , "--stdio"))))

(use-package elixir-mode :ensure t)

(use-package
 go-mode
 :ensure t
 :bind (:map go-mode-map ("C-c C-f" . 'gofmt))
 :hook (before-save . gofmt-before-save))

(use-package lua-mode :ensure t)

(use-package
 markdown-mode
 :ensure t
 :commands (markdown-mode gfm-mode)
 :mode
 (("README\\.md\\'" . gfm-mode)
  ("\\.md\\'" . gfm-mode)
  ("\\.markdown\\'" . markdown-mode))
 :init (setq markdown-command "markdown2")
 :config
 (setq visual-line-column 80)
 (setq markdown-fontify-code-blocks-natively t)
 (setq markdown-enable-math t))

;; TypeScript, JS, and JSX/TSX support.
(use-package
 web-mode
 :ensure t
 :mode
 (("\\.ts\\'" . web-mode)
  ("\\.js\\'" . web-mode)
  ("\\.mjs\\'" . web-mode)
  ("\\.tsx\\'" . web-mode)
  ("\\.jsx\\'" . web-mode))
 :custom
 (web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
 (web-mode-code-indent-offset 2)
 (web-mode-css-indent-offset 2)
 (web-mode-markup-indent-offset 2)
 (web-mode-enable-auto-quoting nil))

(use-package
 rust-mode
 :ensure t
 :bind
 (:map
  rust-mode-map
  ("C-c C-r" . 'rust-run)
  ("C-c C-c" . 'rust-compile)
  ("C-c C-f" . 'rust-format-buffer)
  ("C-c C-t" . 'rust-test))
 :hook (rust-mode . prettify-symbols-mode))
