;; -*- lexical-binding: t; -*- 
(require 'cl-lib)
(require 'seq)

(defconst zz/init-dir
  (concat (cond ((boundp 'user-emacs-directory) user-emacs-directory)
		(t "~/.emacs.d/"))
	  "init/"))

(defun zz/init-list ()
  (delq
   nil
   (mapcar
    (lambda (file)
      (if (and
	   (string-match "^[0-9]+-init-.+[.]el" (file-name-nondirectory file))
	   (not (file-directory-p file)))
	  file))
    (directory-files zz/init-dir t))))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck-css-colorguard flycheck-pycheckers flycheck py-autopep8 elpy material-theme magit ack xcscope undo-tree tramp-term swoop switch-window swiper-helm sr-speedbar org-projectile-helm ibuffer-projectile highlight-symbol helm-projectile helm-project-persist helm-gtags helm-ag ggtags geiser ag ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (defun zz/package-init-update ()
;;   (mapcar
;;    (lambda (pkg)
;;      (if (not (find-if
;; 	       (string-match (concat "^[0-9]+-init-" pkg "$") pkg)
;; 	       (directory-files zz/init-dir)))
;; 	 (with-current-buffer
;; 	     (find-file-noselect (concat zz/init-dir "65-init-" pkg ".el"))
;; 	   (insert (concat "(package-require '" pkg))
;; 	   (save-buffer)
;; 	   (kill-buffer))))
;;    package-selected-packages))
;; (zz/package-init-update)

(mapcar 'load-file (seq-sort #'string< (zz/init-list)))

