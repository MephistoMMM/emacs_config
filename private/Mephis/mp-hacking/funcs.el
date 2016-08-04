;;; funcs.el --- Define functions for mp

;; Author: Mephis Pheies <mephistommm@gmail.com>
;; Keywords: spacemacs layer elisp mp-hacking

;;; Commentary:

;;

;;; Code:

(defun mp-hacking/toggle-writeroom-mode ()
  "Line number will affect the work of writeroom, making it fail to centrel text.  So, let us close it first!"
  (interactive)
  (if writeroom-mode
    (progn ; t
      (spacemacs/toggle-writeroom-off)
      (spacemacs/toggle-line-numbers-on))
    (progn ; nil
      (spacemacs/toggle-line-numbers-off)
      (spacemacs/toggle-writeroom-on)))
  )

(defun mp-hacking/better-default ()
  "This function set many default config to more better!
Some configurations should be written at here which be unable to config
in 'with-eval-after-load."
  ;; Python
  (setq python-shell-interpreter "python3")
  )

(defun mp-hacking/hide-js2-checks-if-flycheck-active ()
  "This function hide the result of js2-mode checking when there is a checker for flycheck."
  (message "fuck")
  (if (flycheck-get-checker-for-buffer)
    ;;t
    (js2-mode-hide-warnings-and-errors)
    ;;nil
    (js2-mode-display-warnings-and-errors)))

;;; funcs.el ends here
