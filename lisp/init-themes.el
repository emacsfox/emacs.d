;;; init-package.el --- package setting and prepare package
;;
;;; Commentary:
;;
;;; Code:

(load-theme 'sanityinc-solarized-dark t)

;;------------------------------------------------------------------------------
;; Toggle between light and dark
;;------------------------------------------------------------------------------

(defun light ()
  "Activate a light color theme."
  (interactive)
  (load-theme 'sanityinc-solarized-light t))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (load-theme 'sanityinc-solarized-dark t))

(provide 'init-themes)
;;; init-themes.el ends here
