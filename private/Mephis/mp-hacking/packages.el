;;; mp-hacking/packages.el --- Defined packages and some base configs for mp-hacking.

;; Author: Mephis Pheies <mephistommm@gmail.com>
;; Keywords: spacemacs layer elisp mp-hacking packages

;;; Commentary:

;;

;;; Code:
(setq mp-hacking-packages
      '(
        ;; leave-delimited
        (leave-delimited :location (recipe
                                    :fetcher github
                                    :repo "MephistoMMM/leave-delimited"))
        writeroom-mode
        js2-mode
        ;; flycheck
        flycheck
        ))

(defun mp-hacking/init-writeroom-mode ()
  "Free writing mode - focus your code."
  (use-package writeroom-mode
    :init
    (spacemacs|add-toggle writeroom
      :status writeroom-mode
      :on (writeroom-mode)
      :off (writeroom-mode -1)
      :documentation "Free writing mode - focus your code")
    :config
    (setq writeroom-restore-window-config t)
    (with-eval-after-load 'writeroom-mode
      (define-key writeroom-mode-map (kbd "C-M-<") #'writeroom-decrease-width)
      (define-key writeroom-mode-map (kbd "C-M->") #'writeroom-increase-width)
      (define-key writeroom-mode-map (kbd "C-M-=") #'writeroom-adjust-width))))


(defun mp-hacking/init-leave-delimited ()
  "Let us be free to  go out of parens."
  (use-package leave-delimited
    :defer t))

(defun mp-hacking/post-init-flycheck ()
  "While flycheck enabled, Add hook for js2-mode to checking does js2-checks need to hide.."
  (add-hook 'js2-mode-hook 'mp-hacking/hide-js2-checks-if-flycheck-active))

(defun mp-hacking/post-init-js2-mode ()
  "Add a series of default configuration fo js2-mode"
  (with-eval-after-load 'js2-mode
    (progn
      ;; these mode related variables must be in eval-after-load
      ;; https://github.com/magnars/.emacs.d/blob/master/settings/setup-js2-mode.el
      (setq-default js2-global-externs '("module"
                                          "require"
                                          "assert"
                                          "setTimeout"
                                          "clearTimeout"
                                          "setInterval"
                                          "clearInterval"
                                          "__dirname"
                                          "console"
                                          "JSON"))
      (setq-default js2-idle-timer-delay 0.2)
      (setq-default js-indent-level 2)
      (setq-default js2-basic-offset 2)

      ;; Let flycheck handle parse errors
      (setq-default js2-mode-show-parse-errors nil)
      (setq-default js2-mode-show-strict-warnings nil)
      (setq-default js2-highlight-external-variables t)
      (setq-default js2-strict-trailing-comma-warning nil)

    ))
    ;;(add-hook 'flycheck-hook 'mp-hacking/hide-js2-checks-if-flycheck-active)
  )

;;; packages.el ends here
