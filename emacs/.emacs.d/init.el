;;(package-initialize)

(add-to-list 'load-path "~/.emacs.d/custom")


;; fak u
(load "private.el")

;; pkgs
(load "pkg.el")
(load "circe-init.el")
(load "ivy-init.el")
(load "twittering-mode.el")
(load "mu4e-init.el")
(setq twittering-use-master-pasword t)

;; ui
(load "ui.el")
(when (display-graphic-p)
  (load "modeline-init.el"))
  ;(load "~/.emacs.d/themes/xres-theme.el"))

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
(setq ring-bell-function 'ignore)


;; Org mode shiz (for now)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-mu4 mu4e-evil mu4e evil-mu4e ein-mumamo use-package sublime-themes smooth-scrolling powerline nlinum-relative markdown-preview-mode markdown-preview-eww magit lua-mode linum-relative haskell-mode eww-lnum evil-visual-mark-mode evil-leader counsel circe buffer-move all-the-icons))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
