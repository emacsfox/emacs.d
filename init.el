;;; init.el --- emacs setting
;;
;;; Commentary:
;;
;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))


(require 'init-package)
(require 'init-themes)

(require 'init-environment)
(require 'init-files)
(require 'init-ido)

(require 'init-mode-tool)

(require 'init-org)
(require 'init-xml)

;;----------------------------------------------------------------
;; Locale Setting
;;----------------------------------------------------------------

(load (expand-file-name "local.el" user-emacs-directory) t)

;;----------------------------------------------------------------
;; Move custom-file out of init.el
;;----------------------------------------------------------------

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)
;;; init.el ends here
