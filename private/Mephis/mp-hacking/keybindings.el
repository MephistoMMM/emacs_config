;;; keybindings.el --- define a function for keybinding

;; Author: Mephis Pheies <mephistommm@gmail.com>
;; Keywords: spacemacs layers elisp keybindings

;;; Commentary:

;;

;;; Code:

(defun mp-hacking/hacking-keybinding-init ()
  "This fucntion provide more efficient keybindings for hacker.
   It should be called in 'dotspacemacs/user-config', sence it will cover the some
   default keybinding."
  ;; Surround
  ;; the same as the vim surround
  ;; cs <from> <to>        change surround
  ;; ds <aim>              delete surround
  ;; <visual> s <aim>      create surround

  ;; Comment
  (spacemacs/set-leader-keys "ci" 'spacemacs/comment-or-uncomment-lines) ; comment toggle

  ;; Buffer
  (spacemacs/set-leader-keys "bt" 'evil-buffer-new) ; new buffer

  ;; Window
  ;; (spacemacs/set-leader-keys "wc" 'delete-window) ; delete window

  ;; Expand
  (define-key evil-normal-state-map (kbd "e") 'er/expand-region)
  (define-key evil-visual-state-map (kbd "e") 'er/expand-region)
  (define-key evil-normal-state-map (kbd "E") 'er/contract-region)
  (define-key evil-visual-state-map (kbd "E") 'er/contract-region)

  ;; Jump out from pairs
  (define-key evil-insert-state-map (kbd "C-'") 'ar-leave-delimited-forward)
  (define-key evil-normal-state-map (kbd "C-'") 'ar-leave-delimited-forward)

  ;; Scroll
  ;; Enable mouse support
  (unless window-system
    (global-set-key (kbd "<mouse-4>") 'evil-previous-line)
    (global-set-key (kbd "<mouse-5>") 'evil-next-line))
  (setq smooth-scroll-margin 10)

  ;; Yasnippet
  ;; Use C-k to start complete snips and use TAB to go arround the points
  ;; How to write yasnippet: https://joaotavora.github.io/yasnippet/snippet-development.html or http://d.pr/n/1bHuv
  (define-key evil-insert-state-map (kbd "C-l") 'hippie-expand)
  (spacemacs/declare-prefix "o" "owner")
  (spacemacs/declare-prefix "oy" "yasnippet")
  (spacemacs/set-leader-keys "oyn" 'yas-new-snippet)                      ;;owner yasnippet new
  (spacemacs/set-leader-keys "oyl" 'yas-load-snippet-buffer)              ;;owner yasnippet load
  (spacemacs/set-leader-keys "oyc" 'yas-load-snippet-buffer-and-close)    ;;owner yasnippet load and close
  (spacemacs/set-leader-keys "oyv" 'yas-visit-snippet-file)               ;;owner yasnippet visit file

  ;; Themes auto change
  (spacemacs/declare-prefix "at" "themes auto change")
  (spacemacs/set-leader-keys "ato" 'mp-ui/open-themes-auto-change)
  (spacemacs/set-leader-keys "atc" 'mp-ui/close-themes-auto-change)
  )

;;; keybindings.el ends here
