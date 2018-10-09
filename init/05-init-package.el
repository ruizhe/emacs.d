
(require 'package)
(setq package-archives
      '(("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")
	("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
	("melpa-stalbe-cn" . "http://elpa.emacs-china.org/melpa-stable/")
	("marmalade-cn" . "http://elpa.emacs-china.org/marmalade/")
	("org-cn" . "http://elpa.emacs-china.org/org/")
	("sunrise-cn" . "http://elpa.emacs-china.org/sunrise-commander/")
	("user42" . "http://elpa.emacs-china.org/user42/")))
(package-initialize)


(defun zz/package-install (pkg)
  (when (or (not package-archive-contents)
	    (not (assoc pkg package-archive-contents)))
    (package-refresh-contents))
  (unless (package-installed-p pkg)
    (package-install pkg)))
  
(defun package-require (pkg)
  (if (package-installed-p pkg)
      (zz/package-install pkg)
    (require pkg)))

(dolist (pkg package-selected-packages)
  (zz/package-install pkg))

