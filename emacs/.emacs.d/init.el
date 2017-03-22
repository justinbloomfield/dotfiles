;;; poq's emacs config, blatantly ripped from arc and modified. use at own risk

;; fuck you tramp
(defun sudo-edit (&optional arg)
  "edit current files as root"
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file (as root):")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
(global-set-key (kbd "C-x C-r") 'sudo-edit)

;; PKG
(require 'package)

(setq package-archives nil)

(setq package-enable-at-startup nil)
(package-initialize)

;;; EDITS
(setq temp-file-dir "~/.emacs.d/.tmp")
(setq backup-directory-alist
      `((".*" . ,temp-file-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,temp-file-dir t)))

;; tabs
(setq standard-indent 4)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; backtab
(global-set-key (kbd "<backtab>") 'un-indent-by-removing-4-spaces)

(defun un-indent-by-removing-4-spaces ()                          
  "remove 4 spaces from beginning of of line"                     
  (interactive)                                                   
  (save-excursion                                                 
    (save-match-data                                              
      (beginning-of-line)                                         
      ;; get rid of tabs at beginning of line                     
      (when (looking-at "^\\s-+")                                 
        (untabify (match-beginning 0) (match-end 0)))             
      (when (looking-at "^    ")                                  
        (replace-match "")))))

;; electric pairs
(electric-pair-mode)

;;; UI
;; theme/modeline
(setq custom-safe-themes t)
(load-theme 'base16-atelier-lakeside)
(global-linum-mode t)
(setq linum-format " %3d ")

;; remove modeline 90's box thing
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

;; gross gui shit
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode -1)

;; ibuffer
(setq ibuffer-expert t)
(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-saved-filter-groups
      '(("memes"
         ("email" (name . "\*mu4e"))
         ("emacs-config" (or (filename . ".emacs.d")
                             (filename . "emacs-config")))
         ("git" (name . "\*magit"))
         ("org" (mode . org-mode))
         ("irc-chan" (or (mode . circe-channel-mode)
                         (mode . circe-query-mode)))
         ("irc-serv" (mode . circe-server-mode))
         ("exwm" (mode . exwm-mode))
         ("eww" (mode . eww-mode))
         ("haskell" (mode . haskell-mode))
         ("scheme" (mode . scheme-mode)))))

;; let the glow flow through you
(global-hl-line-mode t)

;; fuck GNU
(setq inhibit-startup-screen t)

;;; PKGS
;(use-package all-the-icons)

;; ace-window
(use-package ace-window
  :bind ("C-x o" . ace-window))

;; circe
(load-file "~/.emacs.d/custom/private.el")
(require 'tls)
(setq circe-network-options
      `(("fn"
         :host "irc.freenode.net"
         :port 6667
         :nick "piecesofquiet"
         :channels ("#crux")
         :nickserv-identify-challenge "\C-b/msg\\s-NickServ\\s-identify\\s-<password>\C-b"
         :nickserv-identify-command "PRIVMSG NickServ :IDENTIFY {nick} {password}"
         :nickserv-identify-confirmation "^You are now identified for.*\\.$" 
         :nickserv-password ,irc-pass)
        ("nx"
         :host "irc.unix.chat"
         :tls t
         :port 6697
         :nick "poq"
         :channels ("#unix")
         :nickserv-identify-challenge "\C-b/msg\\s-NickServ\\s-identify\\s-<password>\C-b"
         :nickserv-identify-command "PRIVMSG NickServ :IDENTIFY {nick} {password}"
         :nickserv-identify-confirmation "^You are now identified for.*\\.$" 
         :nickserv-password ,irc-pass)
        ("fb"
         :host "im.codemonkey.be"
         :port 6667
         :nick "piecesofquiet"
         :nickserv-password ,irc-pass)))

(setq
 lui-time-stamp-position 'right-margin
 lui-fill-type nil)

(setq circe-use-tls t)

(add-hook 'lui-mode-hook 'my-lui-setup)
(defun my-lui-setup ()
  (setq
   fringes-outside-margins t
   right-margin-width 9
   word-wrap t
   wrap-prefix "    ")
  (linum-mode 0))

;; company
(add-hook 'after-init-hook 'global-company-mode)

;; evil
(evil-mode nil)
(global-evil-leader-mode)
(evil-mode 1)

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
 "c" 'circe
 "d" 'dired
 "e" 'emms
 "i" 'switch-to-buffer
 "b" 'ibuffer
 "m" 'mu4e
 "g" 'magit-status
 "w" 'save-buffer
 "f" 'counsel-find-file
 "p" 'clipboard-yank)

(eval-after-load 'ibuffer
    '(progn
       (evil-set-initial-state 'ibuffer-mode 'normal)
       (evil-define-key 'normal ibuffer-mode-map
	 (kbd "J") 'ibuffer-jump-to-buffer
	 (kbd "d") 'ibuffer-mark-for-delete
	 (kbd "x") 'ibuffer-do-kill-on-deletion-marks
	 (kbd "t") 'evil-next-line
	 (kbd "n") 'evil-previous-line
	 (kbd "l") 'ibuffer-visit-buffer)))
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; dvorak bindings
(define-key evil-normal-state-map (kbd "h") 'backward-char)
(define-key evil-normal-state-map (kbd "t") 'evil-next-line)
(define-key evil-normal-state-map (kbd "n") 'evil-previous-line)
(define-key evil-normal-state-map (kbd "s") 'forward-char)
(define-key evil-visual-state-map (kbd "h") 'backward-char)
(define-key evil-visual-state-map (kbd "t") 'evil-next-line)
(define-key evil-visual-state-map (kbd "n") 'evil-previous-line)
(define-key evil-visual-state-map (kbd "s") 'forward-char)
(define-key evil-insert-state-map (kbd "<hiragana-katakana>") 'evil-normal-state)
(define-key evil-normal-state-map "/" 'swiper)
(define-key evil-normal-state-map "p" 'counsel-yank-pop)

;; magit
(use-package magit
  :config
  (progn
    (evil-set-initial-state 'magit-mode 'normal)
    (evil-set-initial-state 'magit-status-mode 'normal)
    (evil-define-key 'normal magit-mode-map
      "t" 'magit-section-forward
      "n" 'magit-section-backward)
    (setq magit-completing-read-function 'ivy-completing-read)))
(setq vc-follow-symlinks nil)

;; org-mode
(add-hook 'org-mode-hook
          (lambda()
            (define-key evil-normal-state-map (kbd "TAB") 'org-mode)))

(eval-after-load 'org-mode
  '(progn
     (evil-set-initial-state 'org-mode 'normal)
     (evil-define-key 'normal org-mode-map (kbd "RET") 'org-open-at-point)))

(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(setq org-directory "~/var/org")
(setq org-default-notes-file "~/var/org/notes.org")

(global-set-key (kbd "C-c n") (lambda () (interactive) (find-file "~/var/org/notes.org")))

;; ivy/counsel/swiper
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

;; multi-term
(setq multi-term-program "zsh")

;; haskell-mode
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook 'intero-mode)

;;; MISC
;; bold font fuck off
(set-face-bold-p 'bold nil)
(mapc
 (lambda (face)
        (when (eq (face-attribute face :weight) 'bold)
          (set-face-attribute face nil :weight 'normal)))
 (face-list))
(global-set-key (kbd "C-c c") (lambda () (interactive) (find-file "/sudo::/etc/nixos/configuration.nix")))

;;; EXWM
;;(require 'exwm)
;;(require 'exwm-config)
;;(exwm-config-default)
