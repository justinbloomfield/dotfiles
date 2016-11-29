(put 'dired-find-alternate-file 'disabled nil)
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "/usr/bin/surf")
(setq ring-bell-function 'ignore)
(setq eww-download-directory "~/usr/dl")
(when (eq system-type 'darwin)
  (setenv "PATH" "/usr/local/bin:/Library/TeX/texbin/:$PATH" t))
