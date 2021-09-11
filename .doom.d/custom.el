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

;; Configuración de org-captura-journal
(setq +org-capture-journal-file "~/Nextcloud/org/personal.org")

;; Directorio de inicio al abrir emacs
(setq default-directory "~/Nextcloud/org/")

;; Información relativa a org-capture
;; Definir variables:
;;   (defvar +org-capture-todo-file "personal.org")
;;   (defvar +org-capture-notes-file "personal.org")
;;   (defvar +org-capture-journal-file "personal.org")

;; Indentation
(setq-default tab-width 2)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
