;; backup files
(setq temp-file-dir "~/.emacs.d/.tmp")
(setq backup-directory-alist
      `((".*" . ,temp-file-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,temp-file-dir t)))

;; tabsen
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;(setq indent-line-function 'insert-tab)

;; electric pairs
(electric-pair-mode)
