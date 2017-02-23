;;; mp-org/funcs.el --- provide functions for mp-org

;; Author: Mephis Pheies <mephistommm@gmail.com>
;; Keywords: keywords

;;; Commentary:

;; mp-org/create-mrg-buffer provide the fundament for mrg:
;; - create markdown buffer
;; - change current buffer directory

;;; Code:

(defun mp-org/new-org-buffer-in-dropdire ()
  "Create a new buffer then init by mrg."
  (interactive)
  (let ((ξbuf (generate-new-buffer "Dropbox org buffer")))
    (switch-to-buffer ξbuf))
    (org-mode)
    (setq default-directory dropbox-org-directory-path)
  )

(defun mp-org/better-default ()
  "Better default for mp-org, something done in
user-config should be defined in this function!"

  ;; Count Words
  (spacemacs/set-leader-keys "xC" 'count-words)
  ;; Fill Region
  ;; (spacemacs/set-leader-keys "xf" 'fill-region)
  ;; This function is the same as 'gq' in evil(vim)
  )

;;; mp-org/funcs.el ends here
