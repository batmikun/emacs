;;; Early-init.el --- Early Init File -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Increase the GC threshold for faster startup
;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; Prefer loading newest compiled .el file
(customize-set-variable 'load-prefer-newer noninteractive)

(setq frame-inhibit-implied-resize t
      comp-deferred-compilation nil
      ring-bell-function              'ignore
      inhibit-splash-screen           t

      ;; DISABLE COMP WARNINGS
      native-comp-async-report-warnings-errors nil

      ;; TAB WIDTH
      indent-line-function           'insert-tab

      ;; PACKAGE ARCHIVES
      package-archives               '(("gnu-elpa" . "https://elpa.gnu.org/packages/")
                                       ("jcs-elpa" . "https://jcs-emacs.github.io/jcs-elpa/packages/")
                                       ("melpa"    . "https://melpa.org/packages/"))
      package-archive-priorities     '(("gnu-elpa" . 0)
                                       ("jcs-elpa" . 5)
                                       ("melpa"    . 10)))

;;; early-init.el ends here
