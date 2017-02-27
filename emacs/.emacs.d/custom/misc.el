(put 'dired-find-alternate-file 'disabled nil)
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")
(setq shr-external-browser 'browse-url-generic)
(setq ring-bell-function 'ignore)
(setq eww-download-directory "~/usr/dl")
(when (eq system-type 'darwin)
  (setenv "PATH" "/usr/local/bin:/Library/TeX/texbin/:$PATH" t))
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

