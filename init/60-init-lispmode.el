
(defun zz/lisp-mode-hook ()
	    (global-set-key (kbd "C-h C-f") 'find-function)
	    (global-set-key (kbd "C-h C-v") 'find-variable)
	    (global-set-key (kbd "C-h C-k") 'find-function-on-key))
(add-hook 'lisp-mode-hook 'zz/lisp-mode-hook)
(add-hook 'emacs-lisp-mode-hook 'zz/lisp-mode-hook)
