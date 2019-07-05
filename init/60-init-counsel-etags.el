(use-package counsel-etags
  :ensure t
  :bind (("C-," . counsel-etags-list-tag)
	 ("C-." . counsel-etags-find-tag)
	 ("M-." . counsel-etags-find-tag-at-point)
	 ("C-M-." . counsel-etags-grep)
	 ("C-M-," . counsel-etags-recent-tag))
  :init (progn
	    (setq tags-revert-without-query t)
	    (setq large-file-warning-threshold nil)
	    (add-hook 'c-mode-hook
		      (lambda ()
			(add-hook 'after-save-hook
				  'counsel-etags-virtual-update-tags 'append 'local)))))
