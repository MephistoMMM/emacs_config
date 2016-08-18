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
        haskell-mode
        company-jedi
        web-mode
        auto-complete
        js2-mode
        ;; flycheck
        flycheck
        ))

(defun mp-hacking/init-company-jedi ()
  "Add company-jedi to python company-backend."
  (use-package company-jedi
    :defer t
    :init
    (add-hook 'python-mode-hook
              (lambda () (add-to-list 'company-backends-python-mode 'company-jedi)))))

(defun mp-hacking/post-init-haskell-mode ()
  "Add haskell cabal bin path to 'exec-path."
  (with-eval-after-load 'haskell-mode
    (add-to-list 'exec-path
                 (concat (getenv "HOME") "/.cabal/bin/"))
    )
  )

(defun mp-hacking/post-init-web-mode ()
  "Init web mode for indent offset, 'auto-mode-alist and so.
http://web-mode.org"
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
  (with-eval-after-load 'web-mode
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2))
  )

(defun mp-hacking/post-init-auto-complete ()
  "Ignore case if completion target string doesn't include upper characters
http://auto-complete.org/doc/manual.html#ignore-case"
  (with-eval-after-load 'auto-complete
    (setq ac-ignore-case 'smart)))


(defun mp-hacking/init-leave-delimited ()
  "Let us be free to  go out of parens."
  (use-package leave-delimited
    :defer t))

;; (defun mp-hacking/post-init-flycheck ()
;;   "While flycheck enabled, Add hook for js2-mode to checking does js2-checks need to hide.."
;;   (add-hook 'js2-mode-hook 'mp-hacking/hide-js2-checks-if-flycheck-active))

(defun mp-hacking/post-init-js2-mode ()
  "Add a series of default configuration fo js2-mode"
  (add-hook 'js2-mode-hook (lambda ()
                             (when (configuration-layer/package-usedp 'flycheck-mode)
                               (flycheck-mode 1))))
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
  )

;;; packages.el ends here
