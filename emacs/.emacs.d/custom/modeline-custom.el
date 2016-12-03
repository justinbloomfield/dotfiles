(defun custom-modeline-mode-icon ()
  (let ((icon (all-the-icons-icon-for-buffer)))
    (unless (symbolp icon) ;; This implies it's the major mode
      (format " %s"
              (propertize
               icon
               'face
               `(:height 1.0 :family ,(all-the-icons-icon-family-for-buffer) :foreground "#00ff7f")
               'display '(raise -0.1))))))

(defun evil-mode-state ()
  (let ((str (cond ((evil-normal-state-p) " N ")
                   ((evil-insert-state-p) " I ")
                   ((evil-visual-state-p) " V ")
                   ((evil-emacs-state-p)  " E ")
                   ((evil-operator-state-p) " O ")
                   ((evil-motion-state-p) " M ")
                   ((evil-replace-state-p) " R "))))
    (propertize
     str
     'face `(:foreground "#ff007f"))))

(defun vc-mode-branch-state ()
  (let ((bufname (buffer-file-name (current-buffer))))
    (when bufname
      (when (magit-get-current-branch)
        (propertize
         (format "  %s " (magit-get-current-branch))
         'face `(:foreground "#007fff" ))))))

;(defun time ()
;  (propertize (format-time-string " %H:%M ") 'face `(:foreground "#00ff7f")))

(defun current-buffer-title ()
  (propertize " %b " 'face `(:foreground "#007fff")))

 
(setq-default mode-line-format
              (list
               '(:eval (concat
                       (custom-modeline-mode-icon)
                       (current-buffer-title)
                       (evil-mode-state)
                       (vc-mode-branch-state)))))
