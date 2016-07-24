;;; spaceline-config.el --- Spaceline themes

;; This file is not part of GNU Emacs.

;; Changer: Mephis Pheies
;; Email: mephistomm@gmail.com

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

;; This file contains ready-to-use modeline themes for powerline.

;;; Code:

(require 'spaceline-segments)

(defun self-spaceline--theme (&rest additional-segments)
  "Convenience function for the spacemacs and emacs themes.
   Only for my self"
  (spaceline-install `(
      ((major-mode buffer-modified)
      :fallback evil-state
      :face highlight-face)
      anzu
      auto-compile
      ((persp-name workspace-number window-number)
       :separator "|")
      (process :when active)
      (minor-modes :when active)
      (buffer-size  remote-host buffer-id)
      (mu4e-alert-segment :when active)
      (erc-track :when active)
      (version-control :when active)
      (org-pomodoro :when active)
      (org-clock :when active)
      nyan-cat)

    `(which-function
      (python-pyvenv :fallback python-pyenv)
      (battery :when active)
      selection-info
      input-method
      ((buffer-encoding-abbrev
        point-position
        line-column)
      :separator " | ")
      ((flycheck-error flycheck-warning flycheck-info)
       :when active)
      (global :when active)
      ,@additional-segments
      buffer-position
      hud))

  (setq-default mode-line-format '("%e" (:eval (spaceline-ml-main)))))

(defun spaceline-self-theme (&rest additional-segments)
  "Install the modeline used by Spacemacs.

ADDITIONAL-SEGMENTS are inserted on the right, between `global' and
`buffer-position'."
  (apply 'self-spaceline--theme
          additional-segments))


(provide 'self-spaceline-config)

;;; self-spaceline-config.el ends here
