;;(package-initialize)

(add-to-list 'load-path "~/.emacs.d/custom")


;; fak u
(load "private.el")

;; pkgs
(load "pkg.el")

;; ui
(load "modeline-init.el")
(load "curr-theme.el")
(load "ui.el")

;; evil
(load "evil-init.el")

;; circe
(load "circe-init.el")

;; magit
(load "magit-init.el")

;; edits
(load "edits.el")




;; put this in misc
(put 'dired-find-alternate-file 'disabled nil)

;; Org mode shiz (for now)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (smooth-scrolling use-package powerline markdown-preview-mode markdown-preview-eww magit eww-lnum evil-visual-mark-mode evil-leader circe buffer-move all-the-icons))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
