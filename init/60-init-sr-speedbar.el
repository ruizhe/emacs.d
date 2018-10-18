(package-require 'sr-speedbar)

(global-set-key (kbd "<f4>") 'sr-speedbar-toggle)
(setq speedbar-use-images nil)
(sr-speedbar-open)
(with-current-buffer sr-speedbar-buffer-name
  (setq window-size-fixed 'width))
(sr-speedbar-close)
(sr-speedbar-refresh-turn-off)
(setq speedbar-mode-hook '(lambda () (let ()
				       (buffer-face-set 'speedbar-face)
				       (linum-mode nil))))
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
(ad-activate 'delete-other-windows)
