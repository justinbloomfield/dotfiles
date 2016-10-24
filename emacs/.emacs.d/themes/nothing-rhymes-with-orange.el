(eval-when-compile
  (require 'cl-lib))

(unless (>= emacs-major-version 24)
  (error "Requires Emacs 24 or later"))

(defcustom nrwo-contrast 'medium
  "Contrast level for the theme background."
  :options '(soft medium hard))

(deftheme nothing-rhymes-with-orange "Test")
(let* ((nrwo-dark0_hard  (if (display-graphic-p) "#181818" "color-234"))
       (nrwo-dark0       (if (display-graphic-p) "#282828" "color-235"))
       (nrwo-dark0_soft  (if (display-graphic-p) "#32302f" "color-236"))
       (nrwo-dark1       (if (display-graphic-p) "#3c3836" "color-237"))
       (nrwo-dark2       (if (display-graphic-p) "#504945" "color-239"))
       (nrwo-dark3       (if (display-graphic-p) "#665c54" "color-241"))
       (nrwo-dark4       (if (display-graphic-p) "#7c6f64" "color-243"))

       (nrwo-medium      (if (display-graphic-p) "#928374" "color-245")) ;; or 244

       (nrwo-light0_hard (if (display-graphic-p) "#ffffc8" "color-230"))
       (nrwo-light0      (if (display-graphic-p) "#ede4b1" "color-229"))
       (nrwo-light0_soft (if (display-graphic-p) "#f4e8ba" "color-228"))
       (nrwo-light1      (if (display-graphic-p) "#ebdbb2" "color-223"))
       (nrwo-light2      (if (display-graphic-p) "#d5c4a1" "color-250"))
       (nrwo-light3      (if (display-graphic-p) "#bdae93" "color-248"))
       (nrwo-light4      (if (display-graphic-p) "#a89984" "color-246"))

       (nrwo-color0     (if (display-graphic-p) "#262322" "color-0"))
       (nrwo-color1     (if (display-graphic-p) "#665752" "color-1"))
       (nrwo-color2     (if (display-graphic-p) "#75645e" "color-2"))
       (nrwo-color3     (if (display-graphic-p) "#85716a" "color-3"))
       (nrwo-color4     (if (display-graphic-p) "#947e76" "color-4"))
       (nrwo-color5     (if (display-graphic-p) "#a38b83" "color-5"))
       (nrwo-color6     (if (display-graphic-p) "#b89c93" "color-6"))
       (nrwo-color7     (if (display-graphic-p) "#ede4b1" "color-7"))
       (nrwo-color8     (if (display-graphic-p) "#524b49" "color-8"))
       (nrwo-color9     (if (display-graphic-p) "#ff6633" "color-9"))
       (nrwo-color10    (if (display-graphic-p) "#bf4c26" "color-10"))
       (nrwo-color11    (if (display-graphic-p) "#803319" "color-11"))
       (nrwo-color12    (if (display-graphic-p) "#80ecff" "color-12"))
       (nrwo-color13    (if (display-graphic-p) "#60b4bf" "color-13"))
       (nrwo-color14    (if (display-graphic-p) "#406d80" "color-14"))
       (nrwo-color15    (if (display-graphic-p) "#e8d7d1" "color-15"))

       (nrwo-delimiter-one    (if (display-graphic-p) "#458588" "color-30"))
       (nrwo-delimiter-two    (if (display-graphic-p) "#b16286" "color-168"))
       (nrwo-delimiter-three  (if (display-graphic-p) "#8ec07c" "color-108"))
       (nrwo-delimiter-four   (if (display-graphic-p) "#d65d0e" "color-166"))
       (nrwo-white            (if (display-graphic-p) "#FFFFFF" "white"))
       (nrwo-black            (if (display-graphic-p) "#000000" "black"))
       (nrwo-sienna           (if (display-graphic-p) "#DD6F48" "sienna"))
       (nrwo-darkslategray4   (if (display-graphic-p) "#528B8B" "DarkSlateGray4"))
       (nrwo-lightblue4       (if (display-graphic-p) "#66999D" "LightBlue4"))
       (nrwo-burlywood4       (if (display-graphic-p) "#BBAA97" "burlywood4"))
       (nrwo-aquamarine4      (if (display-graphic-p) "#83A598" "aquamarine4"))
       (nrwo-turquoise4       (if (display-graphic-p) "#61ACBB" "turquoise4"))

       (nrwo-bg nrwo-dark0_hard))

  (custom-theme-set-faces
   'nothing-rhymes-with-orange

   ;; UI
   `(default                           ((t (:background ,nrwo-bg :foreground ,nrwo-light0))))
   `(cursor                            ((t (:background ,nrwo-light0))))
   `(mode-line                         ((t (:box nil :background ,nrwo-dark0 :foreground "ivory" :font "Terminus (TTF)-13"))))
   `(mode-line-inactive                ((t (:box nil :background ,nrwo-dark1 :foreground ,nrwo-light4 :font "Terminus (TTF)-13"))))
   `(fringe                            ((t (:background ,nrwo-bg))))
   `(linum                             ((t (:background ,nrwo-bg :foreground ,nrwo-dark4))))
   `(hl-line                           ((t (:background ,nrwo-color0))))
   `(region                            ((t (:background ,nrwo-dark2)))) ;;selection
   `(secondary-selection               ((t (:background ,nrwo-dark1))))
   `(minibuffer-prompt                 ((t (:background ,nrwo-bg :foreground ,nrwo-color4 t))))
   `(vertical-border                   ((t (:foreground ,nrwo-dark2))))
   `(link                              ((t (:foreground ,nrwo-color7 :underline t))))
   `(shadow                            ((t (:foreground ,nrwo-dark4))))

   ;; Built-in syntax
   `(font-lock-builtin-face            ((t (:foreground ,nrwo-color9 t))))
   `(font-lock-constant-face           ((t (:foreground ,nrwo-color10 t))))
   `(font-lock-comment-face            ((t (:foreground ,nrwo-dark4))))
   `(font-lock-function-name-face      ((t (:foreground ,nrwo-color15 ))))
   `(font-lock-keyword-face            ((t (:foreground ,nrwo-color10))))
   `(font-lock-string-face             ((t (:foreground ,nrwo-color5))))
   `(font-lock-variable-name-face      ((t (:foreground ,nrwo-color9))))
   `(font-lock-type-face               ((t (:foreground ,nrwo-color12))))
   `(font-lock-warning-face            ((t (:foreground ,nrwo-color15 t))))

   `(neo-dir-link-face                 ((t (:foreground ,nrwo-color10))))
   `(neo-root-dir-face                 ((t (:foreground ,nrwo-dark4))))

   ;; whitespace-mode
   `(whitespace-space                  ((t (:background ,nrwo-bg :foreground ,nrwo-dark4))))
   `(whitespace-hspace                 ((t (:background ,nrwo-bg :foreground ,nrwo-dark4))))
   `(whitespace-tab                    ((t (:background ,nrwo-bg :foreground ,nrwo-dark4))))
   `(whitespace-newline                ((t (:background ,nrwo-bg :foreground ,nrwo-dark4))))
   `(whitespace-trailing               ((t (:background ,nrwo-dark1 :foreground ,nrwo-color3))))
   `(whitespace-line                   ((t (:background ,nrwo-dark1 :foreground ,nrwo-color3))))
   `(whitespace-space-before-tab       ((t (:background ,nrwo-bg :foreground ,nrwo-dark4))))
   `(whitespace-indentation            ((t (:background ,nrwo-bg :foreground ,nrwo-dark4))))
   `(whitespace-empty                  ((t (:background nil :foreground nil))))
   `(whitespace-space-after-tab        ((t (:background ,nrwo-bg :foreground ,nrwo-dark4))))

   ;; RainbowDelimiters
   `(rainbow-delimiters-depth-1-face   ((t (:foreground ,nrwo-delimiter-one))))
   `(rainbow-delimiters-depth-2-face   ((t (:foreground ,nrwo-delimiter-two))))
   `(rainbow-delimiters-depth-3-face   ((t (:foreground ,nrwo-delimiter-three))))
   `(rainbow-delimiters-depth-4-face   ((t (:foreground ,nrwo-delimiter-four))))
   `(rainbow-delimiters-depth-5-face   ((t (:foreground ,nrwo-delimiter-one))))
   `(rainbow-delimiters-depth-6-face   ((t (:foreground ,nrwo-delimiter-two))))
   `(rainbow-delimiters-depth-7-face   ((t (:foreground ,nrwo-delimiter-three))))
   `(rainbow-delimiters-depth-8-face   ((t (:foreground ,nrwo-delimiter-four))))
   `(rainbow-delimiters-depth-9-face   ((t (:foreground ,nrwo-delimiter-one))))
   `(rainbow-delimiters-depth-10-face  ((t (:foreground ,nrwo-delimiter-two))))
   `(rainbow-delimiters-depth-11-face  ((t (:foreground ,nrwo-delimiter-three))))
   `(rainbow-delimiters-depth-12-face  ((t (:foreground ,nrwo-delimiter-four))))
   `(rainbow-delimiters-unmatched-face ((t (:background nil :foreground ,nrwo-light0))))

   ;; linum-relative
   `(linum-relative-current-face       ((t (:background ,nrwo-dark1 :foreground ,nrwo-light4))))

   ;; Highlight indentation mode
   `(highlight-indentation-current-column-face ((t (:background ,nrwo-dark2 ))))
   `(highlight-indentation-face                ((t (:background ,nrwo-dark1 ))))

   ;; Smartparens
   `(sp-pair-overlay-face              ((t (:background ,nrwo-dark2))))
                                        ;`(sp-wrap-overlay-face             ((t (:inherit sp-wrap-overlay-face))))
                                        ;`(sp-wrap-tag-overlay-face         ((t (:inherit sp-wrap-overlay-face))))
   `(sp-show-pair-match-face           ((t (:background ,nrwo-dark2)))) ;; Pair tags highlight
   `(sp-show-pair-mismatch-face        ((t (:background ,nrwo-color15)))) ;; Highlight for bracket without pair

   ;; elscreen
   `(elscreen-tab-background-face      ((t (:box nil :background ,nrwo-bg)))) ;; Tab bar, not the tabs
   `(elscreen-tab-control-face         ((t (:box nil :background ,nrwo-dark2 :foreground ,nrwo-color15 :underline nil)))) ;; The controls
   `(elscreen-tab-current-screen-face  ((t (:box nil :background ,nrwo-dark4 :foreground ,nrwo-dark0)))) ;; Current tab
   `(elscreen-tab-other-screen-face    ((t (:box nil :background ,nrwo-dark2 :foreground ,nrwo-light4 :underline nil)))) ;; Inactive tab

   ;; ag (The Silver Searcher)
   `(ag-hit-face                       ((t (:foreground ,nrwo-color14))))
   `(ag-match-face                     ((t (:foreground ,nrwo-color15))))

   ;; Diffs
   `(diff-changed                      ((t (:background ,nrwo-color0 :foreground ,nrwo-light1))))
   `(diff-added                        ((t (:background nil :foreground ,nrwo-color12))))
   `(diff-removed                      ((t (:background nil :foreground ,nrwo-color9))))
   `(diff-indicator-changed            ((t (:inherit diff-changed))))
   `(diff-indicator-added              ((t (:inherit diff-added))))
   `(diff-indicator-removed            ((t (:inherit diff-removed))))

   `(js2-warning                       ((t (:underline (:color ,nrwo-color9 :style wave)))))
   `(js2-error                         ((t (:underline (:color ,nrwo-color15 :style wave)))))
   `(js2-external-variable             ((t (:underline (:color ,nrwo-color10 :style wave)))))
   `(js2-jsdoc-tag                     ((t (:background nil :foreground ,nrwo-medium ))))
   `(js2-jsdoc-type                    ((t (:background nil :foreground ,nrwo-light4 ))))
   `(js2-jsdoc-value                   ((t (:background nil :foreground ,nrwo-light3 ))))
   `(js2-function-param                ((t (:background nil :foreground ,nrwo-color12 ))))
   `(js2-function-call                 ((t (:background nil :foreground ,nrwo-color10 ))))
   `(js2-instance-member               ((t (:background nil :foreground ,nrwo-color9 ))))
   `(js2-private-member                ((t (:background nil :foreground ,nrwo-color11 ))))
   `(js2-private-function-call         ((t (:background nil :foreground ,nrwo-color14 ))))
   `(js2-jsdoc-html-tag-name           ((t (:background nil :foreground ,nrwo-light4 ))))
   `(js2-jsdoc-html-tag-delimiter      ((t (:background nil :foreground ,nrwo-light3 ))))

   ;; popup
   `(popup-face                                ((t (:foreground ,nrwo-light1 :background ,nrwo-dark1))))
   `(popup-menu-mouse-face                     ((t (:foreground ,nrwo-light0 :background ,nrwo-color2))))
   `(popup-menu-selection-face                 ((t (:foreground ,nrwo-light0 :background ,nrwo-color2))))
   `(popup-tip-face                            ((t (:foreground ,nrwo-light2 :background ,nrwo-dark2))))

   ;; message-mode
   `(message-header-to                 ((t (:inherit font-lock-variable-name-face))))
   `(message-header-cc                 ((t (:inherit font-lock-variable-name-face))))
   `(message-header-subject            ((t (:foreground ,nrwo-color10 ))))
   `(message-header-newsgroups         ((t (:foreground ,nrwo-color9 ))))
   `(message-header-other              ((t (:inherit font-lock-variable-name-face))))
   `(message-header-name               ((t (:inherit font-lock-keyword-face))))
   `(message-header-xheader            ((t (:foreground ,nrwo-color12))))
   `(message-separator                 ((t (:inherit font-lock-comment-face))))
   `(message-cited-text                ((t (:inherit font-lock-comment-face))))
   `(message-mml                       ((t (:foreground ,nrwo-color1 ))))
   )
  )

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'nothing-rhymes-with-orange)

;; Local Variables:
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; nrwo-theme.el ends here
