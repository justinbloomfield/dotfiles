;; make emacs better
(global-linum-mode)
(setq linum-format "%3d ")

;; get rid of useless shit
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; remove stupid lines
(set-window-fringes nil 0 0)
(set-fringe-style 0)

;; change outdated 90's modeline hilite
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

;; change dumb fonts
(set-default-font "leggie-10")
(set-face-bold-p 'bold nil)
(mapc
 (lambda (face)
        (when (eq (face-attribute face :weight) 'bold)
          (set-face-attribute face nil :weight 'normal)))
 (face-list))


;; make line wrapping actually work
(global-visual-line-mode t)

;; fuck off with your propoganda
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

