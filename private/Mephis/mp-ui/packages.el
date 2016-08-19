;;; mp-ui/packages.el --- defines packages for ui

;; Author: Mephis Pheies <mephistommm@gmail.com>
;; Keywords: ui packages spacemacs elisp

;;; Commentary:

;; description

;;; Code:

(defconst mp-ui-packages
  '(
    linum-relative
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
  (with-eval-after-load 'ranger
    (progn
      (define-key evil-normal-state-map (kbd "C-w j") 'mp-ui/evil-window-down)
      (define-key evil-normal-state-map (kbd "C-w h") 'mp-ui/evil-window-left)
      (define-key evil-normal-state-map (kbd "C-w k") 'mp-ui/evil-window-up)
      (define-key evil-normal-state-map (kbd "C-w l") 'mp-ui/evil-window-right)
      (spacemacs/set-leader-keys "ws" 'mp-ui/split-window-below)
      (spacemacs/set-leader-keys "wv" 'mp-ui/split-window-right)
      ;; (define-key ranger-normal-mode-map (kbd "q") 'mp-ui/quit-ranger)
    ))
  (spacemacs/set-leader-keys "ar" 'mp-ui/ranger)
  ;; Ranger
  (setq ranger-ignored-extensions '("mkv" "iso" "mp4"))
  (setq ranger-max-preview-size 2)
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
