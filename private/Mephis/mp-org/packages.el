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
    (blog-admin :location (recipe
                           :fetcher github
                           :repo "MephistoMMM/blog-admin"))
    (advance-words-count :location (recipe
                                    :fetcher github
                                    :repo "MephistoMMM/advance-words-count.el"))
    ;; (company-orz :location
    ;;              "~/.emacs.d/private/local/company-orz/")
    )
  )

;; (defun mp-org/init-company-orz ()
;;   "Add company-orz to backend"
;;   (use-package company-orz
;;     :defer t
;;     :init
;;     (add-hook 'markdown-mode-hook
;;               (lambda () (add-to-list 'company-backends-markdown-mode 'company-orz)))
;;     (add-hook 'org-mode-hook
;;               (lambda () (add-to-list 'company-backends-org-mode 'company-orz)))
;;     ))

(defun mp-org/init-advance-words-count()
  "Load advance-words-count"
  (use-package advance-words-count
    :defer t)
  )

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
  (setq-default org-directory "~/Dropbox/org")

  ;; set for mequ
  (setq mequ-conf-file "~/Dropbox/mequ.conf")

  ;; config new org file in dropbox
  (setq-default notes-org-directory-path (concat org-directory "/notes"))

  (add-hook 'org-mode-hook (lambda ()
                             (if org-descriptive-links
                                 (progn (org-remove-from-invisibility-spec '(org-link))
                                        (org-restart-font-lock)
                                        (setq org-descriptive-links nil)))
                             (setq truncate-lines nil)) 'append)
  (with-eval-after-load 'org
    (spacemacs/set-leader-keys-for-major-mode 'org-mode "C-o" 'org-toggle-inline-images)
    (spacemacs/set-leader-keys-for-major-mode 'org-mode "it" 'org-insert-todo-heading)
    (spacemacs/set-leader-keys-for-major-mode 'org-mode "ic" 'mp-org/org-insert-src-code-block)

    ;; config org-download and define custom link
    (setq-default
     custom-link-img-export-host "http://7xlwbp.com1.z0.glb.clouddn.com"
     org-download-image-dir (concat org-directory "/statics")
     org-download-image-html-width 600
     org-download-link-format "[[img:%s]]"
     org-download-heading-lvl nil)
    (org-add-link-type "img" 'mp-org/custom-link-img-follow 'mp-org/custom-link-img-export)

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
      org-startup-with-inline-images nil
      org-bullets-bullet-list '("❁" "✾" "❀" "❖" "✧")
      org-agenda-files (find-lisp-find-files org-directory "\.org$")
      org-default-notes-file (concat org-directory "/Temp.org")

      ;; org-log-done 'note

      org-agenda-span 'day
      org-agenda-restore-windows-after-quit t
      org-agenda-window-setup 'other-window
      org-footnote-auto-adjust t
      org-footnote-auto-label 'confirm

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
         "* TODO [#B] %?\t:Habits:\nSCHEDULED: %T\n:PROPERTIES:\n:STYLE:\thabit\n:END:"
         :empty-lines 1)

        ("n" "Temporary Notes" entry
         (file+headline (concat org-directory "/Temp.org") "Temporary Notes")
         "* %?\n  %i%a\n%U"
         :empty-lines 1)
      )
    ))
 )


(defun mp-org/init-blog-admin ()
  "Configurations for blog-admin."
  (use-package blog-admin
    :defer t
    :commands blog-admin-start
    :init
    (progn
      (setq blog-admin-backend-path "~/Documents/Person/Blog")
      (setq blog-admin-backend-type 'hexo)
      (setq blog-admin-backend-new-post-in-drafts t) ;; create new post in drafts by default
      (setq blog-admin-backend-new-post-with-same-name-dir t) ;; create same-name directory with new post
      (setq blog-admin-backend-hexo-config-file "static_blog_config.yml") ;; default assumes _config.yml

      (add-hook 'blog-admin-backend-after-new-post-hook 'find-file)

      (spacemacs/set-leader-keys "ab" 'blog-admin-start)
      ))
   )

