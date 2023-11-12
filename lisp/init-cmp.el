;;; init-cmp.el --- COMPLETION SUPPORT -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; COMPLETION

(use-package corfu
  :ensure t
  :bind
  (:map
   corfu-map
   ("<escape>" . corfu-quit)
   ("<return>" . corfu-insert)
   ("M-n" . corfu-popupinfo-scroll-up)
   ("M-p" . corfu-popupinfo-scroll-down))
  :custom
  (tab-always-indent 'complete)
  (corfu-auto t)
  (corfu-auto-delay 0.25)
  (corfu-auto-prefix 3)
  (corfu-preselect-first t)
  (corfu-preview-current 'insert)
  (corfu-count 14)
  :init
  (global-corfu-mode)
  (corfu-popupinfo-mode)
  (corfu-echo-mode))

(add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter)

(use-package cape
  :ensure t
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)
  (add-to-list 'completion-at-point-functions #'cape-elisp-symbol))

;; ;; VERTICO
(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

;; ;; CONSULT
(use-package consult
 :ensure t
 :bind
 ( ;; C-c bindings (mode-specific-map)
  ("C-x b" . consult-buffer) ;; orig. switch-to-buffer
  ("C-x p b" . consult-project-buffer) ;; orig. project-switch-to-buffer
  ;; Other custom bindings
  ("M-y" . consult-yank-pop) ;; orig. yank-pop
  ("M-g f" . consult-flymake) ;; Alternative: consult-flycheck
  ("M-g g" . consult-goto-line) ;; orig. goto-line
  ("M-g i" . consult-imenu)
  ("M-g I" . consult-imenu-multi)
  ;; M-s bindings (search-map)
  ("M-s d" . consult-find)
  ("M-s D" . consult-locate)
  ("M-s g" . consult-grep)
  ("M-s G" . consult-git-grep)
  ("M-s r" . consult-ripgrep)
  ("M-s l" . consult-line)
  ("M-s L" . consult-line-multi)
  ("M-s m" . consult-multi-occur)
  ("M-s u" . consult-focus-lines)
  :map
  isearch-mode-map
  ("M-e" . consult-isearch-history) ;; orig. isearch-edit-string
  ("M-s e" . consult-isearch-history) ;; orig. isearch-edit-string
  ("M-s l" . consult-line) ;; needed by consult-line to detect isearch
  ("M-s L" . consult-line-multi) ;; needed by consult-line to detect isearch
  ;; Minibuffer history
  :map
  minibuffer-local-map
  ("M-s" . consult-history) ;; orig. next-matching-history-element
  ("M-r" . consult-history)) ;; orig. previous-matching-history-element

 :hook (completion-list-mode . consult-preview-at-point-mode))

;; ;; ORDERLESS
(use-package orderless
 :ensure t
 :init
 (setq
  completion-styles '(orderless basic)
  completion-category-defaults nil
  completion-category-overrides '((file (styles partial-completion)))))

;; ;; MARGINALIA
(use-package marginalia
 :ensure t
 :init
 ;; Must be in the :init section of use-package such that the mode gets
 ;; enabled right away. Note that this forces loading the package.
 (marginalia-mode))

(provide 'init-cmp)
;;; init-cmp.el ends here
