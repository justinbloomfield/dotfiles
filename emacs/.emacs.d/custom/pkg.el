(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(setq package-check-signature nil)
(require 'use-package)

(use-package all-the-icons
 :ensure t)

;;(use-package calist
;;  :ensure t)

;;(use-package cdlatex
;;  :ensure t)

(use-package cl
  :ensure t)

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package csv-mode
  :ensure t)

(use-package ess
  :ensure t)

(use-package eww-lnum
  :ensure t
  :config
  (eval-after-load "eww"
  '(progn (define-key eww-mode-map "f" 'eww-lnum-follow)
          (define-key eww-mode-map "F" 'eww-lnum-universal))))

(use-package geiser
  :ensure t
  :config
  (setq geiser-active-implementations '(chibi))
  (if (eq system-type 'darwin)
      (setq geiser-chibi-binary "/usr/local/Cellar/chibi-scheme/0.7.3/bin/chibi-scheme")))

;; it's out of order and it hurts papa
(use-package intero
  :ensure t)

(use-package haskell-mode
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))


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

;(use-package sauron
;  :ensure t)

(use-package smooth-scrolling
  :ensure t
  :config
  (setq smooth-scroll-margin 3))

(use-package tramp
  :ensure t)

(use-package win-switch
  :ensure t)

(use-package w3m-load
  :config
;;  (require 'mime-w3m)
  (require 'w3m-load))
