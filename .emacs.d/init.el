(require 'package)

;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/"))

;;  (add-to-list 'package-archives
;;               '("melpa" . "http://melpa.milkbox.net/packages/") t)

 (add-to-list 'package-archives
              '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(when (null package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(coffee-mode
    clojure-mode
    clojurescript-mode
    haml-mode
    rainbow-delimiters
    ruby-mode
    scpaste
    scss-mode
   ; starter-kit
   ; starter-kit-bindings
   ; starter-kit-eshell
   ; starter-kit-js
   ; starter-kit-lisp
   ; starter-kit-ruby
    tuareg
    magit
    markdown-mode
    marmalade
    cider
    oddmuse
    yaml-mode
    org
    htmlize))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; setup OS X path
(setenv "PATH" (concat (shell-command-to-string "/bin/zsh -l -c 'echo -n $PATH'")
                       ":" (getenv "HOME") "/bin"))

;; auto follow symlinked files
(setq vc-follow-symlinks t)

;; load more config files
(setq emacs-config-dir "~/.emacs.d/")
(load (expand-file-name "bindings.el" emacs-config-dir))
(load (expand-file-name "cosmetics.el" emacs-config-dir))
(load (expand-file-name "hooks.el" emacs-config-dir))
(load (expand-file-name "workarounds.el" emacs-config-dir))
(load (expand-file-name "cmeier.el" emacs-config-dir))

;; start eshell upon starting emacs
;;(eshell)

;; graaaaaaah! eshell doesn't respect eval-after-load for some reason:
;;(with-current-buffer "*eshell*" (setq pcomplete-cycle-completions nil))
;;(set-face-foreground 'eshell-prompt "turquoise")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#839496" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#002b36"))
 '(custom-enabled-themes (quote (sanityinc-solarized-light)))
 '(custom-safe-themes
   (quote
    ("bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" default)))
 '(fci-rule-color "#073642")
 '(global-nlinum-mode t)
 '(package-selected-packages
   (quote
    (clj-refactor helm color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow twilight-theme smex scss-mode rainbow-identifiers oddmuse nlinum marmalade magit lua-mode inf-ruby ido-ubiquitous idle-highlight-mode haml-mode find-file-in-project elisp-slime-nav coffee-mode clojurescript-mode align-cljlet)))
 '(safe-local-variable-values
   (quote
    ((buffer-file-coding-system . utf-8-unix)
     (org-html-head-include-scripts)
     (org-html-head-include-default-style)
     (whitespace-line-column . 80)
     (lexical-binding . t))))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(region ((t (:background "white")))))
