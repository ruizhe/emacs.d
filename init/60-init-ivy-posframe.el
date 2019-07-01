(use-package ivy-posframe
  :ensure t
  :config (progn
	    (defun posframe-poshandler-frame-top-center (info)
	      "Posframe's position handler.
Get a position which let posframe stay onto its
parent-frame's top center.  The structure of INFO can
be found in docstring of `posframe-show'."
	      (cons (/ (- (plist-get info :parent-frame-width)
			  (plist-get info :posframe-width))
		       2)
		    0))

	    (defun ivy-posframe-display-at-frame-top-center (str)
	      (ivy-posframe--display str #'posframe-poshandler-frame-top-center))

	    (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
	    (ivy-posframe-mode 1)
	    ))
