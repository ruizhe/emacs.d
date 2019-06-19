
;; (use-package helm-gtags
;;   :ensure t
;;   :defer t
;;   :hook ((c-mode c++mode asm-mode) . helm-gtags-mode)
;;   :custom 
;;   (helm-gtags-path-style 'relative)
;;   (helm-gtags-ignore-case t)
;;   (helm-gtags-auto-update t)
;;   :bind (:map helm-gtags-mode-map
;; 	      ("M-r" . helm-gtags-find-rtag)
;; 	      ("M-s" . helm-gtags-find-symbol)
;; 	      ("M-g M-p" . helm-gtags-parse-file)
;; 	      ("C-c <" . helm-gtags-previous-history)
;; 	      ("C-c >" . helm-gtags-next-history)
;; 	      ("M-." . helm-gtags-find-tag)
;; 	      ("M-," . helm-gtags-pop-stack)))
  
