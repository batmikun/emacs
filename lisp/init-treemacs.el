;;; init-treemacs.el --- MODELINE SUPPORT -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package
 treemacs
 :ensure t
 :bind ("C-." . treemacs)
 :hook (treemacs-mode-hook . (lambda () (display-line-numbers-mode -1)))
 :config
 (treemacs-filewatch-mode t)
 (treemacs-git-mode 'simple))

(use-package treemacs-nerd-icons :config (treemacs-load-theme "nerd-icons"))

(use-package treemacs-magit :ensure t :after (treemacs magit))

(use-package treemacs-projectile :ensure t :after (treemacs projectile))

(provide 'init-treemacs)
;;; init-treemacs.el ends here
