(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)


(use-package all-the-icons
 :ensure t)

(use-package haskell-mode
  :ensure t
  )

(use-package lua-mode
  :ensure t
  :config
   (autoload 'lua-mode "lua-mode" "Lua editing mode." t)
   (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
   (add-to-list 'interpreter-mode-alist '("lua" . lua-mode)))

(use-package magit
  :ensure t)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown")) 

(use-package org
  :ensure t)

(use-package powerline
 :ensure t
 :config
 (powerline-default-theme))

(use-package smooth-scrolling
  :ensure t
  :config
  (setq smooth-scroll-margin 3))

(use-package tramp
  :ensure t)

