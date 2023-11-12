;;; init-path.el --- PATH SUPPORT -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns x))
  :config
  (setq exec-path-from-shell-variables '("PATH" "GOPATH" "MANPATH"))
  (exec-path-from-shell-initialize))

(provide 'init-path)
;;; init-path.el ends here


