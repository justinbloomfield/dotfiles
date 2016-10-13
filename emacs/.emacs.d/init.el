;(package-initialize)

(add-to-list 'load-path "~/.emacs.d/custom")

;; fak u
(load "private.el")

;; pkgs
(load "pkg.el")

;; ui
(load "ui.el")

;; evil
(load "evil-init.el")

;; circe
(load "circe-init.el")

;; edits
(load "edits.el")

;; put this in misc
(put 'dired-find-alternate-file 'disabled nil)

;; (require 'init-evil)
