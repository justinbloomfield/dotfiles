(defun csc ()
  "Change emacs colourscheme to my very specific stuff"
  (setq colour (read-from-minibuffer "Enter colourscheme: "))
  (setq ml (format "modeline-custom-%s.el" colour))
;  (Setq xr (format "~/.emacs.d/themes/xres-theme-%s.el" colour))
  
  (load ml))
;  (load xr))

(provide 'csc)
