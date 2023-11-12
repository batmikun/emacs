;;; init-git.el --- GIT SUPPORT -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; GIT
(use-package magit
  :ensure t
  :hook (after-save . magit-after-save-refresh-status))

(use-package git-timemachine
  :after git-timemachine
  :hook (evil-normalize-keymaps . git-timemachine-hook)
  :config
    (evil-define-key 'normal git-timemachine-mode-map (kbd "C-j") 'git-timemachine-show-previous-revision)
    (evil-define-key 'normal git-timemachine-mode-map (kbd "C-k") 'git-timemachine-show-next-revision)
)

(provide 'init-git)
;;; init-git.el ends here
