(use-package cc-mode
  :ensure nil
  :config 

  (require 'subr-x)

  (defun zz/path-to-list (path)
    (defun path-to-list (p)
      (let* ((pp (directory-file-name (file-name-directory p))))
	(if (or (string= pp p)
		(string-empty-p pp)
		(not pp))
	    (list p)
	  (cons p (path-to-list pp)))))
    (path-to-list (directory-file-name path)))


  (defun linux-src-tree-root (path)
    (let ((linux-src-root nil))
      (dolist (p (zz/path-to-list path))
	(let ((name (file-name-nondirectory p)))
	  (when (and (file-directory-p p)
		     (or (string-match "linux" name)
			 (string-match "kernel" name))
		     (file-directory-p (concat (file-name-as-directory p) "arch"))
		     (file-directory-p (concat (file-name-as-directory p) "kernel"))
		     (file-directory-p (concat (file-name-as-directory p) "mm"))
		     (file-directory-p (concat (file-name-as-directory p) "net"))
		     (file-directory-p (concat (file-name-as-directory p) "scripts")))
	    (setq linux-src-root p))))
      linux-src-root))

  (setq-default c-indent-tabs-mode t     ; Pressing TAB should cause indentation
		c-indent-level 4         ; A TAB is equivilent to four spaces
		c-argdecl-indent 0       ; Do not indent argument decl's extra
		c-tab-always-indent t
		backward-delete-function nil) ; DO NOT expand tabs when deleting
  (c-add-style "my-c-style" '((c-continued-statement-offset 4))) ; If a statement continues on the next line, indent the continuation by 4
  (defun my-c-mode-hook ()
    (if (linux-src-tree-root (buffer-file-name))
	(c-set-style "linux")
      (progn
	(c-set-style "my-c-style")
	;; brackets should be at same indentation level as the statements they open
	(c-set-offset 'substatement-open '0)
	(c-set-offset 'inline-open '+)
	(c-set-offset 'block-open '+)
	;; all "opens" should be indented by the c-indent-level
	(c-set-offset 'brace-list-open '+)
	;; indent case labels by c-indent-level, too
	(c-set-offset 'case-label '+))
      ))
  (add-hook 'c-mode-hook 'my-c-mode-hook)
  (add-hook 'c-mode-hook 'my-c-mode-hook)
  (add-hook 'c++-mode-hook 'my-c-mode-hook)


  (defun my-move-function-up ()
    "Move current function up."
    (interactive)
    (save-excursion
      (c-mark-function)
      (let ((fun-beg (point))
            (fun-end (mark)))
	(transpose-regions (progn
                             (c-beginning-of-defun 1)
                             (point))
                           (progn
                             (c-end-of-defun 1)
                             (point))
                           fun-beg fun-end))))

  (defun my-move-function-down ()
    "Move current function down."
    (interactive)
    (save-excursion
      (c-mark-function)
      (let ((fun-beg (point))
            (fun-end (mark)))
	(transpose-regions fun-beg fun-end
                           (progn
                             (c-beginning-of-defun -1)
                             (point))
                           (progn
                             (c-end-of-defun 1)
                             (point))))))
  (defun mark-c-scope-beg ()
    "Marks the c-scope (region between {}) enclosing the point. 
   Naive, as will be confused by { } within strings"
    (let 
	((scope-depth 1))
      (while (not (= scope-depth 0))
	(search-backward-regexp "}\\|{")
	(if (string= (char-to-string (char-after)) "}")
	    (setq scope-depth (1+ scope-depth))
	  (setq scope-depth (1- scope-depth)))))
    (point))

  (defun mark-c-scope-end ()
    "Marks the c-scope (region between {}) enclosing the point. 
   Naive, as will be confused by { } within strings"
    (let 
	((scope-depth 1))
      (while (not (= scope-depth 0))
	(search-forward-regexp "}\\|{")
	(if (string= (char-to-string (char-before)) "}")
	    (setq scope-depth (1- scope-depth))
	  (setq scope-depth (1+ scope-depth)))))
    (point))

  (defun kill-c-scope ()
    (interactive)
    (let
	((inital-point (point)))
      (save-excursion 
	(let
	    ((beg (mark-c-scope-beg)))
	  (goto-char inital-point)
	  (let ((end (mark-c-scope-end))))))))
  
  )
