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

;; Configuración de org-captura-journal
(setq +org-capture-journal-file "~/Nextcloud/org/personal.org")

;; Directorio de inicio al abrir emacs
(setq default-directory "~/Nextcloud/org/")

;; Información relativa a org-capture
;; Definir variables:
;;   (defvar +org-capture-todo-file "personal.org")
;;   (defvar +org-capture-notes-file "personal.org")
;;   (defvar +org-capture-journal-file "personal.org")

;; Set the default directory when Emacs starts
(setq default-directory "~/Nextcloud/org")

;; Indentation
(setq-default tab-width 2)
