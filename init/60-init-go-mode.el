(use-package go-autocomplete
  :ensure t)

(use-package go-eldoc
  :ensure t)

(use-package golint
  :ensure t)

(use-package go-mode
  :ensure t
  :config (progn
	    (defun go-mode-setup()
	      (go-eldoc-setup)
	      (setq gofmt-command 'goimports)
	      (add-hook 'before-save-hook 'gofmt-before-save)
	      (local-set-key (kbd "M-.") 'godef-jump)
	      (setq compile-command "echo Building... && go build -v && echo Testing... && go test -v && echo Vetting... && go vet && echo Linting... && golint")
	      (define-key (current-local-map) (kbd "C-c C-c") 'compile)
	      (setq gofmt-command "goimports")
	      
	      )
	    (add-hook 'go-mode-hook 'go-mode-setup)
	    )
  )
