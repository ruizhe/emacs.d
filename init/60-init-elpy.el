(package-require 'elpy)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-module))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(elpy-enable)
