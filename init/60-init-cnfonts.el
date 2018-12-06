(use-package cnfonts
  :ensure t
  :config (progn
	    (cnfonts-enable)
	    (cnfonts-set-spacemacs-fallback-fonts)
	    (setq cnfonts-use-system-type t)
	    (setq cnfonts-profiles
		  '("program" "org-mode" "read-book")))
  )
