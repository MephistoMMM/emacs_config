;;; funcs.el --- Define functions for mp

;; Author: Mephis Pheies <mephistommm@gmail.com>
;; Keywords: spacemacs layer elisp mp-hacking

;;; Commentary:

;;

;;; Code:

(defun mp-hacking/better-default ()
  "This function set many default config to more better!
Some configurations should be written at here which be unable to config
in 'with-eval-after-load.")

(defun mp-ui/format-haskell-buffer ()
  "format haskell buffer by hindent-reformat-buffer and haskell-mode-stylish-buffer"
  (interactive)
  (hindent-reformat-buffer)
  (haskell-mode-stylish-buffer))

(defun mp-ui/hungry-delete ()
  "Delete all spaces before current point"
  (interactive)
  (unless (> (char-before) 32)
    (c-hungry-delete-backwards))
 )

(defun mp-ui/hungry-delete-current-line ()
  "Delete all spaces before current point in current line"
  (interactive)
  (let ((here (point)))
    (while (progn
             (skip-syntax-backward " \t\r\f\v")
             (eq (char-before) ?\\))
      (backward-char))
    (if (< (point) here)
        (delete-region (point) here))
   )
 )

(define-minor-mode self-evil-play-mode
  "Buffer-local minor mode to define self evil keyboard."
  :keymap (make-sparse-keymap))

(define-globalized-minor-mode global-self-evil-play-mode
  self-evil-play-mode
  (lambda ()
    (self-evil-play-mode 1))
  "Global minor mode to define self evil keyboard.")

(global-self-evil-play-mode)

(defun self-evil-play-interactive-setup ()
  (setq evil-inhibit-operator t)
  (list (assoc-default evil-this-operator self-evil-play-operator-alist)))

(defmacro self-evil-play-define-key (key-sequence func)
  "Binding evil operator with the func."
  (let ((func-name (intern (format "self-evil-play/%s"
                                   (nth 1 func)))))
    `(progn
       (evil-define-command ,func-name
         (operation)
         ,(format "Define %s for evil operator!"
                  (nth 1 func))
         (interactive (self-evil-play-interactive-setup))
         (cond
          ((eq operation (quote ,(intern (substring key-sequence 0 1))))
           (call-interactively ,func))))
       (evil-define-key 'operator
         self-evil-play-mode-map
         ,(substring key-sequence 1)
         (quote ,func-name)))))

(defun mp-hacking/hide-js2-checks-if-flycheck-active ()
  "This function hide the result of js2-mode checking when there is a checker for flycheck."
  (message "fuck")
  (if (flycheck-get-checker-for-buffer)
      ;;t
      (js2-mode-hide-warnings-and-errors)
    ;;nil
    (js2-mode-display-warnings-and-errors)))

;;; funcs.el ends here
