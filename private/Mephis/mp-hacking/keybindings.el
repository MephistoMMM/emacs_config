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
  (spacemacs/declare-prefix "h" "helm/hacking/highlight/help")
  (spacemacs/declare-prefix "hy" "yasnippet")
  (spacemacs/set-leader-keys "hyn" 'yas-new-snippet)                      ;;hacking yasnippet new
  (spacemacs/set-leader-keys "hys" 'spacemacs/helm-yas)                   ;;hacking yasnippet show
  (spacemacs/set-leader-keys "hyl" 'yas-load-snippet-buffer)              ;;hacking yasnippet load
  (spacemacs/set-leader-keys "hyc" 'yas-load-snippet-buffer-and-close)    ;;hacking yasnippet load and close
  (spacemacs/set-leader-keys "hyv" 'yas-visit-snippet-file)               ;;hacking yasnippet visit file
  )

;;; keybindings.el ends here
