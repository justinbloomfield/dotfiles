;;(package-initialize)

(add-to-list 'load-path "~/.emacs.d/custom")

;; fak u
(load "private.el")

;; pkgs
(load "pkg.el")
(load "circe-init.el")
(load "ivy-init.el")
(load "mu4e-init.el")

;; ui
(load "ui.el")
(load "modeline-init.el")
  ;(load "~/.emacs.d/themes/xres-theme.el"))

;; evil
(load "evil-init.el")

;; magit
(load "magit-init.el")

;; edits
(load "edits.el")

;; lang specific shit
(load "hask.el")

;; random shit
(load "misc.el")

;; Org mode shiz (for now)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (auctex eww-lnum eww-Inum sublime-themes sourcerer-theme smooth-scrolling quelpa-use-package powerline markdown-mode magit lua-mode haskell-mode evil-mu4e evil-leader dracula-theme counsel circe all-the-icons abyss-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
