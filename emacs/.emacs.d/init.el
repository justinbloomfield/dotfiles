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

;; magit
(load "magit-init.el")

;; edits
(load "edits.el")


;; put this in misc
(put 'dired-find-alternate-file 'disabled nil)

;; Org mode shiz (for now)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(custom-set-variables
 '(package-selected-packages
   (quote
    (use-package markdown-preview-mode markdown-preview-eww magit eww-lnum evil-visual-mark-mode evil-leader circe buffer-move))))
(custom-set-faces
 )
