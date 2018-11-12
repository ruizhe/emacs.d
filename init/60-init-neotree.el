(use-package all-the-icons :ensure t)


(use-package neotree
  :ensure t
  :bind (([f8] . neotree-toggle))
  :init (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))
