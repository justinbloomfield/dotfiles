(defun my-org-config ()
  (setq org-log-done 'time)
  (setq org-agenda-files (list "~/var/org/school.org"
                               "~/var/org/home.org"
                               "~/var/org/adulting.org"))
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
  (setq org-directory "~/var/org")
  (setq org-mobile-directory "~/var/org/mblo")
  (setq org-mobile-inbox-for-pull "~/var/org/mblo/mbpll")
  (setq org-hide-emphasis-markers t)
  (setq org-pretty-entities t)
  (setq org-default-notes-file "~/var/org/notes.org")
  )

(use-package org
  :ensure t
  :config
  (my-org-config))
