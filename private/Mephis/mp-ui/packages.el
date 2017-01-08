;;; mp-ui/packages.el --- defines packages for ui

;; Author: Mephis Pheies <mephistommm@gmail.com>
;; Keywords: ui packages spacemacs elisp

;;; Commentary:

;; description

;;; Code:

(defconst mp-ui-packages
  '(
    linum-relative
    golden-ratio
    tern
    ranger)
 )

(defun mp-ui/post-init-tern ()
  "Change the view of Tern in minor-mode-list"
  (add-hook 'tern-mode-hook (lambda () (diminish 'tern-mode "\u24e3")))
  )

;; TODO: it should change golden-ratio-previous-enable to nil while toggle the golden-ratio
(defun mp-ui/post-init-ranger ()
  "Configuations for ranger!"
  (setq ranger-ignored-extensions '("mkv" "iso" "mp4"))
  (setq ranger-max-preview-size 2)
  )

(defun mp-ui/post-init-golden-ratio ()
  "do noting in ranger-mode"
  (with-eval-after-load 'golden-ratio
    (dolist (mode '("ranger-mode"))
      (add-to-list 'golden-ratio-exclude-modes mode)))
  )

;;line number
(defun mp-ui/post-init-linum-relative ()
  "Change line format if not in gui"
  (with-eval-after-load 'linum-relative
    (unless (display-graphic-p)
      (setq linum-relative-format "%3s "))
    )
  )

;;; mp-ui/packages.el ends here
