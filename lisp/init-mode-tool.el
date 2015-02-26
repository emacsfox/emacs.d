(require 'company)
(setq company-minimum-prefix-length 2)
(setq company-idle-delay 0.1)
(setq company-selection-wrap-around t)

(require 'flycheck)


(defun my-emacs-lisp-mode-hook ()
  (company-mode 1)
  (flycheck-mode 1))

(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-hook)

(provide 'init-mode-tool)
