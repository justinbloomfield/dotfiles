(defun my-circe-config ()
  "Configure circe IRC client"
  (require 'tls)

  (setq circe-network-options
	`(("fn"
	   :host "irc.freenode.net"
	   :port 6667
	   :nick "piecesofquiet"
	   :channels ("#crux")
	   :nickserv-identify-challenge "\C-b/msg\\s-NickServ\\s-identify\\s-<password>\C-b"
	   :nickserv-identify-command "PRIVMSG NickServ :IDENTIFY {nick} {password}"
	   :nickserv-identify-confirmation "^You are now identified for.*\\.$" 
	   :nickserv-password ,irc-pass)
	  ("nx"
	   :host "irc.unix.chat"
	   :port 6667
	   :nick "poq"
	   :channels ("#unix")
	   :nickserv-identify-challenge "\C-b/msg\\s-NickServ\\s-identify\\s-<password>\C-b"
	   :nickserv-identify-command "PRIVMSG NickServ :IDENTIFY {nick} {password}"
	   :nickserv-identify-confirmation "^You are now identified for.*\\.$" 
	   :nickserv-password ,irc-pass)
	  ("fb"
	   :host "im.codemonkey.be"
	   :port 6667
	   :nick "piecesofquiet"
	   :nickserv-password ,irc-pass)))
  

  (setq
   lui-time-stamp-position 'right-margin
   lui-fill-type nil)

  (setq circe-use-tls t)
  
  (add-hook 'lui-mode-hook 'my-lui-setup)
  (defun my-lui-setup ()
    (setq
     fringes-outside-margins t
     right-margin-width 9
     word-wrap t
     wrap-prefix "    "))
 )

(use-package circe
  :ensure t
  :config
  (my-circe-config))
  	
