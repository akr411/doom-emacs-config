;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Anwaya Rai"
      user-mail-address "rai.anwaya@gmail.com")

;; --- UI ---
(setq doom-font (font-spec :family "Adwaita Mono" :size 16 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Adwaita Sans" :size 18))
(setq doom-theme 'doom-badger)
(setq display-line-numbers-type 'relative)
(setq evil-respect-visual-line-mode t)
(blink-cursor-mode 1)
(after! doom-modeline
  (setq doom-modeline-bar-width 0
        doom-modeline-hud nil
        doom-modeline-percent-position nil doom-modeline-modal nil))
;; --- Behavior ---
(setq auto-save-default t)

;; Magit
(after! magit
  (setq magit-diff-refine-hunk 'all))

;; --- Vim ---
(setq +evil-want-o/O-to-continue-comments nil)
(after! evil-escape
  (setq evil-escape-key-sequence "kj"))
(after! evil
  (setq evil-kill-on-visual-paste nil)
  (setq evil-echo-state nil))

;; --- Org ---
(setq org-directory "~/Documents/Notes/")
(after! org-modern
  (setq org-modern-table-vertical 1
        org-modern-table t))
(add-hook 'org-mode-hook #'hl-todo-mode)
(custom-theme-set-faces! 'doom-badger
  '(org-document-title :height 1.8 :bold t :underline nil)
  '(org-level-1 :inherit outline-1 :height 1.6)
  '(org-level-2 :inherit outline-2 :height 1.5)
  '(org-level-3 :inherit outline-3 :height 1.4)
  '(org-level-4 :inherit outline-3 :height 1.3)
  ;; Markdown
  '(markdown-header-face
    ((t (:inherit font-lock-function-name-face :weight bold :family "variable-pitch"))))
  '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.6))))
  '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.5))))
  '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.4))))
  '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.3)))))

;; --- LSP ---
(after! eglot
  (setq flymake-show-diagnostics-at-end-of-line t)
  (add-to-list 'eglot-server-programs '(go-mode . ("gopls")))
  (add-to-list 'eglot-server-programs '(java-mode . ("jdtls")))
  (setq-default eglot-workspace-configuration '((:gopls . ((gofumpt . t))))))
(after! cc-mode
  (setq clang-format-style "file"))
(after! go-mode
  (setq gofmt-command "gofumpt"))
(after! java-mode
  (setq c-basic-offset 4
        tab-width 4))
(after! js2-mode
  (setq js-indent-level 2))
(after! typescript-mode
  (setq typescript-indent-level 2))
(after! sh-script
  (setq sh-basic-offset 2
        sh-indented-commented-line-offset 2))

;; Performance optimizations
(setq gc-cons-threshold (* 256 1024 1024))
(setq read-process-output-max (* 4 1024 1024))
(setq vc-handled-backends '(Git)) ; only use git for VC
(setq native-comp-async-jobs-number 8)
(after! gcmh
  (setq gcmh-high-cons-threshold (* 256 1024 1024)))
