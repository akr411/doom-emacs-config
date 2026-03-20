;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Anwaya Rai"
      user-mail-address "rai.anwaya@gmail.com")

;; --- UI settings ---
(setq doom-font (font-spec :family "IBM Plex Mono" :size 16 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "IBM Plex Sans" :size 18))
(setq doom-theme 'doom-badger)
(setq display-line-numbers-type 'relative)
(after! doom-modeline
  (setq doom-modeline-bar-width 0
        doom-modeline-hud nil
        doom-modeline-percent-position nil
        doom-modeline-modal nil))

;; --- Behavior settings ---
(setq org-directory "~/Documents/Notes/")
(after! magit
  (setq magit-diff-refine-hunk 'all))
(after! eglot
  (setq flymake-show-diagnostics-at-end-of-line t))

;; --- Vim settings ---
(setq +evil-want-o/O-to-continue-comments nil)
(after! evil-escape
  (setq evil-escape-key-sequence "kj"))
(after! evil
  (setq evil-kill-on-visual-paste nil)
  (setq evil-echo-state nil))

;; --- Language settings ---
(after! cc-mode
  (setq clang-format-style "file"))
(after! go-mode
  (setq gofmt-command "gofumpt"))
(after! eglot
  (add-to-list 'eglot-server-programs
               '(go-mode . ("gopls")))
  (setq-default eglot-workspace-configuration
                '((:gopls . ((gofumpt . t))))))
(after! js2-mode
  (setq js-indent-level 2))
(after! typescript-mode
  (setq typescript-indent-level 2))
(after! sh-script
  (setq sh-basic-offset 2
        sh-indentation 2))
