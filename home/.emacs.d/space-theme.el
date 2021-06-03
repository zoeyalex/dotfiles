(require 'autothemer)

(autothemer-deftheme
 space "A dark non-bloated theme"

 ((((class color) (min-colors #xFFFFFF))) ;; We're only concerned with graphical Emacs

  ;; Define our color palette
  (space-black       "#1c1c1c")
  (space-white       "#cccccc")
  (space-blue        "#87afd7")
  (space-dark_blue   "#5f87af")
  (space-purple      "#afafd7")
  (space-dark_purple "#5f5f87")
  (space-pink        "#af87af")
  (space-gray        "#6c6c6c")
  (space-green       "#5fafaf"))

 ;; Customize faces
 ((default                       (:foreground space-purple :background space-black))
  (cursor                        (:background space-white))
  (link                          (:foreground space-blue :underline t))
  (link-visited                  (:foreground space-dark_purple :underline t))
  
  
  (mode-line                     (:foreground space-black :background space-purple :box nil))
  (mode-line-inactive            (:foreground space-black :background space-purple :box nil))

  
  (region                        (:background space-dark_purple))
  (font-lock-keyword-face        (:foreground space-purple))
  (font-lock-constant-face       (:foreground space-pink))
  (font-lock-string-face         (:foreground space-green))
  (font-lock-builtin-face        (:foreground space-pink))
  (font-lock-comment-face        (:foreground space-dark_purple))
  (font-lock-function-name-face  (:foreground space-blue))
  (font-lock-keyword-face        (:foreground space-dark_blue))
  (font-lock-variable-name-face  (:foreground space-white))
  (font-lock-warning-face        (:foreground space-purple :bold t))

  (org-level-1                   (:foreground space-blue))))

(provide-theme 'space)
