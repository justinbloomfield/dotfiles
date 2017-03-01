(package-initialize)
(add-to-list 'load-path "~/.emacs.d/custom")

;; fak u
(load "private.el")

;; random shit
(load "misc.el")

;; pkgs
(load "pkg.el")
(load "evil-init.el")
;;(load "erc-init.el")
(load "circe-init.el")
(load "ivy-init.el")
;;(load "mu4e-init.el")
;(load "auctex-init.el")
(load "org-init.el")
;;(load "emms-init.el")
;;(load "exwm-init.el")
;;(load "ivy-youtube.el")

;; ui
(load "~/.emacs.d/custom/modeline-custom-nogui.el")
(load-file "~/.emacs.d/themes/xres-theme.el")
(load "ui.el")


;; satan
(setq custom-file "~/.emacs.d/custom/custom.el")
(load custom-file)

;; magit
(load "magit-init.el")

;; edits
(load "edits.el")

;; lang specific shit
(load "hask.el")

