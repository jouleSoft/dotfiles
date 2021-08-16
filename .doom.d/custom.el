;; Vacaciones personalizadas
(setq holiday-other-holidays
      '((holiday-fixed 1 6 "Día de Reyes")))

;; La semana comienza el lunes
(setq calendar-week-start-day 1)

;; Configuración de org-journal
(setq org-journal-dir "diario/"
      org-journal-date-prefix "#+TITLE: "
      org-journal-time-prefix "* "
      org-journal-date-format "%a, %Y-%m-%d"
      org-journal-file-format "%Y%m%d.org")

;; Directorio de inicio al abrir emacs
(setq default-directory "~/MEGA/org")

;; Default file for notes
;; (setq org-default-notes-file (concat org-directory "/notes.org"))

;; Información relativa a org-capture
;; Definir variables:
;;    (defvar +org-capture-todo-file "personal.org")
;;    (defvar +org-capture-notes-file "personal.org")
;;    (defvar +org-capture-journal-file "personal.org")

;; Indentation
(setq-default tab-width 2)
