(setq package-enable-at-startup nil)

;; UNICODE
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment   'utf-8)

;; ;; INTERFACE
(global-auto-revert-mode t)

(menu-bar-mode           0)
(scroll-bar-mode         0)
(tool-bar-mode           0)

(temp-buffer-resize-mode t)
(xterm-mouse-mode        1)
(fringe-mode             0)

(delete-selection-mode   1)
(electric-pair-mode      1)
(electric-indent-mode    0)

;; ;; INITIALIZE IN FULLSCREEN
(add-to-list 'default-frame-alist '(fullscreen . fullboth))

;; ;; ALIASES & VARIABLES
(defalias 'yes-or-no-p 'y-or-n-p)
(defvar custom-file-path (expand-file-name "custom.el" user-emacs-directory))


(setq ring-bell-function              'ignore
      inhibit-splash-screen           t
      initial-scratch-message         nil
      select-enable-primary           t
      select-enable-clipboard         t
      max-mini-window-height          3
      warning-minimum-level           :error

      ;; MODE LINE
      line-number-mode                t
      column-number-mode              t
      truncate-lines                  nil

      ;; DISABLE TAB BAR
      tab-bar-close-button-show       nil
      tab-bar-mode                    nil
      tab-bar-show                    nil

      ;; SCROLLING
      scroll-margin                   0
      scroll-conservatively           100000
      scroll-preserve-screen-position 1
      auto-window-vscroll             nil

      ;; EDIT MODE
      require-final-newline           t
      indent-tabs-mode                nil
      tab-width                       4

      ;; PERFORMANCE
      gc-cons-threshold               100000000

      ;; BACKUP
      backup-directory-alist         `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      default-directory              "~/"
      create-lockfiles               nil
      custom-file                    custom-file-path

      ;; PACKAGE ARCHIVES
      package-archives               '(("gnu-elpa" . "https://elpa.gnu.org/packages/")
                                       ("jcs-elpa" . "https://jcs-emacs.github.io/jcs-elpa/packages/")
                                       ("melpa"    . "https://melpa.org/packages/"))
      package-archive-priorities     '(("gnu-elpa" . 0)
                                       ("jcs-elpa" . 5)
                                       ("melpa"    . 10)))
