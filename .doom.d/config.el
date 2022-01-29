;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;;

;;Sets clang as default backed for c/c++
(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

;;Sets fonts
(setq doom-font (font-spec :family "DejaVu Sans Mono" :size 18 :weight 'Regular)
      doom-big-font (font-spec :family "mononoki Nerd Font"  :size 21))

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
(setq lsp-enable-snippet nil)

;;Enable electric mode and disable smartparens
(electric-pair-mode 1)
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)
(remove-hook 'doom-first-buffer-hook #'show-paren-mode)

;; Disables current line highlighting
(remove-hook 'doom-first-buffer-hook #'global-hl-line-mode)

;;Change cursor color and mode
(setq evil-insert-state-cursor '(box "purple"))
      ;;evil-normal-state-cursor '(box "grey"))

;;Sets pdf-tools as default pdf previewer
(after! tex
  (setq TeX-view-program-selection nil)
  (setq +latex-viewers '(pdf-tools))
  (load! "../.emacs.d/modules/lang/latex/+viewers"))

;;Change autocompletion bindings and delay settings
(use-package! company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
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

;;Comint
(map! :leader
      :desc "Run comint mode"
      "c b" #'comint-run)

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)
;;(setq doom-theme 'doom-palenight)
;;(setq doom-theme 'doom-challenger-deep)
;;(require 'gruber-darker-theme)
;;(load-theme 'gruber-darker t)
;;(setq doom-theme 'doom-vibrant)
;;(setq doom-theme 'doom-dracula)
(setq doom-theme 'doom-ir-black)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
