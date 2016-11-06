(defun markdown-region-to-latex (start end)
  (interactive "r")
  (goto-char start)
  (save-restriction
    (let (in-list skip-to)
      (narrow-to-region start end)
      (while (re-search-forward "\\*\\|\n\\|\\`" nil t)
	(goto-char (match-beginning 0))
	(if (= (point) (match-end 0))
	    (setq skip-to (1+ (point)))
	  (setq skip-to (match-end 0)))
	(cond ((looking-at "\\*\\*\\b\\([^*]*?\\)\\b\\*\\*")
	       (replace-match "\\\\textbf{\\1}"))
	      ((looking-at "\\*\\b\\([^*]*?\\)\\b\\*")
	       (replace-match "\\\\textit{\\1}"))
	      ((looking-at "^# \\(.*\\)")
	       (replace-match "\\\\section{\\1}"))
	      ((looking-at "^## \\(.*\\)")
	       (replace-match "\\\\subsection{\\1}"))
	      ((looking-at "^### \\(.*\\)")
	       (replace-match "\\\\subsubsection{\\1}"))
	      ((looking-at "^\\* ")
	       (replace-match (if in-list "\\\\item " "\\\\begin{itemize}\n\\\\item "))
	       (setq in-list "itemize"))
	      ((looking-at "^[0-9]+\\. ")
	       (replace-match (if in-list "\\\\item " "\\\\begin{enumerate}\n\\\\item "))
	       (setq in-list "enumerate"))
	      ((and in-list (looking-at "^"))
	       (replace-match (format "\\\\end{%s}\n" in-list))
	       (setq in-list nil))
	      (t (goto-char skip-to)))))))

(defun my-auctex-config ()
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq font-latex-fontify-script 'invisible)
  (setq font-latex-fontify-sectioning 'color)
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
                    '(output-pdf "zathura"))))
  (setq reftex-plug-into-AUCTeX t)
  )
                   

(use-package tex
  :defer t
  :ensure auctex
  :config
  (my-auctex-config))
