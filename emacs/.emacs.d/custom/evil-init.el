;; for dired h
(defun my-dired-up-directory ()
  "Take dired up one directory, but behave like dired-find-alternate-file"
  (interactive)
  (let ((old (current-buffer)))
    (dired-up-directory)
    (kill-buffer old)
    ))

;; evil config
(defun  my-evil-config ()
  "Configure evil mode"
   
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

  ;; move buffers
  (define-key evil-normal-state-map (kbd "C-h") 'buf-move-left)
  (define-key evil-normal-state-map (kbd "C-j") 'buf-move-down) 
  (define-key evil-normal-state-map (kbd "C-k") 'buf-move-up)
  (define-key evil-normal-state-map (kbd "C-l") 'buf-move-right)

  ;; Make escape quit everything, whenever possible.
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

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
    "g" 'magit-status
    "w" 'save-buffer
    "q" 'kill-buffer-and-window
    "b" 'ibuffer
    "c" 'circe

    ;; window management
    "h" 'evil-window-left
    "j" 'evil-window-down
    "k" 'evil-window-up
    "l" 'evil-window-right
    "H" 'shrink-window-horizontally
    "J" 'shrink-window
    "K" 'enlarge-window
    "L" 'enlarge-window-horizontally
    "n" 'evil-window-new
    "v" 'evil-window-vnew
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
    (global-evil-leader-mode)
    (my-evil-leader-config)))

(provide 'init-evil)
