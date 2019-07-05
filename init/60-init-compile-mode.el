(setq compilation-window-height 10)

(defun my-compilation-hook ()
  (when (not (get-buffer-window "*compilation*"))
    (save-selected-window
      (save-excursion
        (let* ((w (split-window-vertically))
               (h (window-height w)))
          (select-window w)
          (switch-to-buffer "*compilation*")
          (shrink-window (- h compilation-window-height)))))))

;; (add-hook 'compilation-mode-hook 'my-compilation-hook)


(defun compilation-exit-autoclose (STATUS code msg)
  "Close the compilation window if there was no error at all."
  ;; If M-x compile exit with a 0
  (when (and (eq STATUS 'exit) (zerop code))
    ;; then bury the *compilation* buffer, so that C-x b doesn't go there
    (bury-buffer)
    ;; and delete the *compilation* window
    (delete-window (get-buffer-window (get-buffer "*compilation*"))))
  ;; Always return the anticipated result of compilation-exit-message-function
  (cons msg code))
;; (setq compilation-exit-message-function 'compilation-exit-autoclose)


(defun zz-compile (ARG)
  "Run the same compile sa the last time.

If there is no last time, or there is a prefix argument, this acts like M-x compile."
  (interactive "p")
  (if (and (eq ARG 1)
	   compilation-last-buffer)
      (progn
	(set-buffer compilation-last-buffer)
	(revert-buffer t t))
    (call-interactively 'compile)))

(global-set-key (kbd "<f7>") 'zz-compile)
