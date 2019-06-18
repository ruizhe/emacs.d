(use-package projectile
  :ensure t
  :config (progn
	    (projectile-global-mode t)
	    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
	    (setq projectile-indexing-method 'alien)
	    (setq projectile-completion-system 'ivy)
	    (setq projectile-svn-command "svn list -R . | grep -v '$/' | tr '\\n\\r' '\\0\\0'")))
