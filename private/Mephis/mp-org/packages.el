;;; mp-org/packages.el --- packages configurations for mp-org

;; Author: Mephis Pheies <mephistommm@gmail.com>
;; Keywords: spacemacs org elisp layer mp-org

;;; Commentary:

;;

;;; Code:


(defconst mp-org-packages
  '(
    org
    org-agenda
    markdown-mode
    (company-orz :location
                 "~/.emacs.d/private/local/company-orz/")
    )
  )

(defun mp-org/init-company-orz ()
  "Add company-orz to backend"
  (use-package company-orz
    :defer t
    :init
    (add-hook 'markdown-mode-hook
              (lambda () (add-to-list 'company-backends-markdown-mode 'company-orz)))
    (add-hook 'org-mode-hook
              (lambda () (add-to-list 'company-backends-org-mode 'company-orz)))
    ))

(defun mp-org/post-init-markdown-mode ()
  "Add mrg key binding!"
  ;; (setq-default
  ;;  mrg-directory-path "~/Dropbox/mrg"
  ;;  markdown-enable-math t)
  ;; (spacemacs/set-leader-keys "am" 'mp-org/create-mrg-buffer)
  ;; ;; mrg layout
  ;; ;; https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Bwindow-management/spacemacs-layouts
  ;; (when (fboundp 'spacemacs|define-custom-layout)
  ;;   (spacemacs|define-custom-layout "mrg layout"
  ;;     :binding "m"
  ;;     :body
  ;;     (find-file (concat mrg-directory-path "/index.md")))
  ;;   )

  ;; for bluprinfile (apib)
  (add-to-list 'auto-mode-alist '("\\.apib\\'" . markdown-mode))
  )

(defun mp-org/post-init-org-agenda ()
  "Configurations for org agenda"
  (with-eval-after-load 'org-agenda
    (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro)
     )
  )

(defun mp-org/post-init-org ()
  "Configurations for org mode"
  (setq-default
    org-download-image-dir "~/Dropbox/org/statics"
    org-download-image-html-width 600
    dropbox-org-directory-path "~/Dropbox/org/notes")
  (spacemacs/set-leader-keys "am" 'mp-org/new-org-buffer-in-dropdire)
  (add-hook 'org-mode-hook (lambda ()
                             (if org-descriptive-links
                                 (progn (org-remove-from-invisibility-spec '(org-link))
                                        (org-restart-font-lock)
                                        (setq org-descriptive-links nil)))
                             (setq truncate-lines nil)
                             (spacemacs/toggle-line-numbers-off)) 'append)
  (with-eval-after-load 'org
    (spacemacs/set-leader-keys-for-major-mode 'org-mode "C-o" 'org-toggle-inline-images)
    (spacemacs/set-leader-keys-for-major-mode 'org-mode "it" 'org-insert-todo-heading)

    (setq org-directory "~/Dropbox/org")
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((sh . t)
       (js . t)
       (python . t)
       (emacs-lisp . t)
       (haskell . t)
       (C . t)))

    (load-library "find-lisp")
    (setq-default
      org-bullets-bullet-list '("❁" "✾" "❀" "❖" "✧")
      org-agenda-files (find-lisp-find-files "~/Dropbox/org/" "\.org$")
      org-default-notes-file "~/Dropbox/org/Temp.org"

      ;; org-log-done 'note

      org-agenda-restore-windows-after-quit t
      org-agenda-window-setup 'other-window
      org-footnote-auto-adjust t
      org-footnote-auto-label 'confirm

      ;; org-link-abbrev-alist
      ;; '(("github"    . "https://github.com")
      ;;   ("codewars"  . "https://www.codewars.com")
      ;;   ("bili"      . "http://www.bilibili.com")
      ;;   ("spacemacs" . "http://spacemacs.org"))

      org-modules
      '(org-bbdb org-habit org-info org-irc org-w3m org-mac-link org-protocol)
      org-capture-templates
      '(("w" "Task" entry
         (file+headline (concat org-directory "/TODOs.org") "Fighting")
         "* TODO [#A] %^{Task}\nSCHEDULED: %t\n")

        ("t" "Todo" entry
         (file+headline (concat org-directory "/TODOs.org") "Play Space")
         "* TODO [#%^{level|B|C}] %?\nSCHEDULED: %t\n%i\n"
         :empty-lines 1)

        ("l" "Links" entry
         (file+headline (concat org-directory "/TODOs.org") "Play Space")
         "* TODO [#C] %? link \t%^g\nCaptured On: %U\n"
         :empty-lines 1)

        ("h" "Habits" entry
         (file+headline (concat org-directory "/TODOs.org") "Habits")
         "* TODO [#B] %?\t:Habits:\nSCHEDULED: %
         :empty-lines 1)

        ("n" "Temporary Notes" entry
         (file+headline (concat org-directory "/Temp.org") "Temporary Notes")
         "* %?\n  %i%a\n%U"
         :empty-lines 1)
      )
    ))
 )


;;; mp-org/packages.el ends here
