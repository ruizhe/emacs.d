(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x b" . helm-buffers-list))
  :bind (:map helm-map
	      ("<tab>" . 'helm-execute-persistent-action)
	      ("C-i" . 'helm-execute-persistent-action)
	      ("C-z" . 'helm-select-action))
  :init (setq helm-M-x-fuzzy-match t
	      helm-mode-fuzzy-match t
	      helm-buffers-fuzzy-matching t
	      helm-recentf-fuzzy-match t
	      helm-locate-fuzzy-match t
	      helm-semantic-fuzzy-match t
	      helm-imenu-fuzzy-match t
	      helm-completion-in-region-fuzzy-match t
	      helm-candidate-number-list 150
	      helm-split-window-in-side-p t
	      helm-move-to-line-cycle-in-source t
	      helm-echo-input-in-header-line t
	      helm-autoresize-max-height 0
	      helm-autoresize-min-height 20)
  :config (progn
	    (require 'helm-config)
	    (helm-mode t))
  )
