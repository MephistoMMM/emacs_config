;;; mp-ui/packages.el --- defines packages for ui

;; Author: Mephis Pheies <mephistommm@gmail.com>
;; Keywords: ui packages spacemacs elisp

;;; Commentary:

;; description

;;; Code:

(defconst mp-ui-packages
  '(
    linum-relative
    sublimity
    ranger)
 )

(defun mp-ui/init-sublimity ()
  "Sublimity mode - I want to try the map of sublimity"
  (use-package sublimity
    :defer t
    :init
    (spacemacs|add-toggle sublimity
      :status sublimity-mode
      :on
      (sublimity-mode)
      :off
      (sublimity-mode -1)
      :documentation "Open a Minimap for buffer!")
    )
  (spacemacs/set-leader-keys "tM" 'spacemacs/toggle-sublimity)
  )

(defun mp-ui/post-init-sublimity ()
  "Sublimity map and attractive"
  (with-eval-after-load 'sublimity
    (use-package sublimity-map
      :config
      (setq sublimity-map-size 20)
      (setq sublimity-map-fraction 0.3)
      (sublimity-map-set-delay 0.3))
    )
  )

(defun mp-ui/post-init-ranger ()
  "Configuations for ranger!"
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
