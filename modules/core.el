(provide 'core)

;; disable startup message
(setq inhibit-startup-message t)

;; set font
 (set-face-attribute 'default nil :font "Roboto" :height 110 :weight 'light)
 (set-face-attribute 'fixed-pitch nil :font "Roboto" :height 110 :weight 'light)
 (set-face-attribute 'variable-pitch nil :font "Roboto" :height 110 :weight 'light)


;; Decrease garbage collection threshold after startup for better interactive performance
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 8 1024 1024))))

;; enable line number only on programming mode
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; increase the undo list
(setq undo-list 100000)

;; remove wrap
(setq truncate-lines nil)

;; window resize
(setq window-resize-pixelwise t
      frame-resize-pixelwise t)

;; backup
(setq backup-by-copying t
      backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

;; prefer new file
(setq load-prefer-newer t)

;; custom file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; disable ui
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode t)

;; Uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Buil-in modes
(show-paren-mode 1)
(save-place-mode t)
(savehist-mode t)
(recentf-mode t)
(global-hl-line-mode t)
(global-auto-revert-mode t)

;; Configure Cache
(defvar user-cache-directory (concat user-emacs-directory "cache/"))
(defvar user-data-directory (concat user-emacs-directory "data/"))

(setq recentf-save-file (concat user-cache-directory "recentf")
      recentf-max-saved-items 200
      recentf-max-menu-items 50
      eshell-history-file-name (concat user-cache-directory "eshell-history")
      savehist-file (concat user-cache-directory "savehist-history")
      request-storage-directory (concat user-cache-directory "request")
      transient-history-file (concat user-cache-directory "transient-history.el")
      transient-values-file (concat user-cache-directory "transient-values.el")
      transient-levels-file (concat user-cache-directory "transient-levels.el")
      bookmark-default-file (concat user-cache-directory "bookmarks")
      tramp-persistency-file-name (concat user-cache-directory "tramp")
      package-user-dir (concat user-cache-directory "elpa")
      straight-base-dir user-cache-directory)

(let ((backup-dir (concat user-cache-directory "backups/"))
      (autosave-dir (concat user-cache-directory "auto-saves/")))

  (dolist (path (list backup-dir autosave-dir))
    (unless (file-directory-p path)
      (make-directory path t)))

  (setq backup-directory-alist `((".*" . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,autosave-dir t))
        create-lockfiles nil
        auto-save-list-file-prefix (concat autosave-dir "saves-")
        tramp-backup-directory-alist `((".*" . ,backup-dir))
        tramp-auto-save-directory autosave-dir))

(setq abbrev-file-name (concat user-data-directory "abbrev"))
(setq custom-file (concat user-emacs-directory "custom.el"))

;; Set default major mode for new buffers to text-mode
(setq-default major-mode 'text-mode)

;; Indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)       
(setq js-indent-level 2)             
(setq web-mode-markup-indent-offset 2)


;; GLOBAL KEYBIDINGS
(global-unset-key (kbd "C-w"))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-w h")  'windmove-left)
(global-set-key (kbd "C-w l") 'windmove-right)
(global-set-key (kbd "C-w k")    'windmove-up)
(global-set-key (kbd "C-w j")  'windmove-down)
(global-set-key (kbd "C-w c")  'delete-window)

(global-set-key (kbd "C-w d") 'kill-region)
