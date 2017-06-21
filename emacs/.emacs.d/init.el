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
(load-theme 'spacegray t)
(global-linum-mode t)
(setq linum-format " %3d ")
(column-number-mode t)

(defun cbt ()
  (propertize " %b "))

(setq-default mode-line-format
              (list
               '(:eval (concat
                        (cbt)))))

;; let the glow flow through you
(global-hl-line-mode nil)

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
(setq multi-term-program "zsh")

;; neotree
(setq neo-theme 'ascii)
(global-set-key (kbd "C-c t") 'neotree-toggle)

;; haskell-mode
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
;;(add-hook 'haskell-mode-hook 'intero-mode)


;; slime
;(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "clisp")
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
(setq geiser-active-implementations '(chez))

;;; MISC
;; bold font fuck off
(set-face-bold-p 'bold nil)
(mapc
 (lambda (face)
        (when (eq (face-attribute face :weight) 'bold)
          (set-face-attribute face nil :weight 'normal)))
 (face-list))

(global-set-key (kbd "C-c c n") (lambda () (interactive) (find-file "/sudo::/etc/nixos/configuration.nix")))
(global-set-key (kbd "C-c c e") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
(global-set-key (kbd "C-c d") 'dired)
(global-set-key (kbd "C-x b") 'switch-to-buffer)
(global-set-key (kbd "C-c x") 'counsel-M-x)
(global-set-key (kbd "C-c a") 'simple-mpc)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-y") 'counsel-yank-pop)
(global-set-key (kbd "C-c n") (lambda () (interactive) (find-file "~/var/org/notes.org")))

(setq disabled-command-function nil)
(setenv "PATH" (concat (getenv "PATH") ":/run/current-system/sw/bin"))

;;; EXWM
;(require 'exwm)
;(require 'exwm-config)
;(exwm-config-default)
;(exwm-enable t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (seoul256-theme seo use-package sublime-themes spacegray-theme slime-company simple-mpc pretty-mode nix-mode neotree multi-term magit intero geiser exwm evil-escape ess emms-player-mpv csv-mode counsel company-ghc circe cdlatex base16-theme auctex all-the-icons-dired ace-window)))
 '(sh-heredoc ((t (:foreground "DodgerBlue1")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
