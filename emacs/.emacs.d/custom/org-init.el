(defun my-org-config ()
  (setq org-log-done 'time)
  (setq org-agenda-files (list "~/var/org/notes.org"))
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
  (add-hook 'org-mode-hook 'turn-on-flyspell)
  (setq org-directory "~/var/org")
  (setq org-hide-emphasis-markers t)
  (setq org-pretty-entities t)
  (setq org-default-notes-file "~/var/org/notes.org")
  (global-set-key (kbd "C-c n")
                  (lambda () (interactive) (find-file "~/var/org/notes.org"))))

(use-package org
  :ensure t
  :config
  (my-org-config))
