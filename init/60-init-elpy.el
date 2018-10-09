
(defun pyhook ()
  (package-require 'elpy)
 (elpy-enable)
  (elpy-mode)
  (when (require 'flycheck nil t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))
  )

(add-hook 'python-mode-hook 'pyhook)
