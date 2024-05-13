(provide 'c-evil)

(use-package evil
  :ensure t
  :config
  (evil-mode t))

(use-package evil-collection
  :after (evil)
  :config
  (setq evil-collection-mode-lit '(dired))
  (evil-collection-init))
