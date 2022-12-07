;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Brandon Yoon"
      user-mail-address "brandondyoon@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/GitHub/School/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


; Path for loading other plugins
(add-load-path! "~/.doom.d")

; Turns off the extremely annoying "Electric indent mode"
(electric-indent-mode -1)

; Enables editorconfig, which handles spaces, tabs, etc.
(editorconfig-mode 1)

; Custom EViL keybindings
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "0") 'evil-beginning-of-visual-line)

; Saves all my custom Emacs snippets in `~/.doom.d/snippets`
(setq yas-snippet-dirs (append yas-snippet-dirs
                               '("~/.doom.d/snippets"))) ;; replace with your folder for snippets

; Puts LaTeX previews at a more comfortable size
(set-default 'preview-scale-function 1.2)

; Allows AucTeX to know when to turn on certain settings (e.g. Use Biber insetad of BibTeX)
(setq TeX-parse-self t)
(setq TeX-auto-save t)
; Uses Biber automatically for BibLaTeX
(setq LaTeX-biblatex-use-Biber t)

; Views Latex PDF on right side
(setq +latex-viewers '(zathura))
(latex-preview-pane-enable)

;(use-package all-the-icons-dired)
;(use-package dired-open)
;(use-package peep-dired)

;(nvmap :states '(normal visual) :keymaps 'override :prefix "SPC"
;               "d d" '(dired :which-key "Open dired")
;               "d j" '(dired-jump :which-key "Dired jump to current")
;               "d p" '(peep-dired :which-key "Peep-dired"))

(with-eval-after-load 'dired
  ;;(define-key dired-mode-map (kbd "M-p") 'peep-dired)
  (evil-define-key 'normal dired-mode-map (kbd "h") 'dired-up-directory)
  (evil-define-key 'normal dired-mode-map (kbd "l") 'dired-find-file) ; use dired-find-file instead if not using dired-open package
  (evil-define-key 'normal peep-dired-mode-map (kbd "j") 'peep-dired-next-file)
  (evil-define-key 'normal peep-dired-mode-map (kbd "k") 'peep-dired-prev-file))

(setq-default display-fill-column-indicator-column 79)
(global-display-fill-column-indicator-mode 1)

(setq-default latex-run-command "pdflatex --enable-write18")

(setq-default yas-indent-line 'fixed)
(setq-default yas-wrap-around-region 'nil)

(map! :leader
     (:prefix-map ("d" . "dired")
      :desc "Dired"  "d" #'dired
      :desc "Ranger" "r" #'ranger))

(map! :leader
     (:prefix-map ("l" . "TeX")
      :desc "LaTeX Preview Pane Mode"   "l" #'latex-preview-pane-mode
      :desc "LaTeX Preview Pane Update" "u" #'latex-preview-pane-update
      :desc "TeX Command Master"        "m" #'TeX-command-master))

(setq default-directory "~/" )
(setq-default pdf-view-midnight-minor-mode)
(add-hook 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode)
