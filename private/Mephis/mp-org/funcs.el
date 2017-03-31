;;; mp-org/funcs.el --- provide functions for mp-org

;; Author: Mephis Pheies <mephistommm@gmail.com>
;; Keywords: keywords

;;; Commentary:

;; mp-org/create-mrg-buffer provide the fundament for mrg:
;; - create markdown buffer
;; - change current buffer directory

;;; Code:
(defun mp-org/get-filepath-at-org-img-link ()
  "Return the absolute path of img link in org buffer."
  (let (p1 p2)
    (skip-chars-backward "^[")
    (setq p1 (point))
    (skip-chars-forward "^]")
    (setq p2 (point))
    (setq imglink (string-trim (buffer-substring-no-properties p1 p2)))
    (when (string-prefix-p "img:" imglink)
      (expand-file-name (substring imglink 4))
      ))
  )

(defun mp-org/mequ-upload-file (filepath)
  (let ((command-str (format "mequ -c %s -f \"%s\"" mequ-conf-file filepath)))
    (shell-command-to-string command-str)))

(defun mp-org/mequ-upload-img-link-file ()
  "From img link it get file path, then upload to qiniu."
  (interactive)
  (message (mp-org/mequ-upload-file (mp-org/get-filepath-at-org-img-link))))

(defun mp-org/new-org-buffer-in-dropdire ()
  "Create a new buffer then init by mrg."
  (interactive)
  (let ((ξbuf (generate-new-buffer "Dropbox org buffer")))
    (switch-to-buffer ξbuf))
    (org-mode)
    (setq default-directory notes-org-directory-path)
  )

(defun mp-org/custom-link-img-follow (path)
  "Click event of custom link img."
  (org-open-file-with-emacs path)
   )

(defun mp-org/custom-link-img-export (path desc format)
  "export event of custom link img."
  (cond
   ((eq format 'html)
    ;; concat custom img host and final two section of the path
    (let (uri-slices slices-len url)
         (setq uri-slices (split-string path "/"))
         (setq slices-len (length uri-slices))
         (setq url (if (< slices-len 2)
                    (concat custom-link-img-export-host "/" (car uri-slices))
                    (concat custom-link-img-export-host "/"
                    (nth (- slices-len 2) uri-slices) "/"
                    (nth (- slices-len 1) uri-slices))))
      (message (url-encode-url url))
      (format "<img src=\"%s\" alt=\"%s\"/>" (url-encode-url url) desc))))
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
  (spacemacs/set-leader-keys "xC" 'advance-words-count)

  ;; Org Agenda Reload
  (spacemacs/set-leader-keys "aor" 'mp-org/org-agenda-reload-files)

  ;; Org new file in Dropbox
  (spacemacs/set-leader-keys "on" 'mp-org/new-org-buffer-in-dropdire)

  ;; Uploat img link file
  (spacemacs/set-leader-keys "om" 'mp-org/mequ-upload-img-link-file)


  ;; (spacemacs/set-leader-keys "xf" 'fill-region)
  ;; This function is the same as 'gq' in evil(vim)
  )
;;; mp-org/funcs.el ends here
