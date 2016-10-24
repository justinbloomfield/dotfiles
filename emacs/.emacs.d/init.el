;;(package-initialize)

(add-to-list 'load-path "~/.emacs.d/custom")


;; fak u
(load "private.el")

;; pkgs
(load "pkg.el")
(load "circe-init.el")
(load "ivy-init.el")

;; ui
(when (display-graphic-p)
  (load "modeline-init.el"))
  ;(load "~/.emacs.d/themes/xres-theme.el"))
(load "ui.el")

;; evil
(load "evil-init.el")

;; magit
(load "magit-init.el")

;; edits
(load "edits.el")

;; lang specific shit
(load "hask.el")



;; put this in misc
(put 'dired-find-alternate-file 'disabled nil)

;; Org mode shiz (for now)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" default)))
 '(package-selected-packages
   (quote
    (sublime-themes use-package smooth-scrolling powerline nlinum-relative markdown-preview-mode markdown-preview-eww magit linum-relative haskell-mode eww-lnum evil-visual-mark-mode evil-leader counsel circe buffer-move all-the-icons))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
