(defun my-exwm-config()
  "Configure EXWM"
  (require 'exwm-config)
  (setq exwm-workspace-number 10)
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
    (exwm-input-set-key (kbd "s-h") 'win-switch-left)
    (exwm-input-set-key (kbd "s-j") 'win-switch-down)
    (exwm-input-set-key (kbd "s-k") 'win-switch-up)
    (exwm-input-set-key (kbd "s-l") 'win-switch-right)
    (exwm-input-set-key (kbd "s-v") 'evil-window-vsplit)
    (exwm-input-set-key (kbd "s-n") 'evil-window-split)
    (exwm-input-set-key (kbd "s-C") 'kill-buffer)

    (dotimes (i 10)
      (exwm-input-set-key (kbd (format "s-%d" i))
                        `(lambda ()
                            (interactive)
                            (exwm-workspace-switch-create ,i))))
    (exwm-input-set-key (kbd "s-d")
                        (lambda (command)
                          (interactive (list (read-shell-command "$ ")))
                          (start-process-shell-command command nil command)))
    )


(use-package exwm
  :ensure t
  :config
  (my-exwm-config)
  (exwm-enable))

