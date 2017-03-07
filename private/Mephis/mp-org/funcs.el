;;; mp-org/funcs.el --- provide functions for mp-org

;; Author: Mephis Pheies <mephistommm@gmail.com>
;; Keywords: keywords

;;; Commentary:

;; mp-org/create-mrg-buffer provide the fundament for mrg:
;; - create markdown buffer
;; - change current buffer directory

;;; Code:

(defun mp-org/new-org-buffer-in-dropdire ()
  "Create a new buffer then init by mrg."
  (interactive)
  (let ((ξbuf (generate-new-buffer "Dropbox org buffer")))
    (switch-to-buffer ξbuf))
    (org-mode)
    (setq default-directory notes-org-directory-path)
  )

(defun mp-org/org-agenda-reload-files ()
  "Reset the default value of org-agenda-reload-files."
  (interactive)
  (setq-default org-agenda-files (find-lisp-find-files org-directory "\.org$"))
  (message "Reload org files success!")
  )

(defun mp-org/org-insert-src-code-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode.
Go files should disable fly-check."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "c" "shell" "java" "js2" "clojure"
            "c++" "css" "go" "rust" "R" "sass" "sql" "awk" "haskell"
            "latex" "lisp" "matlab" "org" "perl" "ruby" "scheme" "sqlite")))
     (list (ivy-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

(defun mp-org/better-default ()
  "Better default for mp-org, something done in
user-config should be defined in this function!"

  ;; Count Words
  (spacemacs/set-leader-keys "xC" 'count-words)
  ;; Fill Region
  ;; (spacemacs/set-leader-keys "xf" 'fill-region)
  ;; This function is the same as 'gq' in evil(vim)
  )

;;; mp-org/funcs.el ends here
