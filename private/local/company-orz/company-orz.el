;;; company-orz.el --- company-mode backend for orz

;; Copyright (C) 2016 Mephis Pheies

;; Author: Mephis Pheies <mephistommm@gmail.com>
;; URL: https://github.com/MephistoMMM/emacs-config/private/company-orz.el
;; Version: 0.1.0
;; Package-Requires: ((cl-lib "0.5") (company "0.8.0"))
;; Keywords: orz emacs company
;; Prefix: company-orz

;;; Commentary:

;; A sample company back and for my orz emoji.
;; http://sixty-north.com/blog/writing-the-simplest-emacs-company-mode-backend
;; TODO: more fast!

;;; Code:

;; requires

(require 'cl-lib)
(require 'company)

;; version string

(defconst company-orz-version "0.1.0")

;; customize

(defgroup company-orz nil
  "Company-mode backend for autocompleting orz group string"
  :group 'company)

(defcustom company-orz-insert-unicode t
  "Replace the :shortcode: with the real Unicode character upon completion."
  :group 'company-orz
  :type 'boolean)

;; the actual code things

;; See
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Text-Props-and-Strings.html
;; for the syntax.
(defconst company-orz-list
  (list
    #(":exciting:" 0 1 (:unicode "o(≧∇≦o)"))
    #(":exciting_right:" 0 1 (:unicode "(/ ^▽^)/"))
    #(":sad:" 0 1 (:unicode "(っ- ‸ – ς)"))
    #(":what_happened:" 0 1 (:unicode "Σ(っ °Д °;)っ"))
    #(":tears:" 0 1 (:unicode "(T ﹏ T)"))
    #(":cat_star:" 0 1 (:unicode "(=ↀωↀ=)✧"))
    #(":kiss_love:" 0 1 (:unicode "σ(≧ε≦σ) ♡"))
    #(":surprise_round_eyes:" 0 1 (:unicode "∑(O _ O ;)"))
    #(":hands_up_greeting:" 0 1 (:unicode "( ⌒ω⌒)ﾉ"))
    #(":winking_star:" 0 1 (:unicode "( ^ _ <)〜☆"))
    #(":writing_quietly:" 0 1 (:unicode "__φ(．．)"))
    #(":running_fast:" 0 1 (:unicode "C= C= C= C=┌(｀ー´)┘"))
    #(":sleepy:" 0 1 (:unicode "(￣ρ￣)..zzZZ"))
    #(":friends_hand_in_hand:" 0 1 (:unicode "ヽ( ≧◡≦)八(o^ ^o)ノ"))
    #(":shot_you:" 0 1 (:unicode "(ﾒ￣▽￣)︻┳═一"))
    #(":majic_star:" 0 1 (:unicode "(ﾉ≧∀≦)ﾉ ‥…━━━★"))
    #(":food:" 0 1 (:unicode "Fooooood…ԅ(¯﹃¯ԅ)"))
    #(":table_flip_angry:" 0 1 (:unicode "(┛✧Д✧)┛彡┻━┻"))
    #(":punch:" 0 1 (:unicode "(o￣∇￣)=◯)`ν゜)"))
    #(":lets_go:" 0 1 (:unicode "─=≡Σ((( つ•̀ω•́)つLET’SGO!"))
    #(":singing:" 0 1 (:unicode "{{ヽ(๑╹◡╹๑)ﾉ}}♬"))
    )
  )

(defun company-orz--annotation (s)
  "Return a formatted annotation for completion candidate S."
  (format " %s" (get-text-property 0 :unicode s)))

;;;###autoload
(defun company-orz (command &optional arg &rest ignored)
  "Provide a backend for company to complete orz-words.

company.el calls this function, and passes a COMMAND to it that
depends on the context: 'prefix', 'candidates', 'annotation',
etc.  In some contexts it also passes ARG, which is the list of
candidates that match what has been typed so far.  Sometimes ARG
is a single candidate, as when COMMAND is 'annotation' or
'post-completion'.  Other arguments are IGNORED."

  (cl-case command
    ;; 'prefix' has too many meanings in emacs lisp but here we're
    ;; specifying what the string we're completing should begin with
    (prefix (company-grab "\:[a-zA-Z0-9-_]*"))
    (candidates
      ;; filter based on what's already been typed
      (cl-remove-if-not
      (lambda (c) (string-prefix-p arg c))
      company-orz-list))
    ;; show the real orz alongside its name in the completion list
    (annotation (company-orz--annotation arg))
    ;; when we find the orz we want, replace it with the real orz
    ;; (assuming company-orz-insert-unicode is set to true)
    (post-completion
      (if company-orz-insert-unicode
          (progn
            (kill-region (- (point) (length arg)) (point))
            (insert (get-text-property 0 :unicode arg)))))))

;;;###autoload
(defun company-orz-init ()
  "Add orz to the company backends."
  (interactive)
  (add-to-list 'company-backends 'company-orz))

(provide 'company-orz)

;;; company-orz.el ends here
