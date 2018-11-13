(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode)
  :init
  :custom-face
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.

  ;; (rainbow-delimiters-depth-1-face ((t (:foreground "red"))))
  ;; (rainbow-delimiters-depth-2-face ((t (:foreground "green"))))
  ;; (rainbow-delimiters-depth-3-face ((t (:foreground "yellow"))))
  ;; (rainbow-delimiters-depth-4-face ((t (:foreground "blue"))))
  ;; (rainbow-delimiters-depth-5-face ((t (:foreground "red"))))
  ;; (rainbow-delimiters-depth-6-face ((t (:foreground "green"))))
  ;; (rainbow-delimiters-depth-7-face ((t (:foreground "yellow"))))
  ;; (rainbow-delimiters-depth-8-face ((t (:foreground "blue"))))
  ;; (rainbow-delimiters-depth-9-face ((t (:foreground "red"))))
  (rainbow-delimiters-unmatched-face ((t (:background "cyan"))))
  ;; :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
)

;; rainbow-delimiters-mode setup, with decreasing bracket size
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.

;;  '(rainbow-delimiters-depth-1-face ((t (:foreground "red" :height 2.0))))
;;  '(rainbow-delimiters-depth-2-face ((t (:foreground "orange" :height 1.8))))
;;  '(rainbow-delimiters-depth-3-face ((t (:foreground "yellow" :height 1.6))))
;;  '(rainbow-delimiters-depth-4-face ((t (:foreground "green" :height 1.4))))
;;  '(rainbow-delimiters-depth-5-face ((t (:foreground "blue" :height 1.2))))
;;  '(rainbow-delimiters-depth-6-face ((t (:foreground "violet" :height 1.1))))
;;  '(rainbow-delimiters-depth-7-face ((t (:foreground "purple" :height 1.0))))
;;  '(rainbow-delimiters-depth-8-face ((t (:foreground "black" :height 0.9))))
;;  '(rainbow-delimiters-unmatched-face ((t (:background "cyan" :height 0.8))))

;;  )
