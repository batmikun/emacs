(provide 'c-themes)

(use-package
 doom-themes
 :ensure t
 :config
 (setq
  doom-themes-enable-bold t
  doom-themes-enable-italic t)
 (load-theme 'doom-one t)
 (doom-themes-visual-bell-config)
 (doom-themes-org-config))

(use-package
 doom-modeline
 :ensure t
 :hook (after-init . doom-modeline-mode))
