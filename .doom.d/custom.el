;; Custom holydays
(setq holiday-other-holidays
      '((holiday-fixed 1 6 "Día de Reyes")))

;; Monday as first of the week
(setq calendar-week-start-day 1)

;; org-journal configuration
;; open: <space> n j j
(setq org-journal-dir "diario/"
      org-journal-date-prefix "#+TITLE: "
      org-journal-time-prefix "* "
      org-journal-date-format "%a, %Y-%m-%d"
      org-journal-file-format "%Y%m%d.org")

;; Set the default directory when Emacs starts
(setq default-directory "~/org")

;; Indentation
(setq-default tab-width 2)
