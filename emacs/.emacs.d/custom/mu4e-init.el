(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
;;(require 'mu4e)

(defun my-mu4e-config ()
  (setq mu4e-maildir "~/var/mail/jbl")
  (setq mu4e-sent-folder "/Sent")
  (setq mu4e-drafts-folder "/Drafts")
  (setq mu4e-inbox-folder "/Inbox")
  (setq mu4e-trash-folder "/Trash")
  (setq mu4e-user-mail-address-list '("jbloomfield@live.com"))
  (setq mu4e-get-mail-command "offlineimap"
        mu4e-update-interval 300)
  (setq mu4e-reply-to-adress "jbloomfield@live.com"
        user-mail-address "jbloomfield@live.com"
        user-full-name "Justin Bloomfield")
  (setq mu4e-use-fancy-chars t)
  (setq mu4e-sent-messages-behavior 'delete)
  (setq mu4e-view-show-images t)
  (when (fboundp 'imagemagick-register-types)
    (imagemagick-register-types))

  ;; smtp
  (setq message-send-mail-function 'message-send-mail-with-sendmail
        sendmail-program "/usr/bin/msmtp")
  (setq message-kill-buffer-on-exit t)
  (setq mu4e-headers-fields
        '( (:human-date . 25)
           (:flags . 6)
           (:from . 22)
           (:subject . nil)))
  (setq mu4e-headers-date-format "%d/%m/%y")
  (setq mu4e-view-show-adresses t)
  (setq mu4e-html2text-command "w3m -T text/html")
  ;;(setq mu4e-html2text-command 'mu4e-shr2text)
  ;;(setq shr-color-visible-luminance-min 80)
  )

(use-package evil-mu4e
  :ensure t)

(use-package mu4e-contrib)
(use-package mu4e
  :config
  (my-mu4e-config))
