(use-package projectile
  :ensure t
  :config (progn
	    (projectile-global-mode t)
	    (setq projectile-indexing-method 'alien)
	    (setq projectile-svn-command "svn list -R . | grep -v '$/' | tr '\\n\\r' '\\0\\0'")))
