(defun xresources-theme-color (name)
  "Read the color NAME (e.g. color5) for X resources"
  (x-get-resource name ""))

(setq foreground (xresources-theme-color "foreground")
    background (xresources-theme-color "background")
    black (xresources-theme-color "color0")
    red (xresources-theme-color "color1")
    green (xresources-theme-color "color2")
    yellow (xresources-theme-color "color3")
    blue (xresources-theme-color "color4")
    magenta (xresources-theme-color "color5")
    cyan (xresources-theme-color "color6")
    gray (xresources-theme-color "color7")
    light-gray (xresources-theme-color "color8")
    light-red (xresources-theme-color "color9")
    light-green (xresources-theme-color "color10")
    light-yellow (xresources-theme-color "color11")
    light-blue (xresources-theme-color "color12")
    light-magenta (xresources-theme-color "color13")
    light-cyan (xresources-theme-color "color14")
    white (xresources-theme-color "color15"))


(setq colour1 red)
;;  "branch, icon, buffername")

(setq colour2 green)
;;  "time")

(setq colour3 magenta)
;;  "now playing")

(setq colour4 cyan) 
;;  "evil-state")

;; what's in it
(defun custom-modeline-mode-icon ()
  (let ((icon (all-the-icons-icon-for-buffer)))
    (unless (symbolp icon) ;; This implies it's the major mode
      (format " %s"
            (propertize
            icon
            'face
            `(:height 1.0 :family ,(all-the-icons-icon-family-for-buffer) :foreground ,colour4)
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
     'face `(:foreground ,colour4)))) 

(defun vc-mode-branch-state ()
  (let ((bufname (buffer-file-name (current-buffer))))
    (when bufname
      (when (magit-get-current-branch)
        (propertize
         (format " b: %s " (magit-get-current-branch))
         'face `(:foreground ,colour1))))))

(defun time ()
  (propertize (format-time-string " %H:%M ") 'face `(:foreground ,colour2))) 

(defun current-buffer-title ()
  (propertize " %b " 'face `(:foreground ,colour1))) 

(defun blank ()
  (propertize ""))

(defun now-playing ()
  (propertize
   (format " %s " (shell-command-to-string "echo -n $(mpc current)")) ;; needs to be echo -n to avoid trailing ^J in output
   'face `(:foreground ,colour3))) 

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
                   (blank)
;                   (now-playing)
                   (time))))
        (list
         '(:eval (concat
                  (custom-modeline-mode-icon)
                  (current-buffer-title)
                  (evil-mode-state)
                  (vc-mode-branch-state)))))))
 
