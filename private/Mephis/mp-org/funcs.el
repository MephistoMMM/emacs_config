;;; mp-org/funcs.el --- provide functions for mp-org

;; Author: Mephis Pheies <mephistommm@gmail.com>
;; Keywords: keywords

;;; Commentary:

;; mp-org/create-mrg-buffer provide the fundament for mrg:
;; - create markdown buffer
;; - change current buffer directory

;;; Code:

(defun mp-org/create-mrg-buffer ()
  "Create a new buffer then init by mrg."
  (interactive)
  (let ((ξbuf (generate-new-buffer "mrg buffer")))
    (switch-to-buffer ξbuf))
    (markdown-mode)
    (setq default-directory mrg-directory-path)
  )

;;; mp-org/funcs.el ends here
