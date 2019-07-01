(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-x b" . counsel-switch-buffer)
	 ("C-x C-b" . counsel-ibuffer))
  :config (setq ivy-on-del-error-function 'ignore))

(defun ivy-display-function-window (text)
  (let ((buffer (get-buffer-create "*ivy-candidate-window*"))
        (str (with-current-buffer (get-buffer-create " *Minibuf-1*")
               (let ((point (point))
                     (string (concat (buffer-string) "  " text)))
                 (ivy-add-face-text-property
                  (- point 1) point 'ivy-cursor string t)
                 string))))
    (with-current-buffer buffer
      (let ((inhibit-read-only t))
        (erase-buffer)
        (insert str)))
    (with-ivy-window
      (display-buffer
       buffer
       `((display-buffer-reuse-window
          display-buffer-below-selected)
         (window-height . ,(1+ (ivy--height (ivy-state-caller ivy-last)))))))))

(use-package lv
  :ensure t)

(defun ivy-display-function-lv (text)
  (let ((lv-force-update t))
    (lv-message
     (if (string-match "\\`\n" text)
         (substring text 1)
       text))))

(setq ivy-display-functions-alist
      '((counsel-M-x . ivy-display-function-lv)
        (ivy-completion-in-region . ivy-display-function-window)))
