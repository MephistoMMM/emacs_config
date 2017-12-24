;;; mp-ui/funcs.el --- defines functions for ui

;; Author: Mephis Pheies <mephistommm@gmail.com>
;; Keywords: ui functions spacemacs elisp

;;; Commentary:

;; description

;;; Code:

;;;; Better-Default

(defun mp-ui/better-default ()
  "Provide better default for UI"
  ;; start line number
  (spacemacs/toggle-line-numbers-on)
  ;; start golden ratio
  ;; (spacemacs/toggle-golden-ratio-on)

  ;; Spaceline
  (use-package self-spaceline-config
    :config
    (spaceline-self-theme)
    (setq powerline-default-separator 'wave)
    (setq ns-use-srgb-colorspace nil)
    )

  ;; Parens
  (electric-pair-mode t)
  (show-paren-mode t)

  ;; Tab
  (setq tab-always-indent nil)

  ;; Theme
  ;; (mp-ui/config-time-themes-table '(("6" . spacemacs-light) ("17" . monokai)))
  ;; (mp-ui/open-themes-auto-change)
)

;;;; Themes automatically change

(defun mp-ui/config-time-themes-table (tt)
  "Set time . themes table for time-themes-table.
time-themes-table item: ( hours-in-string . theme-name)"
  (setq mp-ui--time-themes-table
      ;; sort firstly, get-themes-according require a sorted table.
      (sort tt (lambda (x y) (< (string-to-int (car x)) (string-to-int (car y)))))
        )
  )

(defun mp-ui/get-themes-according (hour-string)
  "This function return the theme according to hour-string.
Value of hour-string should be between 1 and 24(including)."
  (catch 'break
    (let (
          (now-time (string-to-int hour-string))
          ;; init current-themes to the themes of final item
          (correct-themes (cdr (car (last mp-ui--time-themes-table))))
          (loop-list mp-ui--time-themes-table)
          )

        ;; loop to set correct themes to correct-themes
        (while loop-list
          (let ((v (car loop-list)))
            (let ((v-time (string-to-int (car v))) (v-themes (cdr v)))
              (if (< now-time v-time)
                (throw 'break correct-themes)  ; t
                (setq correct-themes v-themes) ; nil
                )))
          (setq loop-list (cdr loop-list))
        )
        ;; This is returned for value of hour-string is bigger than or equal to car of final item
        (throw 'break correct-themes) ; t
    ))
)

(defun mp-ui/check-time-and-modify-theme ()
  "This function will get the theme of now according to time-table-themes,
then check whether emacs should to modify theme, if so, modify it."
  (let ((new-theme (mp-ui/get-themes-according (format-time-string "%H"))))
    (unless (eq new-theme spacemacs--cur-theme)
      (spacemacs/load-theme new-theme)
    ))
  )

(defun mp-ui/open-themes-auto-change ()
  "Start to automatically change themes."
  (interactive)
  (mp-ui/check-time-and-modify-theme)
  (setq
   mp-ui--interval-timer (run-at-time 3600 3600 'mp-ui/check-time-and-modify-theme))
  (message "themes auto change open.")
  )

(defun mp-ui/close-themes-auto-change ()
  "Close automatically change themes."
  (interactive)
  (cancel-timer mp-ui--interval-timer)
  (message "themes auto change close.")
  )

;;; mp-ui/funcs.el ends here
