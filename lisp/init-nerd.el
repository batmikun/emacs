;;; init-nerd.el --- ICONS SUPPORT -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package nerd-icons
  :ensure t
  :custom (nerd-icons-font-family "FiraCode Nerd Font"))

(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package nerd-icons-corfu
  :ensure t)

(provide 'init-nerd)
;;; init-nerd.el ends here
