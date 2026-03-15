;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Anwaya Rai"
      user-mail-address "rai.anwaya@gmail.com")

;; --- Font settings ---
(setq doom-font (font-spec :family "SF Mono" :size 13 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "SF Compact" :size 13)
      doom-big-font (font-spec :family "SF Compact" :size 24)
      doom-serif-font (font-spec :familly "SF Compact" :size 13))

;; --- Theme settings ---
(setq doom-theme 'modus-operandi)
(after! modus-themes
  (setq modus-themes-common-palette-overrides
        '((fringe bg-main)
          (bg-mode-line-active bg-blue-subtle)
          (bg-line-number-active bg-blue-subtle)))
  (custom-set-faces!
    '(fringe :background nil))
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs t
        modus-themes-mixed-fonts t
        modus-themes-variable-pitch-ui nil))
(custom-set-faces!
  `(doom-modeline-bar :background ,(face-background 'mode-line))
  `(doom-modeline-bar-inactive :background ,(face-background 'mode-line-inactive)))

;; --- UI settings ---
(setq display-line-numbers-type 'relative)
;; Better scrolling
(pixel-scroll-precision-mode 1)
(setq org-directory "/Users/akr411/Documents/Notes/Org")
;; Customize titlebar text
(setq frame-title-format '(:eval (format "%s - %s" (projectile-project-name) (buffer-name))))
;; Custom splashscreen image
(after! doom-dashboard
  (setq fancy-splash-image (concat doom-user-dir "/assets/splash.png")))

;; --- Vim settings ---
;; Exit insert mode pressing k and j quickly
(with-eval-after-load 'evil-escape
  (setq evil-escape-key-sequence "kj")
  (setq evil-escape-delay 0.2))
;; Don't replace on visual paste
(setq evil-kill-on-visual-paste nil)
;; Disable ALL comment continuation
(remove-hook 'doom-first-buffer-hook
             #'+default--newline-indent-and-continue-comments-a)
(setq +evil-want-o/O-to-continue-comments nil)

;; --- Language settings ---
(setq read-process-output-max    (* 1024 1024))
;; --- Formatting
(after! apheleia
  (setf (alist-get 'go-mode   apheleia-mode-alist) 'gofumpt)
  (setf (alist-get 'go-ts-mode apheleia-mode-alist) 'gofumpt))
;; --- Eglot
(after! eglot
  ;; Performance
  (setq eglot-sync-connect         1)
  (setq eglot-autoshutdown         t)
  (setq eglot-extend-to-xref       t)
  (setq-default
   eglot-workspace-configuration
   '(:gopls
     ( :usePlaceholders t
                        :gofumpt t
                        :staticcheck t
                        :analyses (:shadow t
                                   :unusedparams t
                                   :unusedwrite t
                                   :useany t
                                   :unusedvariable t)
                        :codelenses ( :gc_details t
                                                  :test t)))))

;; --- Dape
(after! dape
  (setq dape-buffer-window-arrangement 'gud)
  (add-to-list 'dape-configs
               `(dlv-test
                 modes (go-mode go-ts-mode)
                 command "dlv"
                 command-args ("dap" "--listen" "127.0.0.1::autoport")
                 :type "go"
                 :request "launch"
                 :mode "test"
                 :program ".")))
