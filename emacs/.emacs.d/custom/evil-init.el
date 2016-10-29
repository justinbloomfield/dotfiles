;; for dired h
(defun my-dired-up-directory ()
  "Take dired up one directory, but behave like dired-find-alternate-file"
  (interactive)
  (let ((old (current-buffer)))
    (dired-up-directory)
    (kill-buffer old)
    ))

(defun buf-name ()
  (message "%s" major-mode))

;; macros
(fset 'mymacro
   [?y ?y ?p ?V ?r ?\C-k ?h ?h ?v ?y ?4 ?p ?0 ?r ?\C-k ?u ?l ?$ ?r ?\C-k ?u ?r ?y ?y ?k ?P ?r ?\C-k ?d ?l ?$ ?r ?\C-k ?d ?r ?j ?0 ?i ?\C-k ?v ?v ?\C-k escape ?$ ?a ?  ?\C-k ?v ?v escape])
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; evil config
(defun  my-evil-config ()
  "Configure evil mode"
  (setq evil-want-C-i-jump nil)
  (eval-after-load 'ibuffer
    '(progn
       (evil-set-initial-state 'ibuffer-mode 'normal)
       (evil-define-key 'normal ibuffer-mode-map
	 (kbd "J") 'ibuffer-jump-to-buffer
	 (kbd "d") 'ibuffer-mark-for-delete
	 (kbd "x") 'ibuffer-do-kill-on-deletion-marks
	 (kbd "j") 'evil-next-line
	 (kbd "k") 'evil-previous-line
	 (kbd "l") 'ibuffer-visit-buffer

	 )
       )
    )                             

  ;; Make escape quit everything, whenever possible.
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

  ;; border macro
  (evil-set-register ?b [?y ?y ?p ?V ?r ?\C-k ?h ?h ?v ?y ?4 ?p ?0 ?r ?\C-k ?u ?r ?$ ?r ?\C-k ?u ?l ?y ?y ?k ?P ?r ?\C-k ?d ?r ?$ ?r ?\C-k ?d ?l ?j ?0 ?i ?\C-k ?v ?v ?  escape ?$ ?a ?  ?\C-k ?v ?v escape])

  ;; make org mode tab great again
  (add-hook 'org-mode-hook
	    (lambda()
	      (define-key evil-normal-state-map (kbd "TAB") 'org-cycle)))
  (eval-after-load 'dired
    '(progn
       (evil-set-initial-state 'dired-mode 'normal)
       (evil-define-key 'normal dired-mode-map
	 (kbd "h") 'my-dired-up-directory
	 (kbd "l") 'dired-find-alternate-file
	 (kbd "o") 'dired-sort-toggle-or-edit
	 (kbd "v") 'dired-toggle-marks
	 (kbd "m") 'dired-mark
	 (kbd "u") 'dired-unmark
	 (kbd "U") 'dired-unmark-all-marks
	 (kbd "c") 'dired-create-directory
	 (kbd "n") 'evil-search-next
	 (kbd "N") 'evil-search-previous
	 (kbd "q") 'kill-this-buffer
	 )
       )
    )
)

(defun my-evil-leader-config ()
  "Configure evil leader mode"
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "d" 'dired
    "e" 'eww
    "g" 'magit-status
    "w" 'save-buffer
    "q" 'kill-buffer-and-window
    "i" 'ibuffer
    "c" 'circe

    ;; ivy
    "f" 'counsel-find-file
    "F" 'counsel-describe-function
    "V" 'counsel-descibe-variable
    "/" 'swiper

    ;; window management
    "h" 'evil-window-left
    "j" 'evil-window-down
    "k" 'evil-window-up
    "l" 'evil-window-right
    "H" 'shrink-window-horizontally
    "J" 'shrink-window
    "K" 'enlarge-window
    "L" 'enlarge-window-horizontally
    "n" 'evil-window-split
    "v" 'evil-window-vsplit
    "bh" 'buf-move-left
    "bj" 'buf-move-down
    "bk" 'buf-move-up
    "bl" 'buf-move-right
    "bn" 'buf-name

    ;; org
    "oa" 'org-agenda
    "ol" 'org-store-link
    "oc" 'org-capture
    "ob" 'org-iswitchb
    )
  )

(use-package evil
  :ensure t
  :config
  (add-hook 'evil-mode-hook 'my-evil-config)
  (evil-mode 1)

  (use-package evil-leader
    :ensure t
    :config
    (my-evil-leader-config)
    (global-evil-leader-mode)))

;;(provide 'init-evil)
