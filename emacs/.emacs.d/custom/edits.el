(setq backup-directory-alist 
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory)))

;; tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; fix linewrapping (that shit confuses me)
(setq default-truncate-lines t)
