(when (display-graphic-p)
  (add-to-list 'custom-theme-load-path "~/.emacs.d/addons/atom-one-dark-theme")
  (load-theme 'atom-one-dark t))
