;;; init-package.el --- package setting and prepare package
;;
;;; Commentary:
;;
;;; Code:


(require 'package)

;;--------------------------------------------------------------
;; package setting
;;--------------------------------------------------------------

;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(setq package-enable-at-startup nil)
(package-initialize)

(defun prepare-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (unless (package-installed-p package min-version)
    (unless (and (assoc package package-archive-contents) no-refresh)
      (package-refresh-contents))
    (package-install package)))

;;--------------------------------------------------------------
;; el-get setting
;;--------------------------------------------------------------

(add-to-list 'load-path (expand-file-name "el-get/el-get" user-emacs-directory))

(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;;--------------------------------------------------------------
;; other site-lisp setting
;;--------------------------------------------------------------

(defun add-subdirs-to-load-path (parent-dir)
  "Add every non-hidden subdir of PARENT-DIR to `load-path'."
  (mapc #'(lambda (arg)
	    (when (file-directory-p arg)
	      (add-to-list 'load-path arg)))
	(directory-files (expand-file-name parent-dir) t "^[^\\.]")))

(add-subdirs-to-load-path (expand-file-name "site-lisp/" user-emacs-directory))

(defun site-lisp-dir-for (name)
  "Path of NAME dir in site-lisp directory."
  (expand-file-name (format "site-lisp/%s" name) user-emacs-directory))

(defun site-lisp-library-el-path (name)
  "Path of el NAME in site-lisp directory."
  (expand-file-name (format "%s.el" name) (site-lisp-dir-for name)))

(defun site-lisp-library-loadable-p (name)
  "Return whether or not the library NAME can be loaded from a source file under site-lisp/name."
  (let ((path (locate-library (symbol-name name))))
    (and path (string-prefix-p (file-name-as-directory (site-lisp-dir-for name)) path))))

(defun download-site-lisp-module (name url)
  "Download library NAME from URL."
  (let ((dir (site-lisp-dir-for name)))
    (message "Downloading %s from %s" name url)
    (unless (file-directory-p dir)
      (make-directory dir t))
    (add-to-list 'load-path dir)
    (let ((el-file (site-lisp-library-el-path name)))
      (url-copy-file url el-file t nil)
      el-file)))

(defun install-lib-from-url (name url)
  "Install NAME from URL, it will do nothing if it is exsit."
  (interactive
   (list
    (intern (read-from-minibuffer "Library name: "))
    (read-from-minibuffer "Download from: ")))
  (unless (site-lisp-library-loadable-p name)
    (byte-compile-file (download-site-lisp-module name url))))

;;--------------------------------------------------------------
;; prepare package
;;--------------------------------------------------------------

(prepare-package 'color-theme-sanityinc-solarized)

(prepare-package 'company)
(prepare-package 'flycheck)
(prepare-package 'smex)

(el-get 'sync '(el-get))

(install-lib-from-url 'dom "http://www.emacswiki.org/emacs/download/dom.el")



(provide 'init-package)
;;; init-package.el ends here
