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
   (setq gc-cons-threshold 67108864) 
   (setq gc-cons-percentage 0.1) 
   (garbage-collect)))

(setq read-process-output-max (* 1024 1024))

(add-to-list 'desktop-locals-to-save 'buffer-undo-list)

(require 'core)
(require 'emacs)
(require 'package)

(unless package-archive-contents
  (package-refresh-contents))

(package-initialize)

(require 'use-package)

(setq
 use-package-always-ensure t
 package-native-compile t
 warning-minimum-level :error)

(require 'c-themes)
(require 'c-dashboard)
(require 'c-projectile)
(require 'c-elisp)
(require 'c-nerd-icons)
(require 'c-evil)
(require 'c-vertigo)
(require 'c-lsp)
(require 'c-autoformat)
(require 'c-rg)
(require 'c-git)
(require 'c-org-mode)
(require 'c-mac)
