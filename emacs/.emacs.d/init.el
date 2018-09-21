;;; poq's emacs config, use at own risk

(if (eq system-type 'darwin)
  (progn
    (require 'package)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
    (package-initialize)
    (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
    (setq exec-path (append exec-path '("/usr/local/bin")))
    (load-file "~/.emacs.d/custom/pkg.el"))
  (progn
    (require 'package)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
    (package-initialize)
    (load-file "~/.emacs.d/custom/pkg.el"))
)

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
;(load "~/.quicklisp/slime-helper.el")
(slime-setup '(slime-fancy slime-highlight-edits))
(setf slime-scratch-file "~/.ql/slime-scratch.lisp")
(defun stumpwm-config ()
  "Open file & connect to slime instance"
  (interactive)
  (find-file "~/.config/stumpwm/config") ;; make this check if the file is already open to avoid extra REPLS
  (slime-connect "127.0.0.1" "4005"))


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
(setq frame-resize-pixelwise nil)
(setq custom-safe-themes t)
(load-theme 'neeasade t)
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (set-face-attribute 'mode-line nil :font "Fantasque Sans Mono-11"))))
                  ;;(load-theme 'seoul256 t))))
;;                  (set-face-attribute 'default nil :foreground "#bbbbbb")
  (when (window-system)
    (load-theme 'minimal-light t)))

(set-face-bold-p 'bold nil)
(if (eq system-type 'darwin)
    (progn
      (setq default-frame-alist '((font . "Inconsolata-16:antialias=true")))
      (set-face-attribute 'mode-line nil :font "Fantasque Sans Mono-11"))
    (progn
      (setq default-frame-alist '((font . "Fantasque Sans Mono-13:antialias=true:autohint=true")))
      (set-face-attribute 'mode-line nil :font "Fantasque Sans Mono-13")))

(set-face-bold-p 'bold nil)

;; let the glow flow through you
;;(global-hl-line-mode nil)

;; remove modeline 90's box thing
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)
(pretty-mode)

;; gross gui shit
(when (window-system)
  (progn 
    (scroll-bar-mode -1)
    (fringe-mode '(10 . 0))))
;;    (set-face-attribute 'fringe nil :background "purple")))
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode '(0 . 0))
(set-display-table-slot standard-display-table 'wrap ?\ )


(defun focus-mode ()
  "Set margins to work better for centred shit"
  (setq left-margin-width 20)
  (setq right-margin-width 20)
  (setq mode-line-format nil))
(add-hook 'text-mode-hook focus-mode)
(add-hook 'text-mode-hook visual-line-mode)



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
         ("crux" (name . "Pkgfile"))
         ("irc-serv" (mode . circe-server-mode))
         ("exwm" (mode . exwm-mode))
         ("eww" (mode . eww-mode))
         ("haskell" (mode . haskell-mode))
         ("lisp" (mode . lisp-mode))
         ("nix" (or (mode . nix-mode)
                    (name . "\*nix")))
         ("dired" (mode . dired-mode))
         ("java" (name . "\.java"))
         ("scheme" (mode . scheme-mode)))))

(setq ibuffer-never-show-predicates
      '("\*scratch\*"
        "*tramp*"
        "\*Messages\*"
;;        "^\\*"
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

;; ;; auctex
;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq font-latex-fontify-script 'invisible)
;; (add-hook 'LaTeX-mode-hook 'visual-line-mode)
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;; (add-hook 'Latex-mode-hook 'turn-on-reftex)
;; (setq reftex-plug-into-AUCTeX t)
;; (eval-after-load "tex"
;;   '(progn
;;      (add-to-list 'TeX-view-program-list '("my-mupdf" ("mupdf" " %o" (mode-io-correlate " %(outpage)"))))
;;      (setq TeX-view-program-selection '((output-pdf "my-mupdf")))))
;; (setq org-latex-listings 'minted
;;       org-latex-packages-alist '(("" "minted"))
;;       org-latex-pdf-process
;;       '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
;;(add-to-list 'org-latex-packages-alist '(("" "listingsutf8")))

;; aurel

(setq aurel-list-download-function 'aurel-download-unpack-eshell)
(setq aurel-info-download-function 'aurel-download-unpack-eshell)

;; company
(add-hook 'after-init-hook 'global-company-mode)


;; circe
;; (load-file "~/.emacs.d/private.el")
;; (setq circe-network-options
;;       '(("Freenode"
;;          :tls nil
;;          :nick "piecesofquiet"
;;          :pass ,irc-pass
;;          :channels ("#crux"))
;;         ("twitch"
;;          :host "irc.chat.twitch.tv"
;;          :port 6667
;;          :tls nil
;;          :nick "piecesofquiet777"
;;          :pass "oauth:48giay9nsdgafs9ufhbfv6334x8v9e")))
;; (setq circe-reduce-lurker-spam t)
;; (setq circe-user-cycle-completion t)

;; erc
;;(load-file "~/.emacs.d/.ercrc.el")
;;(load-file "~/src/pkg/erc-twitch/erc-twitch.el")
;;(require 'erc-twitch)
;;(erc-twitch-enable)


;; ;; emms
;; (emms-standard)
;; (emms-default-players)
;; (setq emms-playlist-buffer-name "EMMS")
;; ;; (require 'emms-player-mpv)
;; (require 'emms-info-libtag)
;; (setq emms-info-functions '(emms-info-libtag))
;; (setq emms-source-file-default-directory "/mnt/Music")
;; (defvar emms-browser-info-title-format "%i%n")
;; (defvar emms-browser-playlist-info-title-format
;;   emms-browser-info-title-format)
;; (setq emms-history-file "~/.emacs.d/emms_hist")
;; (emms-history-load)

;; eww
(when (fboundp 'eww)
  (progn
    (defun eww-rename-hook ()
      "Rename eww browser's buffer so sites open in new page."
      (rename-buffer "eww" t))
    (add-hook 'eww-mode-hook 'eww-rename-hook)))


;; magit
(setq magit-completing-read-function 'ivy-completing-read)
(setq vc-follow-symlinks nil)
(global-set-key (kbd "C-c g") 'magit-status)



;; org
(require 'ox-latex)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(add-hook 'org-mode-hook 'pretty-mode)
(add-hook 'org-mode-hook 'flyspell-mode)
(setq org-directory "~/var/org")
(setq org-default-notes-file "~/var/org/notes.org")
(setq org-agenda-files (list "~/var/org/notes.org"
                            "~/usr/doc/uninotes/dates.org"))
(global-set-key (kbd "C-c o a") 'org-agenda)
(setq org-log-done t)
(setq org-src-preserve-indentation t)
(setq org-src-fontify-natively t)
(setq ispell-program-name "aspell")



;; ivy/counsel/swiper
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(ivy-mode 1)
(setq ivy-use-virtual-buffers nil)
(setq ivy-count-format "(%d/%d) ")


;; multi-term
(setq multi-term-program "mksh")


;; neotree
(setq neo-theme 'arrow)
(global-set-key (kbd "C-c t") 'neotree-toggle)


;; haskell-mode
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook 'intero-mode)
(setq haskell-process-type 'intero-repl)
;;(setq haskell-process-args-stack-ghci "")
;;(setq haskell-process-args-stack-ghci '("--with-ghc=intero" "--no-build" "--load"))


;; slime
(setq inferior-lisp-program "sbcl")
(slime-setup '(slime-company))


;; python
(setq python-shell-interpreter "/usr/bin/python3")

;; mu4e
;; (require 'mu4e)
;; (if (eq system-type 'darwin)
;;     (setq mu4e-maildir "/Users/j/var/mail/jbl")
;;   (setq mu4e-maildir "/home/poq/var/mail/jbl"))
;; (setq mu4e-sent-folder "/Sent"
;;       mu4e-drafts-folder "/Drafts"
;;       mu4e-trash-folder "/Trash")
;; (setq mu4e-maildir-shortcuts
;;       '(("/Inbox" . ?i)
;;         ("/Sent"  . ?s)))
;; (setq mu4e-user-mail-address-list '("jbloomfield@live.com"))
;; (setq mu4e-headers-fields
;;       '((:human-date   .  25)
;;         (:flags        .   6)
;;         (:from         .  22)
;;         (:subject      .  nil)))

;; (setq mu4e-get-mail-command "mbsync -V jbloo")
;; (setq mu4e-reply-to-address "jbloomfield@live.com"
;;       user-mail-address "jbloomfield@live.com"
;;        user-full-name "Justin Bloomfield")
;;
;; (setq message-kill-buffer-on-exit t)
;; (setq mu4e-use-fancy-chars t)
;; (global-set-key (kbd "C-c m") 'mu4e)
;; ;; (setq mu4e-view-show-images t)
;; ;; (if (eq system-type 'darwin)
;; ;;     (mu4e-alert-set-default-style 'growl)
;; ;;   (mu4e-alert-set-default-style 'libnotify))
;; ;; (add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
;; (add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)

;; notmuch

(setq message-send-mail-function 'message-send-mail-with-sendmail
      sendmail-program "msmtp")
(global-set-key (kbd "C-c m") 'notmuch)
;; mark deleted
(define-key notmuch-show-mode-map "d"
  (lambda ()
    "toggle deleted tag for message"
    (interactive)
    (if (member "deleted" (notmuch-show-get-tags))
        (notmuch-show-tag (list "-deleted"))
      (notmuch-show-tag (list "+deleted")))))

(define-key notmuch-search-mode-map "d"
  (lambda ()
    "toggle deleted tag for message"
    (interactive)
    (if (member "deleted" (notmuch-search-get-tags))
        (notmuch-search-tag (list "-deleted"))
      (notmuch-search-tag (list "+deleted")))))

(define-key notmuch-search-mode-map "u"
  (lambda ()
         "toggle unread tag for message"
         (interactive)
         (if (member "unread" (notmuch-search-get-tags))
             (notmuch-search-tag (list "-unread"))
           (notmuch-search-tag (list "+ead")))))

;; fetch / update
(define-key notmuch-search-mode-map "U"
  (lambda ()
    "update mail index & sync"
    (interactive)
    (async-shell-command "mbsync -V jbloo && notmuch new")))


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


;; (if (window-system)
  (defun mpv-open (url)
    (async-shell-command(format "mpv %s" url)))
;;(defun mpv-open (url)
;;  (async-shell-command(format "mpv --no-video %s" url)))

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

;; yasnippet
(require 'yasnippet)
(yas-reload-all)
(yas-global-mode)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-c e") 'yas-expand)
				
;;; MISCBINDS
(global-set-key (kbd "C-c c n")
                (lambda ()
                  (interactive)
                  (find-file "/sudo::/etc/nixos/configuration.nix")))

(global-set-key (kbd "C-c c d")
                (lambda ()
                  (interactive)
                  (find-file "~/usr/doc/uninotes/dates.org")))

(global-set-key (kbd "C-c c e")
                (lambda ()
                  (interactive)
                  (find-file "~/.emacs.d/init.el")))

(global-set-key (kbd "C-c n")
                (lambda ()
                  (interactive)
                  (find-file "~/var/org/notes.org")))
(global-set-key (kbd "S-<insert>") 'clipboard-yank)
(global-set-key (kbd "C-<insert>") 'clipboard-kill-ring-save)
(global-set-key (kbd "S-<help>") 'clipboard-yank)
(global-set-key (kbd "C-<help>") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-c c s") 'stumpwm-config)
(global-set-key (kbd "C-c d") 'dired)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c x") 'counsel-M-x)
(global-set-key (kbd "C-c a b") 'emms-browser)
(global-set-key (kbd "C-c a p") 'emms)
(global-set-key (kbd "C-y") 'counsel-yank-pop)
(global-set-key (kbd "C-c h") help-map)
(global-set-key (kbd "C-h") 'backward-delete-char-untabify)
(global-set-key (kbd "<hiragana-katakana>") 'backward-delete-char-untabify)
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
(server-start)

;; exwm
(require 'exwm)
(require 'exwm-config)
(require 'exwm-randr)

;;; randr
(setq exwm-randr-workspace-output-plist '(0 "HDMI-0"))
(add-hook 'exwm-randr-screen-change-hook
          (lambda ()
            (start-process-shell-command
             "xrandr" nil "xrandr --output HDMI-0 --left-of LVDS-0 --auto")))
(exwm-randr-enable)

(setq display-time-default-load-average t)
(setq display-time-mail-string "")
(display-time-mode t)
(setq exwm-workspace-number 5)

(add-hook 'exwm-update-class-hook
          (lambda ()
            (unless (or (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                        (string= "gimp" exwm-instance-name))
              (exwm-workspace-rename-buffer exwm-class-name))))
(add-hook 'exwm-update-title-hook
          (lambda ()
            (when (or (not exwm-instance-name)
                      (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                      (string= "gimp" exwm-instance-name))

              (exwm-workspace-rename-buffer exwm-title))))

(exwm-input-set-key (kbd "s-r") #'exwm-reset)
(exwm-input-set-key (kbd "s-w") #'exwm-workspace-switch)
(dotimes (i 5)
  (exwm-input-set-key (kbd (format "s-%d" i))
                      `(lambda ()
                         (interactive)
                         (exwm-workspace-switch-create ,i))))

(exwm-input-set-key (kbd "s-d")
                    (lambda (command)
                      (interactive (list (read-shell-command "> ")))
                      (start-process-shell-command command nil command)))

(exwm-input-set-key (kbd "s-<return>")
                    (lambda ()
                      (interactive)
                      (start-process-shell-command "st" nil "st")))

(exwm-input-set-key (kbd "s-q") 'kill-this-buffer)

;;(exwm-enable)

(provide 'init)
;;; init.el ends here
