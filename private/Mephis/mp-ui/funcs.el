;;; mp-ui/funcs.el --- defines functions for ui

;; Author: Mephis Pheies <mephistommm@gmail.com>
;; Keywords: ui functions spacemacs elisp

;;; Commentary:

;; description

;;; Code:

(defun mp-ui/better-default ()
  "Provide better default for UI"
  ;; start line number
  (spacemacs/toggle-line-numbers-on)
  ;; start golden ratio
  (spacemacs/toggle-golden-ratio-on)

  ;; Spaceline
  (use-package self-spaceline-config
    :config
    (spaceline-self-theme)
    (setq powerline-default-separator 'wave)
    (setq ns-use-srgb-colorspace nil)
    (spaceline-compile);; this bug will be fixed
    )

  ;; Parens
  (electric-pair-mode t)
  (show-paren-mode t)

  ;; Tab
  (setq tab-always-indent nil)

  ;; Tern modeline
  (diminish 'tern-mode "\u24e3")
  )

;;; mp-ui/funcs.el ends here
