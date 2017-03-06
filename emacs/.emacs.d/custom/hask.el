(defun my-haskell-config ()
    (autoload 'ghc-init "ghc" nil t)
    (autoload 'ghc-debug "ghc" nil t)
    (add-hook 'haskell-mode-hook (lambda () (ghc-init)))
    (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
    (let ((my-stack-path (expand-file-name "~/.local/bin")))
      (setenv "PATH" (concat my-stack-path path-separator (getenv "PATH")))
      (add-to-list 'exec-path my-stack-path))
    (add-hook 'haskell-mode-hook 'interomode))
    



(use-package intero
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

(use-package haskell-mode
  :ensure t
  :config
  (my-haskell-config))
