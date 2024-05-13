(provide 'c-git)

;; An extremely feature-rich git client. Activate it with "C-c g".
(use-package magit :ensure t :bind (("C-c g" . magit-status)))
