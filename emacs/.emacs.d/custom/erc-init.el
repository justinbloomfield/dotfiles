(defun my-erc-config ()
  (require 'tls)
  (setq tls-program '("openssl s_client -connect %h:%p -no_ssl2 -ign_eof -cert /etc/ssl/cert.pem"))
   )


(use-package erc
  :ensure t
  :config
  (my-erc-config))
