;; don't show welcome screen
(setq inhibit-startup-screen 1)

;; set support coding systems
(prefer-coding-system 'gb18030)
(prefer-coding-system 'gbk)
(prefer-coding-system 'gb2312)
(prefer-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8-unix)

;; hide toolbar
(when (display-graphic-p)
  (tool-bar-mode 0))

;; hide menubar when work in console
(unless window-system
  (menu-bar-mode -1))

;; show (line, column) at mode-line
(column-number-mode t)

;; highlight matched parenteses
(show-paren-mode t)

;; highlight current line
(when (display-graphic-p)
  (global-hl-line-mode 1))

(unless window-system
  (menu-bar-mode -1))

  
;; don't create the ##file
(setq auto-save-default nil)

;; don't create the backup files
(setq make-backup-files nil)

;; don't create lockfiles
(setq create-lockfiles nil)

;; don't create the ~file
(setq backup-by-copying nil)

;; virtical line cursor
(setq-default cursor-type 'bar)

;; open recent file in menu or ido etc.
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)


;; open recent file in menu or ido etc.
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

(setq extended-command-suggest-shorter nil)

(global-display-line-numbers-mode t)

