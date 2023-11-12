;;; init-themes.el --- COLORSCHEMES -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; THEMES
(use-package ef-themes
  :ensure t)

(use-package
 doom-themes
 :ensure t
 :config
 (load-theme 'doom-laserwave t))

(use-package solaire-mode
  :ensure t
  :after doom-themes
  :init (solaire-global-mode +1))


(provide 'init-themes)
;;; init-themes.el ends here

