(use-package smartparens
  :ensure t
  :config (progn
	    (require 'smartparens-config)
	    (smartparens-global-mode 1)
	    (defun my-open-block-c-mode (id action context)
	      (when (eq action 'insert)
		(indent-according-to-mode)
		(newline)
		(newline)
		(indent-according-to-mode)
		(previous-line)
		(indent-according-to-mode)))
	    (sp-local-pair 'c-mode "{" nil :post-handlers '(:add my-open-block-c-mode)))
  )

(setq-default sp-escape-quotes-after-insert nil)

