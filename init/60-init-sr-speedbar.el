

(defun sr-speedbar-hook ()
  (let ()
    (buffer-face-set 'speedbar-face)
    (linum-mode nil)))

(use-package sr-speedbar
  :ensure t
  :bind (([f4] . sr-speedbar-toggle))
  :hook (speedbar-mode . sr-speedbar-hook)
  
  :custom
  (sr-speedbar-use-images nil)
  :config

(sr-speedbar-open)
(with-current-buffer sr-speedbar-buffer-name
  (setq window-size-fixed 'width))
(sr-speedbar-close)
(sr-speedbar-refresh-turn-off)
(add-hook 'speedbar-before-popup-hook (lambda () (linum-mode -1)))

(defadvice delete-other-windows (after
				 my-sr-speedbar-delete-other-window-advice
				 activate)
  "Check whether we are in speedbar, if it is, jump to next window."
  (let ()
    (when (and (sr-speedbar-window-exist-p sr-speedbar-window)
	       (eq sr-speedbar-window (selected-window)))
      (other-window 1)
      )))
(ad-enable-advice 'delete-other-windows 'after 'my-sr-speedbar-delete-other-window-advice)
(ad-activate 'delete-other-windows))

