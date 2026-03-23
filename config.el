;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Anwaya Rai"
      user-mail-address "rai.anwaya@gmail.com")

;; --- UI settings ---
(setq doom-font (font-spec :family "Ioskeley Mono" :size 16 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Adwaita Sans" :size 18))
(setq doom-theme 'doom-badger)
(setq display-line-numbers-type 'relative)
(after! doom-modeline
  (setq doom-modeline-bar-width 0
        doom-modeline-hud nil
        doom-modeline-percent-position nil
        doom-modeline-modal nil))

;; --- Behavior settings ---
;; Org
(setq org-directory "~/Documents/Notes/")
(setq org-modern-table-vertical 1)
(setq org-modern-table t)
(add-hook 'org-mode-hook #'hl-todo-mode)
(custom-theme-set-faces!
  'doom-badger
  '(org-level-8 :inherit outline-3 :height 1.0)
  '(org-level-7 :inherit outline-3 :height 1.0)
  '(org-level-6 :inherit outline-3 :height 1.1)
  '(org-level-5 :inherit outline-3 :height 1.2)
  '(org-level-4 :inherit outline-3 :height 1.3)
  '(org-level-3 :inherit outline-3 :height 1.4)
  '(org-level-2 :inherit outline-2 :height 1.5)
  '(org-level-1 :inherit outline-1 :height 1.6)
  '(org-document-title :height 1.8 :bold t :underline nil))

;; Markdown
(custom-set-faces
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold ::family "variable-pitch"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.6))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.5))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.3))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.2))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.1)))))

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
        sh-basic-offset 2))
