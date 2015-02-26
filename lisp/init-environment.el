;;; init-package.el --- package setting and prepare package
;;
;;; Commentary:
;;
;;; Code:

;;--------------------------------------------------------------
;; initialization setting
;;--------------------------------------------------------------

(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)


;;--------------------------------------------------------------
;; frames setting
;;--------------------------------------------------------------

(set-scroll-bar-mode nil)
(menu-bar-mode -1)
(tool-bar-mode -1)

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;;--------------------------------------------------------------
;; menu setting
;;--------------------------------------------------------------

(setq use-dialog-box nil)
(setq use-file-dialog nil)

;;--------------------------------------------------------------
;; indicate empty lines at left
;;--------------------------------------------------------------

(setq-default indicate-empty-lines t)


(provide 'init-environment)
;;; init-environment.el ends here
