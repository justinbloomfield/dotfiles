(defun my-emms-config ()
    (require 'emms-setup)
    (require 'emms-player-simple)
    (require 'emms-source-playlist)
    (require 'emms-source-file)
    (setq emms-source-file-default-directory "~/var/msc/")


  )

(use-package emms
  :ensure t
  :config
  (my-emms-config))

