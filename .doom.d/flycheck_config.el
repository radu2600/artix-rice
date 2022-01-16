;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;;

(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

(setq doom-font (font-spec :family "JetBrains Mono NL" :size 18 :weight 'light)       doom-variable-pitch-font (font-spec :family "JetBrains Mono NL" :size 18 :weight 'light)
      doom-big-font (font-spec :family "JetBrains Mono NL" :size 24))
;;(setq doom-font (font-spec :family "Mononoki Nerd Font" :size 17)       doom-variable-pitch-font (font-spec :family "Mononoki Nerd Font" :size 17)       doom-big-font (font-spec :family "Mononoki Nerd Font" :size 24))

;; Instant auto completion
;;(setq company-dabbrev-downcase 0)
;;(setq company-idle-delay 0)
(setq! lsp-enable-file-watchers nil)

;; Sets relative line numbers
(setq display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)


(setq sp-highlight-pair-overlay nil)

;;Lsp configs
(setq lsp-enable-symbol-highlighting nil)
(setq lsp-enable-snippet nil)

;; Disables current line highlighting
(remove-hook 'doom-first-buffer-hook #'global-hl-line-mode)

;;Change cursor color and mode
(setq evil-insert-state-cursor '(box "purple")
      evil-normal-state-cursor '(box "white"))

;;Sets pdf-tools as default pdf previewer
(after! tex
  (setq TeX-view-program-selection nil)
  (setq +latex-viewers '(pdf-tools))
  (load! "../.emacs.d/modules/lang/latex/+viewers"))

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
