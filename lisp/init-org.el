;;; init-org.el --- ORG SUPPORT -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(use-package org-modern
  :ensure t
  :init (with-eval-after-load 'org (global-org-modern-mode)))

(use-package toc-org
  :ensure t
  :after org
  :hook (org-mode . toc-org-enable))

(use-package org-indent :after org :ensure nil :delight)
(setq org-edit-src-content-indentation 0)

(require 'org-tempo)

(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.7))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.6))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.5))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.4))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.3))))
 '(org-level-6 ((t (:inherit outline-5 :height 1.2))))
 '(org-level-7 ((t (:inherit outline-5 :height 1.1)))))

(provide 'init-org)
;;; init-org.el ends here
