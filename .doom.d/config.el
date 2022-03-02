;;Sets clang as default backend for c/c++
(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

;;Sets fonts
(setq doom-font (font-spec :family "Cascadia Mono" :size 18 :weight 'Regular)
      doom-big-font (font-spec :family "mononoki Nerd Font"  :size 21))
;;(setq doom-themes-enable-bold nil)

;;Don't ask to quit
(setq confirm-kill-emacs nil)

(setq! lsp-enable-file-watchers nil)

;; Sets relative line numbers
(setq display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;;Disable highlighting
(setq sp-highlight-pair-overlay nil)

;;Lsp configs
(setq lsp-enable-symbol-highlighting nil)
(setq lsp-enable-snippet t)

;;Enable electric mode and disable smartparens
(electric-pair-mode 1)
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)
(remove-hook 'doom-first-buffer-hook #'show-paren-mode)

;; Disables current line highlighting
(remove-hook 'doom-first-buffer-hook #'global-hl-line-mode)

;;Change cursor color and mode
;;(setq evil-insert-state-cursor '(box ))
      ;;evil-normal-state-cursor '(box "grey"))

;;Sets pdf-tools as default pdf previewer
(after! tex
  (setq TeX-view-program-selection nil)
  (setq +latex-viewers '(pdf-tools))
  (load! "../.emacs.d/modules/lang/latex/+viewers"))

;;Change autocompletion bindings and delay settings
(use-package! company
  ;;:after lsp-mode
  ;;:hook (lsp-mode . company-mode)
  ;;:bind (:map company-active-map
  ;;       ("<tab>" . company-complete-selection))
  ;;      (:map lsp-mode-map
  ;;       ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 2)
  (company-idle-delay 0.1))

;;Org-mode bullets
(after! org
  (setq org-ellipsis " ▼ "
        org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆")
        org-superstar-item-bullet-alist '((?+ . ?➤) (?- . ?✦)) ; changes +/- symbols in item lists
        )
  )
(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.4))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.3))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
)

;;Cursor blinking
(blink-cursor-mode t)

;;Comint
(map! :leader
      :desc "Run comint mode"
      "c z" #'comint-run)

;;Compile snippets
(add-hook 'c++-mode-hook
  (lambda ()
    (unless (file-exists-p "Makefile")
      (set (make-local-variable 'compile-command)
       (let ((file (file-name-nondirectory buffer-file-name)))
         (concat "g++ -Wextra -Wall -o "
             (file-name-sans-extension file)
             " " file))))))

(add-hook 'c-mode-hook
  (lambda ()
    (unless (file-exists-p "Makefile")
      (set (make-local-variable 'compile-command)
       (let ((file (file-name-nondirectory buffer-file-name)))
         (concat "gcc -Wall -o "
             (file-name-sans-extension file)
             " " file))))))

(add-hook 'java-mode-hook
  (lambda ()
    (unless (file-exists-p "Makefile")
      (set (make-local-variable 'compile-command)
       (let ((file (file-name-nondirectory buffer-file-name)))
         (concat "java "
              file))))))

(add-hook 'python-mode-hook
  (lambda ()
    (unless (file-exists-p "Makefile")
      (set (make-local-variable 'compile-command)
       (let ((file (file-name-nondirectory buffer-file-name)))
         (concat "python "
              file))))))


;;Theme
(setq doom-theme 'doom-1337)

;;ELFEED setup
(use-package! elfeed-goodies)
(elfeed-goodies/setup)
(setq elfeed-goodies/entry-pane-size 0.5)
(add-hook 'elfeed-show-mode-hook 'visual-line-mode)
(evil-define-key 'normal elfeed-show-mode-map
  (kbd "J") 'elfeed-goodies/split-show-next
  (kbd "K") 'elfeed-goodies/split-show-prev)
(evil-define-key 'normal elfeed-search-mode-map
  (kbd "J") 'elfeed-goodies/split-show-next
  (kbd "K") 'elfeed-goodies/split-show-prev)
(setq elfeed-feeds (quote
                    (("https://www.reddit.com/r/linux.rss" reddit linux)
                     ("https://opensource.com/feed" opensource linux)
                     ("https://linux.softpedia.com/backend.xml" softpedia linux)
                     ("https://itsfoss.com/feed/" itsfoss linux)
                     ("https://www.reddit.com/r/news.rss" reddit news)
                     ("https://www.reddit.com/r/worldnews.rss" reddit news)
                     ("https://distrowatch.com/news/dwd.xml" distrowatch linux))))
(add-hook! 'elfeed-search-mode-hook 'elfeed-update)
(setq browse-url-browser-function 'eww-browse-url)

;;Dashboard
(use-package dashboard
  :init      ;; tweak dashboard config before loading it
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "\nKEYBINDINGS:\
\nFind file               (SPC .)     \
Open buffer list    (SPC b i)\
\nFind recent files       (SPC f r)   \
Open the eshell     (SPC e s)\
\nOpen dired file manager (SPC d d)   \
List of keybindings (SPC h b b)")
  ;;(setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
  (setq dashboard-startup-banner "~/.doom.d/doom-emacs-dash.png")  ;; use custom image as banner
  (setq dashboard-center-content nil) ;; set to 't' for centered content
  (setq dashboard-items '((recents . 5)
                          (agenda . 5 )
                          (bookmarks . 5)
                          (projects . 5)
                          (registers . 5)))
  :config
  (dashboard-setup-startup-hook)
  (dashboard-modify-heading-icons '((recents . "file-text")
                                    (bookmarks . "book"))))

;;Rainbow mode
(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))
(global-rainbow-mode 1 )

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;;Dired
(map! :leader
      (:prefix ("d" . "dired")
       :desc "Open dired" "d" #'dired
       :desc "Dired jump to current" "j" #'dired-jump)
      (:after dired
       (:map dired-mode-map
        :desc "Peep-dired image previews" "d p" #'peep-dired
        :desc "Dired view file" "d v" #'dired-view-file)))
