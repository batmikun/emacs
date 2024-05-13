(provide 'c-vertigo)

;; MINIBUFFER COMPLETITION
(use-package
 vertico
 :ensure t
 :init (vertico-mode)
 :custom
 (vertico-count 13)
 (vertico-resize t)
 (vertico-cycle t)
 (vertico-sort-function 'vertico-sort-history-alpha))

;; MARGINALIA
(use-package marginalia :ensure t :init (marginalia-mode))

;; CODE COMPLETITION AT POINT
(use-package
 corfu
 :ensure t
 :init
 (global-corfu-mode)
 (corfu-popupinfo-mode)
 :custom
 (corfu-auto t)
 (corfu-quit-no-match 'separator)
 (corfu-auto-delay 0.3)
 (corfu-auto-prefix 2)
 :bind (:map corfu-map ("RET" . nil)))

(use-package
  orderless
  :ensure t
 :custom
 (completion-styles '(orderless basic))
 (completion-category-defaults nil)
 (completion-category-overrides
  '((file (styles partial-completion)))))

;; DOCS FOR MINIBUFFER COMPLETITION
(use-package
 marginalia
 :after vertico
 :ensure t
 :init (marginalia-mode))






