(defun my-org-config ()
  (setq org-log-done 'time)
  (setq org-agenda-files (list "~/var/org/school.org"
                               "~/var/org/home.org"
                               "~/var/org/adulting.org"))
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
  ;(setq org-format-latex-options '(:scale 2.0))
  )

(use-package org
  :ensure t
  :config
  (my-org-config))
