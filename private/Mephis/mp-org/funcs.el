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

(defun mp-org/better-default ()
  "Better default for mp-org, something done in
user-config should be defined in this function!"

  ;; mrg layout
  ;; https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Bwindow-management/spacemacs-layouts
  (when (fboundp 'spacemacs|define-custom-layout)
    (spacemacs|define-custom-layout "mrg layout"
      :binding "m"
      :body
      (find-file (concat mrg-directory-path "/index.md")))
    )
  )

;;; mp-org/funcs.el ends here
