;;; poq's emacs config, blatantly ripped from arc and modified. use at own risk

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; fuck you tramp
(defun sudo-edit (&optional arg)
  "edit current files as root"
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file (as root):")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
(global-set-key (kbd "C-x C-r") 'sudo-edit)

;; QL/STUMPWM
(load "~/.quicklisp/slime-helper.el")
(slime-setup '(slime-fancy slime-highlight-edits))
(setf slime-scratch-file "~/.ql/slime-scratch.lisp")
(defun stumpwm-config ()
  "Open file & connect to slime instance"
  (interactive)
  (find-file "~/.config/stumpwm/config")
  (slime-connect "127.0.0.1" "4005"))

;;; PKG
(require 'package)

(setq package-archives nil)
;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
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
(load-theme 'base16-pico t)
(set-face-attribute 'default nil :foreground "#bbbbbb")
;(global-linum-mode t)
;(setq linum-format " %3d ")
(column-number-mode t)
(set-default-font "PxPlus IBM VGA8-11:antialias=true")
(set-face-bold-p 'bold nil)

(setq-default mode-line-format
              (list
               " %b "
               " %l,%c "))

;; let the glow flow through you
;(global-hl-line-mode nil)

;; remove modeline 90's box thing
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)
(pretty-mode)

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
         ("emacs-config" (filename . ".emacs.d"))
         ("git" (name . "\*magit"))
         ("org" (mode . org-mode))
         ("irc-chan" (or (mode . circe-channel-mode)
                         (mode . circe-query-mode)))
         ("irc-serv" (mode . circe-server-mode))
         ("exwm" (mode . exwm-mode))
         ("eww" (mode . eww-mode))
         ("haskell" (mode . haskell-mode))
         ("lisp" (mode . lisp-mode))
         ("nix" (or (mode . nix-mode)
                    (name . "\*nix")))
         ("scheme" (mode . scheme-mode)))))

(setq ibuffer-never-show-predicates
      '("\*scratch\*"
        "*tramp*"
        "\*Messages\*"
        "\*Help\*"))

(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-auto-mode 1)
             (ibuffer-switch-to-saved-filter-groups "memes")))

(global-set-key (kbd "C-x C-b") 'ibuffer)


;; fuck GNU
(setq inhibit-startup-screen t)

;;; PKGS
;(use-package all-the-icons)

;; ace-window

(global-set-key (kbd "C-x o") 'ace-window)
(setq aw-keys '(?a ?o ?e ?u ?h ?t ?n ?s))

;; auctex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq font-latex-fontify-script 'invisible)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'Latex-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(eval-after-load "tex"
  '(progn
     (add-to-list 'TeX-view-program-list '("zathura" ("zathura" (mode-io-correlate " -p %(outpage)") " %o")))
     (setq TeX-view-program-selection '((output-pdf "zathura")))))


;; company
(add-hook 'after-init-hook 'global-company-mode)


;; emms
(emms-standard)
(emms-default-players)
(setq emms-playlist-buffer-name "EMMS")
(require 'emms-info-libtag)
(setq emms-info-functions '(emms-info-libtag))
(setq emms-source-file-default-directory "/mnt/Music/")
(defvar emms-browser-info-title-format "%i%n")
(defvar emms-browser-playlist-info-title-format
  emms-browser-info-title-format)
(setq emms-history-file "~/.emacs.d/emms_hist")
(emms-history-load)



;; magit
(setq magit-completing-read-function 'ivy-completing-read)
(setq vc-follow-symlinks nil)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(setq org-directory "~/var/org")
(setq org-default-notes-file "~/var/org/notes.org")
(global-set-key (kbd "C-c g") 'magit-status)


;; ivy/counsel/swiper
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")


;; multi-term
(setq multi-term-program "mksh")


;; neotree
(setq neo-theme 'ascii)
(global-set-key (kbd "C-c t") 'neotree-toggle)


;; haskell-mode
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
;;(add-hook 'haskell-mode-hook 'intero-mode)


;; slime
(setq inferior-lisp-program "sbcl")
(slime-setup '(slime-company))


;; mu4e
(require 'mu4e)
(setq mu4e-maildir "/home/poq/var/mail/jbl")
(setq mu4e-sent-folder "/Sent"
      mu4e-drafts-folder "/Drafts"
      mu4e-trash-folder "/Trash")
(setq mu4e-maildir-shortcuts
      '(("/Inbox" . ?i)
        ("/Sent"  . ?s)))
(setq mu4e-user-mail-address-list '("jbloomfield@live.com"))
(setq mu4e-headers-fields
      '((:human-date   .  25)
        (:flags        .   6)
        (:from         .  22)
        (:subject      .  nil)))

(setq mu4e-get-mail-command "mbsync jbloo")
(setq mu4e-reply-to-address "jbloomfield@live.com"
      user-mail-address "jbloomfield@live.com"
      user-full-name "Justin Bloomfield")
(setq
 message-send-mail-function 'message-send-mail-with-sendmail
 sendmail-program "msmtp")
(setq message-kill-buffer-on-exit t)
(setq mu4e-use-fancy-chars t)
(global-set-key (kbd "C-c m") 'mu4e)
;(setq mu4e-view-show-images t)

;; geiser
(setq geiser-active-implementations '(guile))

;; elfeed
(require 'elfeed)
;(setq elfeed-feeds
;      '("https://github.com/martanne/dvtm/commits/master.atom"))

(setq-default elfeed-search-filter "@2-weeks-ago +unread ")
(add-hook 'elfeed-new-entry-hook
          (elfeed-make-tagger :feed-url "youtube\\.com"
                              :add '(video youtube)))
(add-hook 'elfeed-new-entry-hook
          (elfeed-make-tagger :feed-url "github\\.com"
                              :add '(code git))
          t)


(defun mpv-open (url)
  (async-shell-command(format "mpv %s" url)))

(defun elfeed-mpv-open ()
  (interactive)
  (let ((entry (elfeed-search-selected :single)))
    (mpv-open (elfeed-entry-link entry))))

(define-key elfeed-search-mode-map "x" #'elfeed-mpv-open)
(global-set-key (kbd "C-c r") 'elfeed)

;; async-shell-command fixeridoos
(setq async-shell-command-buffer 'new-buffer)
(add-to-list 'display-buffer-alist
             '("^*Async Shell Command*" . (display-buffer-no-window)))


;;; MISCBINDS
(global-set-key (kbd "C-c c n")
                (lambda ()
                  (interactive)
                  (find-file "/sudo::/etc/nixos/configuration.nix")))

(global-set-key (kbd "C-c c e")
                (lambda ()
                  (interactive)
                  (find-file "~/.emacs.d/init.el")))

(global-set-key (kbd "C-c n")
                (lambda ()
                  (interactive)
                  (find-file "~/var/org/notes.org")))

(global-set-key (kbd "C-c c s") 'stumpwm-config)
(global-set-key (kbd "C-c d") 'dired)
(global-set-key (kbd "C-x b") 'switch-to-buffer)
(global-set-key (kbd "C-c x") 'counsel-M-x)
(global-set-key (kbd "C-c a b") 'emms-browser)
(global-set-key (kbd "C-c a p") 'emms)
(global-set-key (kbd "C-y") 'counsel-yank-pop)

(setq disabled-command-function nil)
(setenv "PATH" (concat (getenv "PATH") ":/run/current-system/sw/bin"))

;;; ESHELL
(setq eshell-aliases-file "~/.emacs.d/alias.el")
(setq eshell-cmpl-cycle-completions t)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)
(add-hook 'eshell-mode-hook '(lambda nil (prefer-coding-system 'utf-8)))

(global-set-key (kbd "C-c s")
                (lambda ()
                  (interactive)
                  (switch-to-buffer "*eshell*")))

(eshell)
;;; EXWM
;(require 'exwm)
;(require 'exwm-config)
;(exwm-config-default)
;(exwm-enable t)

