(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages"))

(setq package-enable-at-startup nil)

(defun ensure-package-installed (&rest packages)
    "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
    (mapcar
     (lambda (package)
       (if (package-installed-p package)
	   nil
	 (if (y-or-n-p (format "Package %s is missing. Install it? " package))
	     (package-install package)
	   package)))
     packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

;; Assuming you wish to install "iedit" and "magit"
(ensure-package-installed 'magit
			  'evil)

(require 'evil)
(evil-mode t)

;; w3m 
(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(setq w3m-use-cookies t)

