;;; init-line.el --- MODELINE SUPPORT -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package
 doom-modeline
 :ensure t
 :hook (after-init . doom-modeline-mode)
 :config
 (setq
  doom-modeline-height 30
  doom-modeline-bar-width 5
  doom-modeline-hud t
  doom-modeline-icon t
  doom-modeline-persp-name t
  doom-modeline-persp-icon t))

(custom-set-faces
 '(mode-line ((t (:family "CaskaydiaCove Nerd Font" :height 1))))
 '(mode-line-active ((t (:family "CaskaydiaCove Nerd Font" :height 1)))) ; For 29+
 '(mode-line-inactive ((t (:family "CaskaydiaCove Nerd Font" :height 1)))))


(provide 'init-line)
;;; init-line.el ends here
