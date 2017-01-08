;;; mp-ui/config.el --- provide init variables to mp-ui

;; Author: Mephis Pheies <mephistommm@gmail.com>
;; Keywords: mp-ui configs spacemacs elisp

;;; Commentary:

;; description

;;; Code:

;;timer for automatically changing themes
(setq mp-ui--interval-timer nil)

;;table is used to save (time themes) pair for automatically changing themes
;;time should be a string. themes should be a variant , not symbos.
(setq mp-ui--time-themes-table nil)

;;; mp-ui/config.el ends here
