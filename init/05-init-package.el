
(require 'package)
(package-initialize)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))


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

