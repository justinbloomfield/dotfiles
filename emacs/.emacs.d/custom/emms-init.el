(defun my-emms-config ()
  (require 'emms-browser)
  (require 'emms-info-libtag)
  (require 'emms-setup)
  (require 'emms-player-simple)
  (require 'emms-source-playlist)
  (require 'emms-source-file)
  (require 'emms-player-mpd)
  (require 'cl)
  (emms-all)
  (emms-default-players)
  (setq emms-source-file-default-directory "/mnt/msc/Music/")
  (setq emms-info-functions '(emms-info-libtag))
  (define-emms-simple-player flao '(file) "\\.flac$" "flac")
  (add-to-list 'emms-player-list 'emms-player-flao)
  (define-emms-simple-player mpv '(file) "\\.mkv$" "mpv")
  (add-to-list 'emms-player-list 'emms-player-mpv)

  (defun emms-notifications-message (track-name)
    "Share track name via Emacs minibuffer."
    (message "EMMS is now playing: %s" track-name))
  
  (setq emms-player-next-function 'emms-notify-and-next)
  
  (defun emms-notify-and-next ()
    "Send a notification of track and start next."
    (emms-next-noerror)
    (let ((track-name (emms-track-description (emms-playlist-current-selected-track)))))
    (emms-notifications-message track-name))

  ;; mpd
  (setq emms-player-mpd-server-name "localhost")
  (setq emms-player-mpd-server-port "6600")
  (add-to-list 'emms-info-functions 'emms-info-mpd)
  (add-to-list 'emms-player-list 'emms-player-mpd)
  (setq emms-player-mpd-music-directory "/mnt/msc/Music/")
  (eval-after-load 'emms
    '(progn
       (evil-set-initial-state 'emms-playlist-mode 'normal)
       (evil-define-key 'normal emms-playlist-mode-map
         (kbd "t") 'next-line
         (kbd "n") 'previous-line
         (kbd "d") 'emms-playlist-mode-kill-track
         (kbd "D") 'emms-playlist-mode-clear
         (kbd "e") 'emms-tag-editor-edit
         (kbd "s") 'emms-next
         (kbd "h") 'emss-prev
         (kbd "<") 'emms-seek-backward
         (kbd ">") 'emms-seek-forward
         (kbd "p") 'emms-pause
         (kbd "a") 'emms-add-directory
         (kbd "A") 'emms-add-directory-tree
         (kbd "RET") 'emms-playlist-mode-play-smart
         ))))
  (emms-player-mpd-connect)
  )

(use-package emms
  :config
  (my-emms-config))

