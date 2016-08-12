;;; leave-delimited.el --- Leave a string or paren/brace/bracket

;; Copyright (C) 2015  Andreas Roehler

;; Author: Andreas Roehler <andreas.roehler@online.de>
;; Keywords: lisp, convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(defun ar-beginn-of-delimited ()
  "Go to beginn of a string or parentized/braced/bracketed. "
  (let ((pps (parse-partial-sexp (point-min) (point))))
    (cond
     ((nth 3 pps)
      (goto-char (nth 8 pps)))
     ((nth 1 pps)
      (goto-char (nth 1 pps))))))

;;;###autoload
(defun ar-leave-delimited-backward ()
  "Go one char beyond string, paren, bracket etc. "
  (interactive)
  (ar-beginn-of-delimited)
  (unless (bobp) (forward-char -1)))

;;;###autoload
(defun ar-leave-delimited-forward ()
  "Go one char beyond string, paren, bracket etc. "
  (interactive)
  (ar-beginn-of-delimited)
  (forward-sexp))

(provide 'leave-delimited)
;;; leave-delimited.el ends here
