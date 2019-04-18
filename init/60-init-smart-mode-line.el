(when window-system
  (use-package smart-mode-line
    :ensure t
    :init (progn
	    (use-package smart-mode-line-powerline-theme
	      :ensure t))

    :config (progn
	      (setq powerline-arrow-shape 'curve
		    powerline-default-separator-dir '(right . left)
		    sml/theme 'powerline
		    sml/mode-width 0
		    sml/name-width 20
		    rich-minority-mode 1
		    )
	      (setf rm-blacklist "")
	      (setq sml/no-confirm-load-theme t)
	      (sml/setup))))
