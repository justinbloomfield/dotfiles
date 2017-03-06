;; change outdated 90's modeline hilite
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)


(set-face-bold-p 'bold nil)
(mapc
 (lambda (face)
        (when (eq (face-attribute face :weight) 'bold)
          (set-face-attribute face nil :weight 'normal)))
 (face-list))

;; let the glow flow through you
;;(global-hl-line-mode t)

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
                             (filename . "emacs-config")))
         ("notes" (filename . "uninotes"))
         ("git" (name . "\*magit"))
         ("org" (mode . org-mode))
         ("mpc" (name . "MPC-*"))
         ("irc-chan" (or (mode . circe-channel-mode)
                         (mode . circe-query-mode)))
         ("irc-serv" (mode . circe-server-mode))
         ("exwm" (mode . exwm-mode))
         ("eww" (mode . eww-mode))
         ("haskell" (mode . haskell-mode))
         ("scheme" (mode . scheme-mode)))))


(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-auto-mode 1)
             (ibuffer-switch-to-saved-filter-groups "memes")))

;; change dumb fonts
(if (eq system-type 'darwin)
    (setq default-frame-alist '((font . "Fantasque Sans Mono-12.5")))
    (setq default-frame-alist '((font . "tewi"))))
;    (set-default-font "Fantasque Sans Mono-12.5")
;    (set-default-font "gohufont-11")

;; numbers
;;(global-linum-mode)
;;(setq linum-format "%4d ")

;; fix stupid lines
(setq fringe-mode 'default)

;; make stupid lines match
(set-face-attribute 'fringe nil
                    :foreground (face-foreground 'default)
                    :background (face-background 'default))


;; get rid of useless shit
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

