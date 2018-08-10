
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

(when (not package-archive-contents)
  (package-refresh-contents))

(defun package-require (pkg)
  (unless (package-installed-p pkg)
    (package-install pkg)
    (require pkg)))

(mapcar (lambda (pkg) (package-require pkg)) package-selected-packages)
