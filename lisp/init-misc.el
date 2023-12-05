;;; init-misc.el --- MISCELLANEOUS SUPPORT -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package sudo-edit :ensure t)

(use-package tldr :ensure t)

(use-package
 smartparens
 :ensure t
 :bind
 (:map
  smartparens-mode-map
  ("C-M-k" . sp-kill-sexp)
  ("C-M-w" . sp-copy-sexp)
  ("M-<delete>" . sp-unwrap-sexp)
  ("M-<backspace>" . sp-backward-unwrap-sexp)
  ("C-<right>" . sp-forward-slurp-sexp)
  ("C-<left>" . sp-forward-barf-sexp)
  ("C-M-<left>" . sp-backward-slurp-sexp)
  ("C-M-<right>" . sp-backward-barf-sexp)
  ("M-D" . sp-splice-sexp)
  ("C-M-<delete>" . sp-splice-sexp-killing-forward)
  ("C-M-<backspace>" . sp-splice-sexp-killing-backward)
  ("C-S-<backspace>" . sp-splice-sexp-killing-around))
 :diminish smartparens-mode
 :hook (prog-mode-hook . turn-on-smartparens-strict-mode)
 :config (require 'smartparens-config) (smartparens-global-mode))

(use-package
 rainbow-delimiters
 :ensure t
 :hook ((emacs-lisp-mode . rainbow-delimiters-mode) (clojure-mode . rainbow-delimiters-mode)))

(use-package
 hl-todo
 :ensure t
 :hook ((org-mode . hl-todo-mode) (prog-mode . hl-todo-mode))
 :config
 (setq
  hl-todo-highlight-punctuation ":"
  hl-todo-keyword-faces
  `(("TODO" warning bold)
    ("FIXME" error bold)
    ("HACK" font-lock-constant-face bold)
    ("REVIEW" font-lock-keyword-face bold)
    ("NOTE" success bold)
    ("DEPRECATED" font-lock-doc-face bold))))

(use-package deadgrep :ensure t :commands deadgrep :bind ("C-S-f" . deadgrep))

(use-package avy :ensure t :bind ("C-;" . avy-goto-char-2))


(use-package docker :ensure t :bind ("C-c d" . docker))

(use-package
 ellama
 :ensure t
 :init (setopt ellama-language "German") (require 'llm-ollama)
 (setopt
  ellama-provider
  (make-llm-ollama :chat-model "zephyr:7b-alpha-q5_K_M" :embedding-model "zephyr:7b-alpha-q5_K_M")))

(provide 'init-misc)
;;; init-misc.el ends here
