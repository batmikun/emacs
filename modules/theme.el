(provide 'theme)

(setq modus-themes-bold-constructs t
      modus-themes-italic-constructs t
      modus-themes-fringes 'subtle
      modus-themes-tabs-accented t
      modus-themes-paren-match '(bold intense)
      modus-themes-prompts '(bold intense)
      modus-themes-completions
      '((matches . (extrabold))
        (selection . (semibold italic text-also)))
      modus-themes-org-blocks 'gray-background
      modus-themes-scale-headings t
      modus-themes-to-toggle
      '(modus-operand modus-vivendi)
      modus-themes-region '(bg-only)
      modus-themes-headings
      '((1 . (rainbow overline background 1.4))
        (2 . (rainbow background 1.3))
        (3 . (rainbow bold 1.2))
        (t . (semilight 1.1))))

;; Inicia en el tema oscuro por defecto
(load-theme 'modus-vivendi)             
;; F5 para cambiar entre modus-operandi y modus-vivendi
(define-key global-map (kbd "<f5>") #'modus-themes-toggle)
