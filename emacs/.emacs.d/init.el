;;(package-initialize)

(add-to-list 'load-path "~/.emacs.d/custom")
(setq twittering-use-master-pasword t)


;; fak u
(load "private.el")

;; pkgs
(load "pkg.el")
(load "circe-init.el")
(load "ivy-init.el")
(load "twittering-mode.el")
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



;; put this in misc
(put 'dired-find-alternate-file 'disabled nil)
(setq ring-bell-function 'ignore)


;; Org mode shiz (for now)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
