;;; init-ido.el --- init ido and smex
;;
;;; Commentary:
;;
;;; Code:

(require 'ido)
(ido-mode 1)
(ido-everywhere 1)

(setq ido-auto-merge-delay-time 1.7)
(setq ido-use-virtual-buffers t)


(require 'smex)

(global-set-key [remap execute-extended-command] 'smex)


(provide 'init-ido)
;;; init-ido.el ends here
