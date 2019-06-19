(use-package counsel-gtags
  :ensure t
  :hook ((c-mode c++mode asm-mode) . counsel-gtags-mode)
  :bind (:map counsel-gtags-mode-map
	      ("M-r" . counsel-gtags-find-reference)
	      ("M-s" . counsel-gtags-find-symbol)
	      ;; ("M-g M-p" . helm-gtags-parse-file)
	      ;; ("C-c <" . helm-gtags-previous-history)
	      ;; ("C-c >" . helm-gtags-next-history)
	      ("M-." . counsel-gtags-find-definition)
	      ("M-," . counsel-gtags-go-backward)))
