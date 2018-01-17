;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["color-233" "color-167" "color-142" "color-214" "color-109" "color-175" "color-108" "color-223"])
 '(company-dabbrev-downcase nil t)
 '(company-etags-ignore-case nil)
 '(company-go-show-annotation t)
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("1e8aa89d09c537c1fcd905b80507e4c6217a96b84067c05e933e4002e3a6f361" default)))
 '(default-input-method "TeX")
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-color "#556873" t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#20240E" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#20240E" . 100))))
 '(imenu-list-minor-mode nil)
 '(jdee-db-active-breakpoint-face-colors (cons "#0d0f11" "#7FC1CA"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0d0f11" "#A8CE93"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0d0f11" "#899BA6"))
 '(magit-commit-arguments (quote ("--all")))
 '(magit-diff-use-overlays nil)
 '(org-agenda-files
   (quote
    ("/Users/FusGoethe/Dropbox/org/TODOs.org" "/Users/FusGoethe/Dropbox/org/Temp.org" "/Users/FusGoethe/Dropbox/org/notes/vim/vim_fold.org" "/Users/FusGoethe/Dropbox/org/notes/vim/snippets.org" "/Users/FusGoethe/Dropbox/org/notes/vim/my_vim_grouping.org" "/Users/FusGoethe/Dropbox/org/notes/shell/snippets.org" "/Users/FusGoethe/Dropbox/org/notes/python/threading_lock_and_so_on.org" "/Users/FusGoethe/Dropbox/org/notes/python/snippets.org" "/Users/FusGoethe/Dropbox/org/notes/python/python_path.org" "/Users/FusGoethe/Dropbox/org/notes/python/python_list_slice.org" "/Users/FusGoethe/Dropbox/org/notes/python/optpase_pkg.org" "/Users/FusGoethe/Dropbox/org/notes/python/object_modify.org" "/Users/FusGoethe/Dropbox/org/notes/python/mysql_driver.org" "/Users/FusGoethe/Dropbox/org/notes/python/global_local_and_free_varible.org" "/Users/FusGoethe/Dropbox/org/notes/python/fight_with_django_test.org" "/Users/FusGoethe/Dropbox/org/notes/python/django_websocket.org" "/Users/FusGoethe/Dropbox/org/notes/python/django_sql_default.org" "/Users/FusGoethe/Dropbox/org/notes/python/django_deploy.org" "/Users/FusGoethe/Dropbox/org/notes/other/upd_send.org" "/Users/FusGoethe/Dropbox/org/notes/other/tail_call.org" "/Users/FusGoethe/Dropbox/org/notes/other/snippets.org" "/Users/FusGoethe/Dropbox/org/notes/other/open_licenses.org" "/Users/FusGoethe/Dropbox/org/notes/other/mysql_links.org" "/Users/FusGoethe/Dropbox/org/notes/other/mysql_char_set_config.org" "/Users/FusGoethe/Dropbox/org/notes/other/monodb_update.org" "/Users/FusGoethe/Dropbox/org/notes/other/merge_and_rebase_fetch_and_pull.org" "/Users/FusGoethe/Dropbox/org/notes/other/linux_file_cat.org" "/Users/FusGoethe/Dropbox/org/notes/other/fight_with_fcitx_in_archlinux_gnome3.org" "/Users/FusGoethe/Dropbox/org/notes/other/endianness.org" "/Users/FusGoethe/Dropbox/org/notes/other/dual_boot.org" "/Users/FusGoethe/Dropbox/org/notes/other/docker_net_config.org" "/Users/FusGoethe/Dropbox/org/notes/other/digital_card.org" "/Users/FusGoethe/Dropbox/org/notes/other/differences_between_uefiand_bios.org" "/Users/FusGoethe/Dropbox/org/notes/other/debian_source.org" "/Users/FusGoethe/Dropbox/org/notes/org/magit_base_keys.org" "/Users/FusGoethe/Dropbox/org/notes/javascript/type_and_instanceof.org" "/Users/FusGoethe/Dropbox/org/notes/javascript/step源码摘抄.org" "/Users/FusGoethe/Dropbox/org/notes/javascript/snippets.org" "/Users/FusGoethe/Dropbox/org/notes/javascript/js_variable_up.org" "/Users/FusGoethe/Dropbox/org/notes/javascript/js_bind.org" "/Users/FusGoethe/Dropbox/org/notes/javascript/buffer_write.org" "/Users/FusGoethe/Dropbox/org/notes/javascript/amd_and_common.org" "/Users/FusGoethe/Dropbox/org/notes/install/ss_for_terminal.org" "/Users/FusGoethe/Dropbox/org/notes/install/shadowsocks.org" "/Users/FusGoethe/Dropbox/org/notes/install/opencv.org" "/Users/FusGoethe/Dropbox/org/notes/install/java8.org" "/Users/FusGoethe/Dropbox/org/notes/install/ghost_blog.org" "/Users/FusGoethe/Dropbox/org/notes/install/caddy_linux.org" "/Users/FusGoethe/Dropbox/org/notes/golang/snippets.org" "/Users/FusGoethe/Dropbox/org/notes/golang/runtime_Caller.org" "/Users/FusGoethe/Dropbox/org/notes/golang/quotes_in_go.org" "/Users/FusGoethe/Dropbox/org/notes/golang/https.org" "/Users/FusGoethe/Dropbox/org/notes/golang/go_io_package.org" "/Users/FusGoethe/Dropbox/org/notes/emacs/spacemacs_search.org" "/Users/FusGoethe/Dropbox/org/notes/emacs/major_and_minor_mode.org" "/Users/FusGoethe/Dropbox/org/notes/emacs/layout.org" "/Users/FusGoethe/Dropbox/org/notes/c/time_caculate.org" "/Users/FusGoethe/Dropbox/org/notes/c/snippets.org" "/Users/FusGoethe/Dropbox/org/notes/c/sem_unlink.org" "/Users/FusGoethe/Dropbox/org/notes/c/pipe.org" "/Users/FusGoethe/Dropbox/org/notes/algorithms.org")))
 '(org-fontify-done-headline t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(package-selected-packages
   (quote
    (yasnippet-snippets pippel ivy-rtags importmagic flycheck-rtags evil-cleverparens paredit counsel-css company-rtags rtags spaceline-all-the-icons pangu-spacing flycheck-ycmd company-ycmd ycmd request-deferred let-alist overseer nameless google-c-style go-tag sicp magic-latex-buffer auctex-latexmk atom-one-dark-theme doom-themes all-the-icons memoize font-lock+ dracula-theme outshine outorg company-tern protobuf-mode goenv symon realgud test-simple loc-changes load-relative password-generator org-brain impatient-mode godoctor go-rename flycheck-bashate evil-org evil-lion editorconfig cmake-ide levenshtein toml-mode racer flycheck-rust seq cargo rust-mode dash-functional org-category-capture blog-admin winum fuzzy advance-words-count company-auctex auctex names org-octopress orglue org-mac-link epic sql-indent yaml-mode pcache pug-mode insert-shebang hide-comnt go-guru company-anaconda anaconda-mode flx-ido disaster company-c-headers cmake-mode clang-format apib-mode nil-theme \(quote\ spacemacs-light\)-theme imenu-list dockerfile-mode docker tablist docker-tramp wgrep smex ivy-hydra flyspell-correct-ivy counsel-projectile counsel swiper ivy yapfify which-key uuidgen use-package py-isort ox-gfm org-projectile org org-download livid-mode skewer-mode simple-httpd live-py-mode link-hint leave-delimited json-mode json-snatcher json-reformat multiple-cursors js2-mode js-doc jade-mode intero info+ indent-guide ido-vertical-mode hy-mode htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers parent-mode highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-hoogle helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets haml-mode google-translate golden-ratio go-eldoc gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck-haskell flycheck pkg-info epl flx fish-mode fill-column-indicator eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit-popup with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu goto-chg undo-tree eval-sexp-fu highlight eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump s diminish define-word company-web web-completion-data company-statistics company-shell company-jedi jedi-core python-environment epc ctable concurrent deferred company-go go-mode company-ghci company-ghc ghc haskell-mode company-cabal company column-enforce-mode color-identifiers-mode cmm-mode clean-aindent-mode bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed dash adaptive-wrap ace-window ace-link ace-jump-helm-line avy helm-core async ac-ispell auto-complete popup quelpa package-build js2-refactor projectile helm magit git-commit color-theme-sanityinc-solarized monokai-theme spacemacs-theme spacemacs-theme-light-theme xterm-color ws-butler window-numbering web-mode web-beautify volatile-highlights vi-tilde-fringe toc-org tern tagedit string-inflection stickyfunc-enhance srefactor spaceline powerline smooth-scrolling smeargle slim-mode shm shell-pop scss-mode sass-mode restart-emacs ranger rainbow-mode rainbow-delimiters pyvenv pytest pyenv-mode pythonic f py-yapf popwin pip-requirements persp-mode pcre2el paradox hydra spinner page-break-lines orgit org-repo-todo org-present org-pomodoro alert log4e gntp org-plus-contrib org-bullets open-junk-file multi-term move-text markdown-toc markdown-mode macrostep lorem-ipsum linum-relative leuven-theme less-css-mode evil)))
 '(paradox-github-token t)
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(python-indent-guess-indent-offset nil)
 '(python-shell-completion-native-disabled-interpreters (quote ("pypy python2")))
 '(python-shell-completion-native-enable nil)
 '(python-shell-interpreter "python3")
 '(safe-local-variable-values
   (quote
    ((eval when
           (fboundp
            (quote rainbow-mode))
           (rainbow-mode 1)))))
 '(tramp-syntax (quote default) nil (tramp))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#20240E" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
