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
(load "org-init.el")

;; ui
;;(load "modeline-init.el")
;;(load "~/.emacs.d/themes/dark-mono-theme.el")
(load "ui.el")

;; evil
(load "evil-init.el")

;; satan
(setq custom-file "~/.emacs.d/custom/custom.el")
(load custom-file)
;; magit
(load "magit-init.el")

;; edits
(load "edits.el")

;; lang specific shit
(load "hask.el")

;; random shit
(load "misc.el")

