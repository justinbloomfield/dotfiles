;;; poq's emacs config, use at own risk

;; pkg
(require 'package)

(setq package-archives nil)

(setq package-enable-at-startup nil)
(package-initialize)

;;; edits
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

;;; ui
;; remove modeline 90's box thing
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

;; gross gui shit
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode -1)

;; theme/modeline
;;(load-file "~/.emacs.d/custom/modeline-custom-nogui.el")
(load-file "~/.emacs.d/themes/xres-theme.el")

;; fuck GNU
(setq inhibit-startup-screen t)

;;; pkgs
;; asonethusaonethu
(use-package all-the-icons
  :ensure t)

;; ace-window
(use-package ace-window
  :bind ("C-x o" . ace-window))

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
 "m" 'mu4e
 "g" 'magit-status
 "w" 'save-buffer
 "f" 'counsel-find-file
 "p" 'clipboard-yank)

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
(setq vc-follow-symbolics nil)
(evil-set-initial-state 'magit-mode 'normal)
(evil-set-initial-state 'magit-status-mode 'normal)
(evil-define-key 'normal magit-mode-map
  "t" 'magit-section-forward
  "n" 'magit-section-backward)
(setq magit-completing-read-function 'ivy-completing-read)

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

;;; misc
;; bold font fuck off
(set-face-bold-p 'bold nil)
(mapc
 (lambda (face)
        (when (eq (face-attribute face :weight) 'bold)
          (set-face-attribute face nil :weight 'normal)))
 (face-list))

