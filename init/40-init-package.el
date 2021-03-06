(require 'package)
(setq package-enable-at-startup nil)

(defun package--save-selected-packages (&optional VALUE opt)
  nil)

(setq package-archives
      '(("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")
	("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
	("melpa-stalbe-cn" . "http://elpa.emacs-china.org/melpa-stable/")
	("marmalade-cn" . "http://elpa.emacs-china.org/marmalade/")
	("org-cn" . "http://elpa.emacs-china.org/org/")
	("sunrise-cn" . "http://elpa.emacs-china.org/sunrise-commander/")
	("user42" . "http://elpa.emacs-china.org/user42/")))

(package-initialize t) ;; 't' means don't load installed packages automatically
(let ((default-directory (concat (file-name-directory user-emacs-directory)
				 "elpa")))
  (when (file-directory-p default-directory)
    (normal-top-level-add-subdirs-to-load-path)))

(defun zz/package-install (pkg)
  (when (or (not package-archive-contents)
	    (not (assoc pkg package-archive-contents)))
    (message "refresh package contents while package-install '%s'" pkg)
    (package-refresh-contents))
  (unless (package-installed-p pkg)
    (package-install pkg)))
  
(defun package-require (pkg)
  (when (not (package-installed-p pkg))
    (zz/package-install pkg))
  (require pkg))

;; (dolist (pkg package-selected-packages)
;;   (zz/package-install pkg))

