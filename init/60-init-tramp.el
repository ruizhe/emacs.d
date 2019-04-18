(use-package tramp
  :ensure t
  :config
(defconst putty-directory "D:/bin/putty")

(when (eq window-system 'w32)
  (setq tramp-default-method "plink")
  (setq tramp-default-user "z08941")
  (setq tramp-default-host "10.114.40.30")
;;  (setq tram-default-host-alist '(("plink" nil "172.28.14.39")))
  (when (and (not (string-match putty-directory (getenv "PATH")))
	     (file-directory-p putty-directory))
    (setenv "PATH" (concat putty-directory ";" (getenv "PATH")))
    (add-to-list 'exec-path putty-directory))))

