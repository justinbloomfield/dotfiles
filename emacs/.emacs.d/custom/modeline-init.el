(defvar powerline-current-window nil)

(defun update-current-window (windows)
  (when (not (minibuffer-window-active-p (frame-selected-window)))
    (setq powerline-current-window (selected-window))))
(add-function :before pre-redisplay-function 'update-current-window)

(defun evil-tag-color ()
  (if (eq (get-buffer-window) powerline-current-window)
    (cond ((evil-normal-state-p)   "#333333")
          ((evil-visual-state-p)   "#666666")
          ((evil-insert-state-p)   "#756637")
          ((evil-emacs-state-p)    "maroon")
          ((evil-operator-state-p) "maroon")
          ((evil-motion-state-p)   "maroon")
          ((evil-replace-state-p)  "#555555"))
    (face-background 'mode-line-inactive)))

(defun branch-tag-bg-color ()
  (if (eq (get-buffer-window) powerline-current-window)
      "#424242"
    (face-background 'mode-line-inactive)))

(defun time-tag-bg-color ()
  (if (eq (get-buffer-window) powerline-current-window)
      "#ccc8a1"
    (face-background 'mode-line-inactive)))

(defun time-tag-fg-color ()
  (if (eq (get-buffer-window) powerline-current-window)
      "#181818"
    (face-foreground 'mode-line-inactive)))

(defun fancy-mode-line-render (left center right &optional lpad rpad)
  "Return a string the width of the current window with
LEFT, CENTER, and RIGHT spaced out accordingly, LPAD and RPAD,
can be used to add a number of spaces to the front and back of the string."
  (condition-case err
      (let* ((left (if lpad (concat (make-string lpad ?\s) left) left))
             (right (if rpad (concat right (make-string rpad ?\s)) right))
             (width (apply '+ (window-width)
                           (let ((m (window-margins)))
                             (list (or (car m) 0) (or (cdr m) 0)))))
             (total-length (+ (length left) (length center) (length right) 2)))
        (when (> total-length width) (setq left "" right ""))
        (let* ((left-space (/ (- width (length center)) 2))
               (right-space (- width left-space (length center)))
               (lspaces (max (- left-space (length left)) 1))
               (rspaces (max (- right-space (length right)) 1 0)))
          (concat left (make-string lspaces  ?\s)
                  center
                  (make-string rspaces ?\s)
                  right)))
    (error (format "[%s]: (%s) (%s) (%s)" err left center right))))

(defun evil-mode-state ()
  (let ((str (cond ((evil-normal-state-p)   (format " 01001110 " ))
                   ((evil-visual-state-p)   (format " 01010110 " ))
                   ((evil-insert-state-p)   (format " 01001001 " ))
                   ((evil-emacs-state-p)    (format " 01000101 " ))
                   ((evil-operator-state-p) (format " 01001111 " ))
                   ((evil-motion-state-p)   (format " 01001101 " ))
                   ((evil-replace-state-p)  (format " 01010010 " )))))
    (propertize
     str
     'face `(:height 1.2 :background ,(evil-tag-color) :weight medium))))

(defun vc-mode-branch-state ()
  (let ((bufname (buffer-file-name (current-buffer))))
    (when bufname
      (when (magit-get-current-branch)
        (propertize
         (format "  %s " (magit-get-current-branch))
         'face `(:weight medium :background ,(branch-tag-bg-color)))))))

(defun powerline-modified ()
  (let* ((config-alist
          '(("*" all-the-icons-faicon-family
             all-the-icons-faicon "chain-broken" :height 1.2 :v-adjust -0.0)
            ("-" all-the-icons-faicon-family
             all-the-icons-faicon "link" :height 1.0 :v-adjust -0.0)
            ("%" all-the-icons-octicon-family
             all-the-icons-octicon "lock" :height 1.0 :v-adjust -0.0)))
         (result (cdr (assoc (format-mode-line "%*") config-alist))))
    (let ((res
           (propertize
            (apply (cadr result) (cddr result))
            'face
            `(:background ,(evil-tag-color) :family ,(funcall (car result))))))
      (propertize
       (format "  %s" res)
       'face
       `(:background ,(evil-tag-color) :family ,(funcall (car result)))))))

(defun custom-modeline-mode-icon ()
  (let ((icon (all-the-icons-icon-for-buffer)))
    (unless (symbolp icon) ;; This implies it's the major mode
      (format " %s"
              (propertize
               icon
               'face
               `(:height 1.0 :family ,(all-the-icons-icon-family-for-buffer))
               'display '(raise 0.0))))))

(defun line-count-line ()
  (let* ((bg (time-tag-bg-color))
         (fg (time-tag-fg-color)))
    (concat
     (propertize
      (all-the-icons-faicon "first-order")
      'face
      `(:height 1.0 :background ,bg :foreground ,fg) 'display '(raise -0.0))
     (propertize
      (format " %%l/%d   "
	      (count-lines (point-min) (point-max)))
					;
      'face `(:background ,bg :foreground ,fg)))))

(defun powerline-time ()
  (let* ((hour (string-to-number (format-time-string "%I")))
         (icon (all-the-icons-wicon
                (format "time-%s" hour) :height 1.0 :v-adjust 0.0))
         (bg (time-tag-bg-color))
         (fg (time-tag-fg-color)))
    (concat
     (propertize
      (format-time-string " %H:%M ")
      'face
      `(:height 1.0 :background ,bg :foreground ,fg))
     (propertize
      (format "%s" icon)
      'face
      `(:height 1.0 :family "Weather Icons" :background ,bg :foreground ,fg)
      'display '(raise -0.0))
     (propertize
      " · "
      'face `(:height 1.0 :background ,bg :foreground ,fg)))))

(defvar separator-left
  (propertize
   ""
   'face `(:height 1.0 :foreground "#86261c") 'display '(raise -0.0)))

(defvar separator-right
  (propertize
   ""
   'face `(:height 1.0 :foreground "#86261c") 'display '(raise -0.0)))

(setq-default mode-line-format
              (list
               '((:eval (fancy-mode-line-render
                         ;; left
                         (format-mode-line
                          (concat
                           (powerline-modified)
                           (evil-mode-state)
                           (vc-mode-branch-state)
                           (custom-modeline-mode-icon) ;; %m
                           " %b "))
                         ;;center
                         " "
                         ;; right
                         (format-mode-line
                          (concat
                           separator-left
                           ;; (format-time-string "%H:%M ⁃ ")
                           (powerline-time)
                           (line-count-line)))
                         0 0)))))
