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
    (setq-default
      org-bullets-bullet-list '("❁" "✾" "❀" "❖")
      org-directory "~/Org/"
      org-agenda-files (quote ("~/Dropbox/org/" ))
      org-default-notes-file "~/Dropbox/org/notes.org"

      ;; org-agenda-restore-windows-after-quit t
      ;; org-agenda-window-setup 'current-window
      ;; org-catch-invisible-edits 'show-and-error
      ;; org-footnote-auto-adjust t
      ;; org-footnote-auto-label 'confirm

      org-capture-templates
      '(("t" "Tasks" entry (file+headline "~/Dropbox/org/TODO.org" "Inbox")
        "** TODO %^{Task}\nSCHEDULED: %t\n")
        ("J" "Journal entry with date" plain
        (file+datetree+prompt "~/Dropbox/org/journal.org")
        "%K - %a\n%i\n%?\n"
        :unnarrowed t)
        ("s" "Journal entry with date, scheduled" entry
        (file+datetree+prompt "~/Dropbox/org/journal.org")
        "* \n%K - %a\n%t\t%i\n%?\n"
        :unnarrowed t)
        ("p" "Protocol" entry (file+headline "~/Dropbox/org/TODO.org" "Inbox")
        "** %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
        ("L" "Protocol Link" entry (file+headline "~/Dropbox/org/TODO.org" "Inbox")
        "** TODO %? [[%:link][%:description]] \nCaptured On: %U"))
      )
    )
  )


;;; mp-org/packages.el ends here
