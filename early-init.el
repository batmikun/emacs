(setq native-comp-eln-load-path
  (list (concat "~/.config/emacs/cache/" "eln-cache")))

(setq gc-cons-threshold most-positive-fixnum)
(setq load-prefer-newer noninteractive)


(setq inhibit-startup-message t)

(setq default-frame-alist
      '((menu-bar-lines . 0)
        (tool-bar-lines . 0)
        (horizontal-scroll-bars)
        (vertical-scroll-bars)))

(setq package-archives               '(("gnu-elpa" . "https://elpa.gnu.org/packages/")
                                       ("jcs-elpa" . "https://jcs-emacs.github.io/jcs-elpa/packages/")
                                       ("melpa"    . "https://melpa.org/packages/"))
      package-archive-priorities     '(("gnu-elpa" . 0)
                                       ("jcs-elpa" . 5)
                                       ("melpa"    . 10)))
