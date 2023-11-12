;;; init-base.el --- PATH SUPPORT -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; INTERNAL PACKAGES
(use-package
 emacs
 :hook (after-init . (lambda () (setq gc-cons-threshold (* 2 1000 1000))))
 :custom

 ;; Set cxustom file early
 (custom-file (expand-file-name "lisp/.custom.el" user-emacs-directory))
 (user-full-name "Batmi")

 ;; Tune system limits
 (gc-cons-threshold (* 20 1024 1024))
 (read-process-output-max (* 1024 1024))
 (inhibit-compacting-font-caches t)

 (load-prefer-newer t)
 (bidi-paragraph-direction 'left-to-right)
 (initial-scratch-message "")

 ;; store all backup and autosave files in the tmp dir
 (backup-directory-alist `((".*" . ,temporary-file-directory)))
 (auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
 (create-lockfiles nil)
 (fill-column 100)
 (inhibit-startup-screen t)

 (line-spacing 0.1)

 (indent-tabs-mode nil)
 (tab-width 2)
 (truncate-lines t)

 (lisp-indent-function nil)
 (lisp-indent-offset 1)
 (use-short-answers t)

 (treesit-language-source-alist
  '((bash "https://github.com/tree-sitter/tree-sitter-bash")
    (c "https://github.com/tree-sitter/tree-sitter-c")
    (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
    (cmake "https://github.com/uyha/tree-sitter-cmake")
    (css "https://github.com/tree-sitter/tree-sitter-css")
    (ocaml "https://github.com/tree-sitter/tree-sitter-ocaml")
    (html "https://github.com/tree-sitter/tree-sitter-html")
    (elisp "https://github.com/Wilfred/tree-sitter-elisp")
    (heex "https://github.com/phoenixframework/tree-sitter-heex")
    (elixir "https://github.com/elixir-lang/tree-sitter-elixir")
    (go "https://github.com/tree-sitter/tree-sitter-go")
    (html "https://github.com/tree-sitter/tree-sitter-html")
    (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
    (json "https://github.com/tree-sitter/tree-sitter-json")
    (lua "https://github.com/Azganoth/tree-sitter-lua")
    (make "https://github.com/alemuller/tree-sitter-make")
    (markdown "https://github.com/ikatyang/tree-sitter-markdown")
    (python "https://github.com/tree-sitter/tree-sitter-python")
    (rust "https://github.com/tree-sitter/tree-sitter-rust")
    (toml "https://github.com/tree-sitter/tree-sitter-toml")
    (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
    (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
    (yaml "https://github.com/ikatyang/tree-sitter-yaml")
    (zig "https://github.com/GrayJack/tree-sitter-zig")))
 :init (load custom-file 'noerror)

 (setq-default bidi-paragraph-direction 'left-to-right)
 (prefer-coding-system 'utf-8)
 (set-default-coding-systems 'utf-8)
 (set-terminal-coding-system 'utf-8)
 (set-keyboard-coding-system 'utf-8)
 (global-hl-line-mode +1)
 (setq-default indent-tabs-mode nil)


 (setq completion-cycle-threshold 3)
 (setq enable-recursive-minibuffers t)
 (setq next-line-add-newlines t)

 ;; Fonts
 (set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 110 :weight 'light)
 (set-face-attribute 'fixed-pitch nil :font "JetBrainsMono Nerd Font" :height 110 :weight 'light)
 (set-face-attribute 'variable-pitch nil :font "JetBrainsMono Nerd Font" :height 110 :weight 'light)

 :config
 (global-display-line-numbers-mode)
 (column-number-mode t)
 (size-indication-mode t)
 (delete-selection-mode 1)
 (fset 'display-startup-echo-area-message #'ignore)
 (menu-bar-mode -1)
 (tool-bar-mode -1)
 (scroll-bar-mode -1)

 (global-prettify-symbols-mode))

(use-package
 dired
 :ensure nil
 :defer t
 :config
 (setq
  dired-auto-revert-buffer t ; Revert on re-visiting
  ;; Better dired flags:
  ;; `-l' is mandatory
  ;; `-a' shows all files
  ;; `-h' uses human-readable sizes
  ;; `-F' appends file-type classifiers to file names (for better highlighting)
  dired-listing-switches "-laFGh1v --group-directories-first"
  dired-ls-F-marks-symlinks t ; -F marks links with @
  ;; Inhibit prompts for simple recursive operations
  dired-recursive-copies 'always
  ;; Auto-copy to other Dired split window
  dired-dwim-target t))

(column-number-mode)
(electric-pair-mode 1)
(savehist-mode)
(recentf-mode)
(display-time)

(provide 'init-base)
;;; init-base.el ends here
