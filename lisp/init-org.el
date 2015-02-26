;;--------------------------------------------------------------
;; Key Binding
;;--------------------------------------------------------------

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;--------------------------------------------------------------
;; GTD Setting
;;--------------------------------------------------------------

(setq org-refile-use-outline-path 'file)
(setq org-refile-targets (quote ((nil :maxlevel . 3) (org-agenda-files :maxlevel . 3))))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "SOMEDAY(S)" "|" "CANCELLED(c@/!)"))))

;;--------------------------------------------------------------
;; Clock Setting
;;--------------------------------------------------------------

(setq org-clock-persist t)
(setq org-clock-in-resume t)

(setq org-clock-in-switch-to-state "STARTED")
(setq org-clock-into-drawer t)
(setq org-clock-out-remove-zero-time-clocks t)

(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))


(provide 'init-org)
