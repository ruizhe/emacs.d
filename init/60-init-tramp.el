(require 'tramp)

(defconst putty-directory "C:/Users/Administrator/Desktop/lab/bin/putty")

(when (eq window-system 'w32)
  (setq tramp-default-method "plink")
  (setq tramp-default-user "ruizhe")
  (setq tramp-default-host "172.28.14.39")
;;  (setq tram-default-host-alist '(("plink" nil "172.28.14.39")))
  (when (and (not (string-match putty-directory (getenv "PATH")))
	     (file-directory-p putty-directory))
    (setenv "PATH" (concat putty-directory ";" (getenv "PATH")))
    (add-to-list 'exec-path putty-directory)))
