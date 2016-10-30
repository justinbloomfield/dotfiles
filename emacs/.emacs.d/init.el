;;(package-initialize)

(add-to-list 'load-path "~/.emacs.d/custom")

;; fak u
(load "private.el")

;; pkgs
(load "pkg.el")
(load "circe-init.el")
(load "ivy-init.el")
(load "mu4e-init.el")
(load "auctex-init.el")

;; ui
(load "ui.el")
(load "modeline-init.el")
(load "~/.emacs.d/themes/dark-mono-theme.el")

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
