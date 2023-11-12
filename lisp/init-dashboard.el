;;; init-dashboard.el --- DASHBOARD SUPPORT -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package dashboard
  :ensure t
  :init
  (setq initial-buffer-choice 'dashboard-open)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "There are things you can't see unless you change your standing.")
  (setq dashboard-startup-banner "/Users/batmi/.config/emacs/killua.png")
  (setq dashboard-center-content nil)
  (setq dashboard-items '((recents . 5)
                          (agenda . 5)
                          (bookmarks . 3)
                          (projects . 3)
                          (registers . 3)))
  :config
  (dashboard-setup-startup-hook))

(provide 'init-dashboard)
;;; init-dashboard.el ends here
