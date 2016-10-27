;; get rid of useless shit
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; remove stupid lines
(set-window-fringes nil 0 0)
(fringe-mode 0)

;; numbers
(global-linum-mode)

;; change outdated 90's modeline hilite
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

;; change dumb fonts
(if (eq system-type 'darwin)
    (set-default-font "Fantasque Sans Mono-12.5")
    (set-default-font "FantasqueSans Mono-10"))

(set-face-bold-p 'bold nil)
(mapc
 (lambda (face)
        (when (eq (face-attribute face :weight) 'bold)
          (set-face-attribute face nil :weight 'normal)))
 (face-list))

;; let the glow flow through you
;;(global-hl-line-mode t)

;; theme
(load-theme 'granger t)

;; make line wrapping actually work
(global-visual-line-mode t)

;; fuck off with your propoganda
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

;; ibuffer
(setq ibuffer-expert t)
(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-saved-filter-groups
      '(("memes"
         ("email" (name . "\*mu4e"))
         ("emacs-config" (or (filename . ".emacs.d")
         ("notes" (or (filename . "*.md")
                      (mode . markdown-mode)))
                             (filename . "emacs-config")))
         ("git" (name . "\*magit"))
         ("irc" (or (mode . circe-server-mode)
                    (mode . circe-channel-mode))))))

(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-switch-to-saved-filter-groups "memes")))

(setq linum-format "%4d ")
