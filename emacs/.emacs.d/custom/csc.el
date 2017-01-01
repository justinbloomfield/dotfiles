(defun csc ()
  "Change emacs colourscheme to my very specific stuff"
  (setq colour (getenv "CSC"))
  (setq ml (format "modeline-custom-%s.el" colour))
  (setq xr (format "~/.emacs.d/themes/xres-%s-theme.el" colour))
  ;; Need to have this so that it changes .Xresources, reloads, then loads theme
  (load ml)
  (load xr))

;; Set this up so that it lists the available options, then use ivy so we have completion i guess

;; set it up so that it restarts emacs when called, which lets the theme change and all that shit

(defun csc-force ()
  "Change colours and restart Emacs"
  (setq coloursl '("red" "blue" "green"))
  (setq colour (ivy-read "Enter colourscheme: " coloursl))
  (setq ml (format "modeline-custom-%s.el" colour))
  (setq xr (format "~/.emacs.d/themes/xres-%s-theme.el" colour))
  (shell-command "sed -i 1d ~/.Xresources")
  (shell-command (format "sed -i \'1i #include \"/home/poq/.config/x/colours/vamp_%s\"' ~/.Xresources" colour))
  (shell-command "xrdb ~/.Xresources")
  (shell-command (format "export CSC=%s" colour))
  ;(setenv "CSC" (format "%s" colour))
  (exwm-restart))

(provide 'csc)
(provide 'csc-force)
