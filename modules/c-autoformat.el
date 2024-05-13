(provide 'c-autoformat)

(use-package format-all
  :ensure t
  :commands format-all-mode
  :hook (prog-mode . format-all-mode))
