;;; init.el --- Emacs configuration -*- lexical-binding: t -*-

;;; Commentary
;; "C-<chr>  means hold the CONTROL key while typing the character <chr>.
;; Thus, C-f would be: hold the CONTROL key and type f." (Emacs tutorial)
;;
;; - C-h t: Start the Emacs tutorial
;; - C-h o some-symbol: Describe symbol
;; - C-h C-q: Pull up the quick-help cheatsheet

;; modules dir
(add-to-list
 'load-path (expand-file-name "modules" user-emacs-directory))

(run-with-idle-timer
 4 nil
 (lambda ()
   (setq gc-cons-threshold 67108864) ; 64M
   (setq gc-cons-percentage 0.1) ; original value
   (garbage-collect)))

(setq read-process-output-max (* 1024 1024)) ; 1mb

(setq use-package-always-defer t)

(add-to-list 'desktop-locals-to-save 'buffer-undo-list)

(require 'core)
(require 'emacs)

;; INSTALLER
(require 'package)

(unless package-archive-contents
  (package-refresh-contents))

(package-initialize)

(require 'use-package)

;; ;; LISP
(use-package
 elisp-autofmt
 :ensure t
 :commands (elisp-autofmt-mode elisp-autofmt-buffer)
 :hook (emacs-lisp-mode . elisp-autofmt-mode))

;; THEME
(use-package
 ef-themes
 :ensure t
 :init (ef-themes-select 'ef-autumn))

(use-package
  nerd-icons
  :ensure t
  :custom
  (nerd-icons-font-family "IosevkaTermSlab Nerd Font Mono"))

;; BETTER Help Buffer
(use-package
 helpful
 :ensure t
 :bind
 (("C-h f" . #'helpful-callable)
  ("C-h v" . #'helpful-variable)
  ("C-h k" . #'helpful-key)
  ("C-c C-d" . #'helpful-at-point)
  ("C-h F" . #'helpful-function)
  ("C-h C" . #'helpful-command)))

;; MINIBUFFER COMPLETITION
(use-package
 vertico
 :ensure t
 :custom
 (vertico-cycle t)
 (read-buffer-completion-ignore-case t)
 (read-file-name-completion-ignore-case t)
 (completion-styles '(basic substring partial-completion flex))
 :init (vertico-mode))

;; CODE COMPLETITION AT POINT
(use-package
 corfu
 :ensure t
 :init
 (global-corfu-mode)
 (corfu-popupinfo-mode)
 :custom
 (corfu-auto t)
 (corfu-quit-no-match 'separator)
 (corfu-auto-delay 0.3)
 (corfu-auto-prefix 2)
 :bind (:map corfu-map ("RET" . nil)))

(use-package
 orderless
 :ensure t
 :init
 (setq
  completion-styles '(orderless basic)
  completion-category-defaults nil
  completion-category-overrides '((file (styles partial-completion)))))

;; DOCS FOR MINIBUFFER COMPLETITION
(use-package
 marginalia
 :after vertico
 :ensure t
 :init (marginalia-mode))

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
 ;; The following tells eglot to use TypeScript language server when working in `web-mode'.
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
 ;; These extra modes help clean up the Markdown editing experience.
 ;; `visual-line-mode' turns on word wrap and helps editing commands
 ;; work with paragraphs of text. `flyspell-mode' turns on an
 ;; automatic spell checker.
 :hook ((markdown-mode . visual-line-mode) (markdown-mode . flyspell-mode))
 :init (setq markdown-command "multimarkdown"))

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

;; An extremely feature-rich git client. Activate it with "C-c g".
(use-package magit :ensure t :bind (("C-c g" . magit-status)))

;; ORG MODE
(use-package
 org-modern
 :ensure t
 :init
 (with-eval-after-load 'org
   (global-org-modern-mode)))

(use-package
 toc-org
 :ensure t
 :after org
 :hook (org-mode . toc-org-enable))

(use-package org-indent :after org :ensure nil :delight)
(setq org-edit-src-content-indentation 0)

(require 'org-tempo)

(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.7))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.6))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.5))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.4))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.3))))
 '(org-level-6 ((t (:inherit outline-5 :height 1.2))))
 '(org-level-7 ((t (:inherit outline-5 :height 1.1)))))

;; FOR MAC
(use-package
 exec-path-from-shell
 :ensure t
 :if (memq window-system '(mac ns x))
 :config
 (setq exec-path-from-shell-variables '("PATH" "GOPATH" "MANPATH"))
 (exec-path-from-shell-initialize))
