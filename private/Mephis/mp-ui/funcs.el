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
)

(defun open_golden_ratio_first ()
  "open golden-ratio before calling other"
  (when (and golden-ratio-previous-enable (not golden-ratio-mode))
    (golden-ratio-mode 1)))

(defun mp-ui/ranger ()
  (interactive)
  (if golden-ratio-mode
    (progn
      (golden-ratio-mode -1)
      (ranger)
      (setq golden-ratio-previous-enable t))
    (progn
      (ranger)
      (setq golden-ratio-previous-enable nil))))

(defun mp-ui/quit-ranger ()
  (interactive)
  (if golden-ratio-previous-enable
    (progn
      (ranger-close)
      (golden-ratio-mode 1))
    (ranger-close)))

(defun mp-ui/evil-window-right (count)
  :repeat nil
  (interactive "p")
  (open_golden_ratio_first)
  (dotimes (i (or count 1))
    (windmove-right))
  (run-at-time 0.1 nil (lambda () (golden-ratio))))
(defun mp-ui/evil-window-left (count)
  :repeat nil
  (interactive "p")
  (open_golden_ratio_first)
  (dotimes (i (or count 1))
    (windmove-left))
  (run-at-time 0.1 nil (lambda () (golden-ratio))))
(defun mp-ui/evil-window-down (count)
  :repeat nil
  (interactive "p")
  (open_golden_ratio_first)
  (dotimes (i (or count 1))
    (windmove-down))
  (run-at-time 0.1 nil (lambda () (golden-ratio))))
(defun mp-ui/evil-window-up (count)
  :repeat nil
  (interactive "p")
  (open_golden_ratio_first)
  (dotimes (i (or count 1))
    (windmove-up))
  (run-at-time 0.1 nil (lambda () (golden-ratio))))

(defun mp-ui/split-window-below ()
  (interactive)
  (open_golden_ratio_first)
  (split-window-below))

(defun mp-ui/split-window-right ()
  (interactive)
  (open_golden_ratio_first)
  (split-window-right))

;;; mp-ui/funcs.el ends here
