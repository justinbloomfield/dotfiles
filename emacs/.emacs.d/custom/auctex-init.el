(defun my-auctex-config ()
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (add-hook 'LaTeX-mode-hook 'visual-line-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (when (eq system-type 'gnu/linux)
    (eval-after-load 'tex
        '(add-to-list 'TeX-view-program-list
                    '("zathura" ("zathura" (mode-io-correlate " -P %(outpage)") " %o"))))
    (eval-after-load 'tex
        '(add-to-list 'TeX-view-program-selection
                    '(output-pdf "zathura"))) (setq reftex-plug-into-AUCTeX t)
                    )
  )

(use-package tex
  :defer t
  :ensure auctex
  :config
  (my-auctex-config))
