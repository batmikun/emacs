;;; init-lsp.el --- LSP SUPPORT -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; LANGUAGES

(use-package
 eglot
 :custom (eldoc-echo-area-use-multiline-p) (eglot-autoshutdown t) (eglot-events-buffer-size 0)
 :config
 (add-to-list
  'eglot-server-programs '((python-mode python-ts-mode) . ("pyright-langserver" "--stdio")))
 :bind
 (("C-c l b" . eglot-format-buffer)
  ("C-c l a" . eglot-code-actions)
  ("C-c l e" . eglot-reconnect)
  ("C-c l r" . eglot-rename)))


;; ;; PYTHON
(use-package
 python
 :ensure t
 :hook ((python-ts-mode . eglot-ensure))
 :mode (("\\.py\\'" . python-ts-mode)))

(use-package
 pyvenv
 :ensure t
 :init
 (setenv "WORKON_HOME" "/Users/batmi/Library/Caches/pypoetry/virtualenvs/")
 (pyvenv-mode 1)
 (pyvenv-tracking-mode 1))

(use-package
 python-black
 :ensure t
 :after python
 :hook (python-mode . python-black-on-save-mode-enable-dwim))

;; ;; GO
(use-package
 go-mode
 :ensure t
 :hook ((go-ts-mode . eglot-ensure))
 :mode (("\\.go\\'" . go-ts-mode)))

;; ;; LUA
(use-package lua-mode :ensure t :hook ((lua-mode . eglot-ensure)))

;; ;; JAVASCRIPT & JSX
(use-package js-base-mode :hook ((js-ts-mode . eglot-ensure)) :mode (("\\.js\\'" . js-ts-mode)))

(use-package js :hook ((js-jsx-mode . eglot-ensure)) :mode (("\\.jsx\\'" . js-jsx-mode)))

(use-package js2-mode :ensure t)

(add-hook 'js-mode-hook 'js2-minor-mode)


;; ;; TYPESCRIPT & TSX
(use-package tsx-ts-mode :hook ((tsx-ts-mode . eglot-ensure)) :mode (("\\.tsx\\'" . tsx-ts-mode)))

(use-package
 tide
 :ensure t
 :after (typescript-mode corfu flycheck)
 :hook
 ((typescript-mode . tide-setup)
  (tsx-ts-mode. tide-setup)
  (typescript-ts-mode . tide-hl-identifier-mode)
  (before-save . tide-format-before-save)))

(use-package npm :ensure t)

;; ;; RUST
(use-package rustic :ensure t :defer t :custom (rustic-lsp-client 'eglot))

(use-package
 cargo
 :ensure t
 :defer t
 :hook ((rust-ts-mode-hook rustic-mode-hook) . cargo-minor-mode))

;; ;; ZIG
(use-package zig-mode :ensure t :defer t :hook ((zig-mode . eglot-ensure)))

;; ;; WEB MODE
(use-package web-mode :ensure t :defer t)

(use-package html-mode :hook ((html-ts-mode . eglot-ensure)) :mode (("\\.html'" . html-ts-mode)))

(use-package css-mode :hook ((css-ts-mode . eglot-ensure)) :mode (("\\.css'" . css-ts-mode)))

(use-package json-ts-mode :hook ((json-ts-mode . eglot-ensure)) :mode (("\\.json'" . json-ts-mode)))

;; ;; C

(use-package c-mode :hook ((c-ts-mode . eglot-ensure)) :mode (("\\.c'" . c-ts-mode)))

(use-package auto-header :ensure t :hook (c-ts-mode . auto-header-mode))

;; ;; LISP
(use-package
 elisp-autofmt
 :ensure t
 :commands (elisp-autofmt-mode elisp-autofmt-buffer)
 :hook (emacs-lisp-mode . elisp-autofmt-mode))

;; ;; LINTING
(use-package
 flycheck
 :ensure t
 :defer 2
 :init (global-flycheck-mode t)
 :custom
 (flycheck-display-errors-delay .3)
 (setq flycheck-check-syntax-automatically '(mode-enabled save))
 (setq flycheck-highlighting-mode 'symbols)
 (setq flycheck-indication-mode nil)
 (setq flycheck-checker-error-threshold 200))

(use-package flycheck-pos-tip :ensure t :after flycheck :init (flycheck-pos-tip-mode))


;; ;; SNIPETTS
(use-package
 yasnippet
 :ensure t
 :config
 (setq yas-snippet-dirs '("~/.config/emacs/snippets"))
 (yas-global-mode 1))

(use-package yasnippet-snippets :ensure t)

(provide 'init-lsp)
;;; init-lsp.el ends here
