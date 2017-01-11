(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("9b1087341196d3212021156e75ff6f6fdb47df2a84e99b6aed4b98ef29a4da22" "1b1e54d9e0b607010937d697556cd5ea66ec9c01e555bb7acea776471da59055" "de80b9fdf2a058b2ad00e25786db6403a6b1d6c9b10ba80d192df3631be3741d" "118fd1b1c05de66cf3163d22713ffb2b63bca53f6ce70292f8e7489f6b89cec5" "2142a1424dee4331d9dfad3bbef10721bb4270227d3e3407d13e79a7083403c1" "5bb5ac1b37a959cc8c1d1848706509ce669e52f98cc5a5edacd1c0cb68eaa54c" "458dbedf296561c3a298bba1c7d98b7f4290893bcaccdbf7a208ed47cada1987" "eb665c9da51ce48811d585a3a35c3d94426d53f8f3b2217a2bdcdd0c27e133ea" "eb0a314ac9f75a2bf6ed53563b5d28b563eeba938f8433f6d1db781a47da1366" default)))
 '(eww-header-line-format "")
 '(helm-youtube-key (quote AIzaSyCCIm6WRIQgbbILnXEeJ0TL5uB287bmsw0))
 '(ivy-youtube-key (quote AIzaSyCCIm6WRIQgbbILnXEeJ0TL5uB287bmsw0))
 '(package-selected-packages
   (quote
    (emms-setup emms intero dark-mint-theme bfbuilder brainfuck-mode tree-mode calist emacs-w3m win-switcher win-switch exwm simple-mpc mingus libmpdee dracula-theme helm-youtube evil-mu4e use-package smooth-scrolling powerline markdown-mode magit lua-mode haskell-mode geiser eww-lnum evil-leader counsel company circe cdlatex all-the-icons))))
; '(w3m-search-default-engine "ddg")
; '(w3m-search-engine-alist
;   (quote
;    (("ddg" "http://duckduckgo.com/?q=%s" utf-8)
;     ("yahoo" "http://search.yahoo.com/bin/search?p=%s" nil)
;     ("yahoo-ja" "http://search.yahoo.co.jp/bin/search?p=%s" euc-japan)
;     ("alc" "http://eow.alc.co.jp/%s/UTF-8/" utf-8)
;     ("blog" "http://blogsearch.google.com/blogsearch?q=%s&oe=utf-8&ie=utf-8" utf-8)
;     ("blog-en" "http://blogsearch.google.com/blogsearch?q=%s&hl=en&oe=utf-8&ie=utf-8" utf-8)
;     ("google" "http://www.google.com/search?q=%s&ie=utf-8&oe=utf-8" utf-8)
;     ("google-en" "http://www.google.com/search?q=%s&hl=en&ie=utf-8&oe=utf-8" utf-8)
;     ("google news" "http://news.google.com/news?q=%s&ie=utf-8&oe=utf-8" utf-8)
;     ("google news-en" "http://news.google.com/news?q=%s&hl=en&ie=utf-8&oe=utf-8" nil)
;     ("google groups" "http://groups.google.com/groups?q=%s" nil)
;     ("All the Web" "http://www.alltheweb.com/search?q=%s&web&_sb_lang=en" nil)
;     ("All the Web-ja" "http://www.alltheweb.com/search?q=%s&web&_sb_lang=ja&cs=euc-jp" euc-japan)
;     ("technorati" "http://www.technorati.com/search/%s" utf-8)
;     ("technorati-ja" "http://www.technorati.jp/search/search.html?query=%s&language=ja" utf-8)
;     ("technorati-tag" "http://www.technorati.com/tag/%s" utf-8)
;     ("goo-ja" "http://search.goo.ne.jp/web.jsp?MT=%s" euc-japan)
;     ("excite-ja" "http://www.excite.co.jp/search.gw?target=combined&look=excite_jp&lang=jp&tsug=-1&csug=-1&search=%s" shift_jis)
;     ("altavista" "http://altavista.com/sites/search/web?q=\"%s\"&kl=ja&search=Search" nil)
;     ("rpmfind" "http://rpmfind.net/linux/rpm2html/search.php?query=%s" nil)
;     ("debian-pkg" "http://packages.debian.org/cgi-bin/search_contents.pl?directories=yes&arch=i386&version=unstable&case=insensitive&word=%s" nil)
;     ("debian-bts" "http://bugs.debian.org/cgi-bin/pkgreport.cgi?archive=yes&pkg=%s" nil)
;     ("freebsd-users-jp" "http://home.jp.FreeBSD.org/cgi-bin/namazu.cgi?key=\"%s\"&whence=0&max=50&format=long&sort=score&dbname=FreeBSD-users-jp" euc-japan)
;     ("iij-archie" "http://www.iij.ad.jp/cgi-bin/archieplexform?query=%s&type=Case+Insensitive+Substring+Match&order=host&server=archie1.iij.ad.jp&hits=95&nice=Nice" nil)
;     ("waei" "http://dictionary.goo.ne.jp/search.php?MT=%s&kind=je" euc-japan)
;     ("eiwa" "http://dictionary.goo.ne.jp/search.php?MT=%s&kind=ej" nil)
;     ("kokugo" "http://dictionary.goo.ne.jp/search.php?MT=%s&kind=jn" euc-japan)
;     ("eiei" "http://www.dictionary.com/cgi-bin/dict.pl?term=%s&r=67" nil)
;     ("amazon" "http://www.amazon.com/exec/obidos/search-handle-form/250-7496892-7797857" iso-8859-1 "url=index=blended&field-keywords=%s")
;     ("amazon-ja" "http://www.amazon.co.jp/gp/search?__mk_ja_JP=%%83J%%83%%5E%%83J%%83i&url=search-alias%%3Daps&field-keywords=%s" shift_jis)
;     ("emacswiki" "http://www.emacswiki.org/cgi-bin/wiki?search=%s" nil)
;     ("en.wikipedia" "http://en.wikipedia.org/wiki/Special:Search?search=%s" nil)
;     ("de.wikipedia" "http://de.wikipedia.org/wiki/Spezial:Search?search=%s" utf-8)
;     ("ja.wikipedia" "http://ja.wikipedia.org/wiki/Special:Search?search=%s" utf-8)
;     ("msdn" "http://search.msdn.microsoft.com/search/default.aspx?query=%s" nil)
;     ("freshmeat" "http://freshmeat.net/search/?q=%s&section=projects" nil)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eww-form-text ((t (:foreground "blue2" :underline t))))
 '(message-header-name ((t (:foreground "dodger blue"))))
 '(mingus-song-file-face ((t (:foreground "lightgreen" :weight normal))))
 '(w3m-bold ((t (:underline t :weight normal)))))
