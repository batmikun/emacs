(provide 'c-mac)

;; FOR MAC
(use-package
 exec-path-from-shell
 :ensure t
 :if (memq window-system '(mac ns x))
 :config
 (setq exec-path-from-shell-variables '("PATH" "GOPATH" "MANPATH"))
 (exec-path-from-shell-initialize))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(web-mode vertico toc-org telephone-line rust-mode org-modern orderless nerd-icons markdown-mode marginalia magit lua-mode helpful goto-chg go-mode exec-path-from-shell elixir-mode elisp-autofmt dired-hide-dotfiles corfu)))
