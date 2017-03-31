;;; advance-words-count.el --- A Package Provides Extended `count-words'
;;
;; Filename: advance-words-count.el
;; Description: Provides Extended `count-words' function.
;; Repository: https://github.com/LdBeth/advance-words-count.el
;; Author: LdBeth
;; Maintainer: LdBeth
;; Created: Wed Mar 29 14:42:25 2017 (+0800)
;; Version: 0.8.0
;; Last-Updated:
;;           By:
;;     Update #: 0
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:
(defgroup andvance-words-count nil
  "Extended `count-words' function."
  :prefix "words-count"
  :group 'text)

(defcustom words-count-rule-chinese "\\cc"
  "A regexp string to match Chinese characters."
  :group 'advance-words-count
  :type 'string)

(defcustom words-count-rule-nonespace "[^[:space:]]"
  "A regexp string to match none space characters."
  :group 'advance-words-count
  :type 'string)

(defcustom words-count-rule-ansci "[A-Za-z0-9][A-Za-z0-9[:punct:]]*"
  "A regexp string to match ANSCII characters."
  :group 'advance-words-count
  :type 'string)

(defcustom words-count-regexp-list
  (list words-count-rule-chinese
        words-count-rule-nonespace
        words-count-rule-ansci)
  "A list for the regexp used in `advance-words-count'."
  :group 'advance-words-count
  :type '(repeat regexp))

(defcustom words-count-message-func 'format-message--words-count
  "The function used to format message in `advance-words-count'."
  :group 'advance-words-count
  :type '(function))

(defcustom words-count-message-display 'minibuffer
  "The way how `message--words-count' display messages."
  :group 'advance-words-count
  :type 'string)

(defun special--words-count (start end regexp)
  "Count the word from START to END with REGEXP."
  (let ((count 0))
    (save-excursion
      (save-restriction
        (goto-char start)
        (while (and (< (point) end) (re-search-forward regexp end t))
          (setq count (1+ count)))))
    count))

(defun format-message--words-count (list start end &optional arg)
  "Format a string to be shown for `message--words-count'.
Using the LIST passed form `advance-words-count'. START & END are
required to call extra functions, see `count-lines' &
`count-words'. When ARG is specified, display verbosely."
  (format "
-----------~*~ Words Count ~*~----------
 Characters (without Space) .... %d
 Characters (all) .............. %d
 Number of Lines ............... %d
 ANSCII Words .................. %d
%s
========================================
"
   (cadr list)
   (- end start)
   (count-lines start end)
   (car (last list))
   (if (= 0 (car list))
       (format " Latin Words ................... %d\n"
               (count-words start end))
     (format " CJK Chars ..................... %d
 Word Count .................... %d\n"
             (car list)
             (+ (car list) (car (last list)))))))

(defun message--words-count (list &optional arg)
  "Display the word count message.
Using tool specified in `words-count-message-display'. The LIST
will be passed to `format-message--words-count'. See
`words-count-message-func'. If ARG is not ture, display in the
minibuffer."
  (let ((opt words-count-message-display)
        (string (apply words-count-message-func list))
        (time nil))
    (if (null arg)
        (message string)
      (cond
       ((eq 'minibuffer opt)
        (message string))))))

;;;###autoload
(defun advance-words-count (beg end &optional arg)
  "Chinese user preferred word count.
If BEG = END, count the whole buffer. If called initeractively,
use minibuffer to display the messages. The optional ARG will be
passed to `format-message--words-count' to decide the style of
display.
See also `special-words-count'."
  (interactive (if (use-region-p)
                   (list (region-beginning)
                         (region-end)
                         (or current-prefix-arg nil))
                 (list nil nil (or current-prefix-arg nil))))
  (let ((min (or beg (point-min)))
        (max (or end (point-max)))
        info)
    (setq info
          (mapcar
           (lambda (r) (special--words-count min max r))
           words-count-regexp-list))
    (if (called-interactively-p 'any)
        (message--words-count (list info min max arg) (if arg t))
      info)))

(provide 'advance-words-count)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; advance-words-count.el ends here
