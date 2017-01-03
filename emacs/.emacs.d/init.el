(package-initialize)

(add-to-list 'load-path "~/.emacs.d/custom")

;; fak u
(load "private.el")

;; random shit
(load "misc.el")

;; pkgs
(load "pkg.el")
(load "emms-init.el")
(load "circe-init.el")
(load "ivy-init.el")
(load "mu4e-init.el"):w
;;(load "auctex-init.el")
(load "org-init.el")
(load "modeline-hide.el")
;(load "exwm-init.el")
;;(load "ivy-youtube.el")

;; ui
(load "csc.el")
(csc)
;(load "~/.emacs.d/themes/xres-blue-theme.el")
;(load "modeline-custom-green.el")
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


