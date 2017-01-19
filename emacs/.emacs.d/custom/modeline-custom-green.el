(defun custom-modeline-mode-icon ()
  (let ((icon (all-the-icons-icon-for-buffer)))
    (unless (symbolp icon) ;; This implies it's the major mode
      (format " %s"
              (propertize
               icon
               'face
               `(:height 1.0 :family ,(all-the-icons-icon-family-for-buffer) :foreground "#009100")
               'display '(raise -0.1))))))

(defun evil-mode-state ()
  (let ((str (cond ((evil-normal-state-p) " n ")
                   ((evil-insert-state-p) " i ")
                   ((evil-visual-state-p) " v ")
                   ((evil-emacs-state-p)  " e ")
                   ((evil-operator-state-p) " o ")
                   ((evil-motion-state-p) " m ")
                   ((evil-replace-state-p) " r "))))
    (propertize
     str
     'face `(:foreground "#0ff20f"))))

(defun vc-mode-branch-state ()
  (let ((bufname (buffer-file-name (current-buffer))))
    (when bufname
      (when (magit-get-current-branch)
        (propertize
         (format " b: %s " (magit-get-current-branch))
         'face `(:foreground "#009100" ))))))

(defun time ()
  (propertize (format-time-string " %H:%M ") 'face `(:foreground "#007f00")))

(defun current-buffer-title ()
  (propertize " %b " 'face `(:foreground "#30e630")))

(defun blank ()
  propertize "")

(defun now-playing ()
  (propertize
   (format " %s " (shell-command-to-string "echo -n $(mpc current)")) ;; needs to be echo -n to avoid trailing ^J in output
   'face `(:foreground "#007f77" )))

(defvar ml-selected-window nil)  

(defun ml-record-selected-window ()  
  (setq ml-selected-window (selected-window)))  
  
(defun ml-update-all ()  
  (force-mode-line-update t))  
  
(add-hook 'post-command-hook 'ml-record-selected-window)  
  
(add-hook 'buffer-list-update-hook 'ml-update-all)  
  
(setq-default mode-line-format  
  '(:eval  
      (if (eq ml-selected-window (selected-window))  
          (list
           '(:eval (concat
                   (custom-modeline-mode-icon)
                   (current-buffer-title)
                   (evil-mode-state)
                   (vc-mode-branch-state)
                   (now-playing)
                   (time))))
        (list
         '(:eval (concat
                  (custom-modeline-mode-icon)
                  (current-buffer-title)
                  (evil-mode-state)
                  (vc-mode-branch-state))))))) 
 