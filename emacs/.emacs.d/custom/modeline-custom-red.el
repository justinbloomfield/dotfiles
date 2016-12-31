(defun custom-modeline-mode-icon ()
  (let ((icon (all-the-icons-icon-for-buffer)))
    (unless (symbolp icon) ;; This implies it's the major mode
      (format " %s"
              (propertize
               icon
               'face
               `(:height 1.0 :family ,(all-the-icons-icon-family-for-buffer) :foreground "#910000")
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
     'face `(:foreground "#f20f0f"))))

(defun vc-mode-branch-state ()
  (let ((bufname (buffer-file-name (current-buffer))))
    (when bufname
      (when (magit-get-current-branch)
        (propertize
         (format "  %s " (magit-get-current-branch))
         'face `(:foreground "#910000" ))))))

(defun time ()
  (propertize (format-time-string " %H:%M ") 'face `(:foreground "#ff007f")))

(defun current-buffer-title ()
  (propertize " %b " 'face `(:foreground "#e63030")))

(defun now-playing ()
  (propertize
   (format " %s " (shell-command-to-string "echo -n $(mpc current)")) ;; needs to be echo -n to avoid trailing ^J in output
   'face `(:foreground "#aa0037" )))

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
 
