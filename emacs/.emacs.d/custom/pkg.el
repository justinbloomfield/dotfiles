(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(use-package org
  :ensure t)

(use-package magit
  :ensure t)

(use-package powerline
 :ensure t)
; :config
; (powerline-center-evil-theme))

(use-package all-the-icons
 :ensure t)

(use-package smooth-scrolling
  :ensure t
  :config
  (setq smooth-scroll-margin 3))
(use-package tramp )
