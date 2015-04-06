(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

 (add-to-list 'package-archives
              '("melpa" . "http://melpa.milkbox.net/packages/") t)
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
    starter-kit
    starter-kit-bindings
    starter-kit-eshell
    starter-kit-js
    starter-kit-lisp
    starter-kit-ruby
    tuareg
    magit
    markdown-mode
    marmalade
    cider
    oddmuse
    yaml-mode))

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
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes (quote ("6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(region ((t (:background "white")))))
