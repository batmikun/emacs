(provide 'c-elisp)

;; LISP
(use-package
 elisp-autofmt
 :ensure t
 :commands (elisp-autofmt-mode elisp-autofmt-buffer)
 :hook (emacs-lisp-mode . elisp-autofmt-mode))
