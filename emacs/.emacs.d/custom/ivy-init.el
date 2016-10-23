;; ivy/swiper config
(defun my-ivy-config ()
  "Configure ivy"
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (global-set-key (kbd "M-x") 'counsel-M-x))

(use-package swiper
  :ensure t
  :config
  (my-ivy-config))

(use-package counsel
  :ensure t)
