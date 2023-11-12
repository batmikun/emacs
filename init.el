;;; init.el --- Init File -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; EMACS

;; ;; ADD IN SCOPE LISP FOLDER
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-base)
(require 'init-themes)

(require 'init-path)
(require 'init-which)
(require 'init-def-keybidings)

(require 'init-nerd)
(require 'init-treemacs)
(require 'init-line)

(require 'init-dashboard)
(require 'init-projectile)

(require 'init-lsp)
(require 'init-cmp)

(require 'init-org)

(require 'init-misc)
;;; init.el ends here
