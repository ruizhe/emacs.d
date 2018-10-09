
;; chinese font
(defun zhe-font-existsp (font)
  (if (null (x-list-fonts font))
      nil
    t))

(defun zhe-make-font-string (font-name font-size)
  (if (and (stringp font-size)
	   (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (fotmat "%s %s" font-name font-size)))

(defun zhe-set-font (english-fonts
		     english-font-size
		     chinese-fonts
		     &optional chinese-font-size)
  "englist-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow englist-font-size."
  (require 'cl) ;; for find if
  (let ((en-font (zhe-make-font-string
		  (find-if #'zhe-font-existsp english-fonts)
		  english-font-size))
	(zh-font (font-spec :family (find-if #'zhe-font-existsp chinese-fonts)
			    :size chinese-font-size)))
    
    ;; Set the default English font
    ;;
    ;; The following 2 methd cannot make the font setting work in new frames.
    ;; (set-default-font "Consolas:pixelsize=18")
    ;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
    ;; We have to use set-face-attribute
    (message "Set English Font to %s" en-font)
    (set-face-attribute 'default nil :font en-font)
    
    ;; Set Chinese font
    ;; Do not use 'unicode charset, it will cause the English font setting invlaid.
    (message "Set Chinese Font to %s" zh-font)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
			charset zh-font))))

(if (display-graphic-p)
    (zhe-set-font '("Consolas" "Monaco" "DejaVu Sans Mono" "Monospace")
		  (if (eq system-type 'windows-nt)
		      ":pixelsize=18"
		    ":pixelsize=14")
		  '("Microsoft Yahei" "文泉驿等宽微米黑" "新宋体" "宋体")))
