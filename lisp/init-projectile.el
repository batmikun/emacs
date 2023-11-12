;;; init-projectile.el --- PROJECT SUPPORT -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package projectile
  :ensure t
  :config
  (projectile-mode 1))

(use-package perspective
  :ensure t
  :bind (
  ("C-x b" . persp-switch-to-buffer*)
  ("C-x k" . persp-kill-buffer*))
  :custom
  (persp-mode-prefix-key (kbd "C-z"))
  :init
  (persp-mode))

(setq persp-state-default-file "~/.config/emacs/sessions")

(provide 'init-projectile)
;;; init-projectile.el ends here
