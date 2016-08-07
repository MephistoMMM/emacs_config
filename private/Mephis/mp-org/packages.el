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
    org-pomodoro
    )
  )

(defun mp-org/post-init-org-agenda ()
  "Configurations for org agenda"
  (with-eval-after-load 'org-agenda
    (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro)
     )
  )

(defun mp-org/post-init-org ()
  "Configurations for org mode"
  (add-hook 'org-mode-hook (lambda () (spacemacs/toggle-line-numbers-off)) 'append)
  (with-eval-after-load 'org
    (setq org-directory "~/Dropbox/org")

    (setq-default
      org-bullets-bullet-list '("❁" "✾" "❀" "❖" "✧")
      ;; org-agenda-files (quote ("~/Dropbox/org/" ))
      org-default-notes-file "~/Dropbox/org/notes.org"

      ;; org-agenda-restore-windows-after-quit t
      ;; org-agenda-window-setup 'current-window
      ;; org-catch-invisible-edits 'show-and-error
      ;; org-footnote-auto-adjust t
      ;; org-footnote-auto-label 'confirm

      org-capture-templates
      '(("w" "Work" entry
         (file+headline (concat org-directory "/todo.org") "Fighting")
         "* TODO [#A] %^{Task}\nSCHEDULED: %t\n")

        ("b" "Blog Ideas" entry
         (file+headline (concat org-directory "/todo.org") "Blog Ideas")
         "* TODO [#B] %?\n  %i\n %U"
         :empty-lines 1)

        ("t" "Todo" entry
         (file+headline (concat org-directory "/todo.org") "Play Space")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)

        ("l" "Links" entry
         (file+headline (concat org-directory "/todo.org") "Quick Notes")
         "* TODO [#C] %?\n  %i\n %a \n %U"
         :empty-lines 1)

        ("s" "Code Snippet" entry
         (file (concat org-directory "/snippets.org"))
         "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")

        ("n" "Notes" entry
         (file+headline (concat org-directory "/Notes.org") "Quick Notes")
         "* %?\n  %i\n %U"
         :empty-lines 1)

        ("j" "Technical Notes" entry
         (file (concat org-directory "/journals.org"))
         "* Technical Notes [%<%d-%b-%Y>] \n%? \n "
         :empty-lines 1)

        ("d" "Daily" entry
         (file+datetree (concat org-directory "/dailies.org"))
         "* Daily [%<%d-%b-%Y>] \n%? \n "
         :empty-lines 1)
      )
    ))
 )


;;; mp-org/packages.el ends here
