;;; init-def-keybidings.el --- KEYBIDINGS SUPPORT -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; USEFULL KEYBIDINGS
(global-unset-key (kbd "C-w"))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-w h")  'windmove-left)
(global-set-key (kbd "C-w l") 'windmove-right)
(global-set-key (kbd "C-w j")    'windmove-up)
(global-set-key (kbd "C-w k")  'windmove-down)
(global-set-key (kbd "C-w c")  'delete-window)

(global-set-key (kbd "C-w d") 'kill-region)


(provide 'init-def-keybidings)
;;; init-def-keybidings.el ends here
