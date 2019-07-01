(use-package counsel-etags
  :ensure t
  :hook ((prog-mode) . counsel-etags-mode)
  :bind (("M-l" . counsel-etags-list-tag)
	 ("M-," . counsel-etags-find-tag)
	 ("M-." . counsel-etags-find-tag-at-point)
	 ("M-r" . counsel-etags-recent-tag))
  :config (progn
	    (setq tags-revert-without-query t)
	    (setq large-file-warning-threshold nil)
	    (add-hook 'prog-mode-hook
		      (lambda ()
			(add-hook 'after-save-hook
				  'counsel-etags-virtual-update-tags 'append 'local)))))
