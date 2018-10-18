;; -*- lexical-binding: t; -*- 

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'cl-lib)
(require 'seq)

(defconst zz/init-dir
  (concat (cond ((boundp 'user-emacs-directory) user-emacs-directory)
		(t "~/.emacs.d/"))
	  "init/"))

(defun zz/init-list ()
  (delq
   nil
   (mapcar
    (lambda (file)
      (if (and
	   (string-match "^[0-9]+-init-.+[.]el" (file-name-nondirectory file))
	   (not (file-directory-p file)))
	  file))
    (directory-files zz/init-dir t))))

(mapcar 'load-file (seq-sort #'string< (zz/init-list)))

