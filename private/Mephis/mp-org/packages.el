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
    markdown-mode
    company-mode
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
  (setq-default
   mrg-directory-path "~/Dropbox/mrg"
   markdown-enable-math t)
  (spacemacs/set-leader-keys "am" 'mp-org/create-mrg-buffer)
  ;; mrg layout
  ;; https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Bwindow-management/spacemacs-layouts
  (when (fboundp 'spacemacs|define-custom-layout)
    (spacemacs|define-custom-layout "mrg layout"
      :binding "m"
      :body
      (find-file (concat mrg-directory-path "/index.md")))
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
  (add-hook 'org-mode-hook (lambda ()
                             (if org-descriptive-links
                                 (progn (org-remove-from-invisibility-spec '(org-link))
                                        (org-restart-font-lock)
                                        (setq org-descriptive-links nil)))
                             (setq truncate-lines nil)
                             (spacemacs/toggle-line-numbers-off)) 'append)
  (with-eval-after-load 'org
    (setq org-directory "~/Dropbox/org")
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((sh . t)
       (js . t)
       (python . t)
       (emacs-lisp . t)
       (haskell . t)
       (C . t)))

    (setq-default
      org-bullets-bullet-list '("❁" "✾" "❀" "❖" "✧")
      org-agenda-files (quote ("~/Dropbox/org/" ))
      org-default-notes-file "~/Dropbox/org/notes.org"

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
         (file+headline (concat org-directory "/todo.org") "Fighting")
         "* TODO [#A]  %^{Task}\nSCHEDULED: %t\n")

        ("t" "Todo" entry
         (file+headline (concat org-directory "/todo.org") "Play Space")
         "* TODO [#%^{level|B|C}]  %?\nSCHEDULED: %t\n%i\n"
         :empty-lines 1)

        ("l" "Links" entry
         (file+headline (concat org-directory "/todo.org") "Play Space")
         "* TODO [#C]  %? link \t%^g\nCaptured On: %U\n"
         :empty-lines 1)

        ("h" "Habits" entry
         (file+headline (concat org-directory "/todo.org") "Habits")
         "* TODO [#B]  %?\t:Habits:\nSCHEDULED: timestamp\n:PROPERTIES:\n:STYLE:\thabit\n:END:"

         :empty-lines 1)

        ("n" "Quick Notes" entry
         (file+headline (concat org-directory "/Notes.org") "Quick Notes")
         "* %?\n  %i%a\n%U"
         :empty-lines 1)

        ("b" "Technical Notes" entry ; big note
         (file (concat org-directory "/journals.org"))
         "* %^{Technical Notes} [%<%d-%b-%Y>] \n%? \n "
         :empty-lines 1)

        ("s" "Code Snippet[Shell Script]" entry
         (file+headline (concat org-directory "/snippets.org") "Shell Script")
         "* %?\t:sh:\n#+BEGIN_SRC sh\n\n#+END_SRC")

        ("f" "Code Snippet[Front End]" entry
         (file+headline (concat org-directory "/snippets.org") "Front End")
         "* %?\t:%^{language}:\n#+BEGIN_SRC %\\1\n\n#+END_SRC")

        ("g" "Code Snippet[Go]" entry
         (file+headline (concat org-directory "/snippets.org") "Go")
         "* %?\t:golang:\n#+BEGIN_SRC go\n\n#+END_SRC")

        ("p" "Code Snippet[Python]" entry
         (file+headline (concat org-directory "/snippets.org") "Python")
         "* %?\t:python:\n#+BEGIN_SRC python\n\n#+END_SRC")

        ("j" "Code Snippet[Javascript]" entry
         (file+headline (concat org-directory "/snippets.org") "Javascript")
         "* %?\t:javascript:\n#+BEGIN_SRC javascript\n\n#+END_SRC")

        ("o" "Code Snippet[Other]" entry
         (file+headline (concat org-directory "/snippets.org") "Other")
         "* %?\t\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")
      )
    ))
 )


;;; mp-org/packages.el ends here
