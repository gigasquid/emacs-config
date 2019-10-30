;;Custom configuration

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path (concat dotfiles-dir "/misc"))

(menu-bar-mode -1)
(tool-bar-mode -1)


;;Ag
(require 'ag)

;; I like to bind the *-at-point commands to F5 and F6:

(global-set-key (kbd "<f5>") 'ag-project-at-point)
(global-set-key (kbd "<f6>") 'ag-regexp-project-at-point)


;; no backup files
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files


;;Trailing white space
(setq-default show-trailing-whitespace t)

;;auto refresh buffer
(global-auto-revert-mode t)

;;omg disable autofill
(auto-fill-mode -1)
(remove-hook 'text-mode-hook #'turn-on-auto-fill)

;; visible bell
(setq visible-bell nil)
;; allow selection deletion
(delete-selection-mode t)
;; make sure delete key is delete key
(global-set-key [delete] 'delete-char)
;; turn on the menu bar
(menu-bar-mode 1)

(defun my-zoom (n)
  "Increase or decrease font size based upon argument N."
(set-face-attribute 'default (selected-frame) :height
(+ (face-attribute 'default :height) (* (if (> n 0) 1 -1) 10))))
(global-set-key (kbd "C-c C-+")      '(lambda nil (interactive) (my-zoom 1)))
;(global-set-key [C-kp-add]       '(lambda nil (interactive) (my-zoom 1)))
(global-set-key (kbd "C-c C--")      '(lambda nil (interactive) (my-zoom -1)))
;(global-set-key [C-kp-subtract]  '(lambda nil (interactive) (my-zoom -1)))
(message "All done!")

;;turn off the auto fill mode
(setq auto-fill-mode nil)
(auto-fill-mode nil)

;;turn off save session  mode
(desktop-save-mode nil)

;;handy kill buffer functions

(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))


(global-set-key (kbd "C-z") 'scroll-down) ; I *hate* suspend bound on
                                ; this key

;; ;; nrepl

(add-hook 'cider-mode-hook #'eldoc-mode)
(setq cider-repl-result-prefix ";; => ")

(add-hook 'cider-repl-mode-hook #'paredit-mode)
(setq cider-font-lock-dynamically '(macro core function var))
(add-hook 'clojure-mode-hook #'paredit-mode)


;; turn off bell altogeter
(setq ring-bell-function 'ignore)


;; rainbow delimiters
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;;(global-rainbow-delimiters-mode)

;; windmove

(global-set-key (kbd "C-c <Left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)


;; OSX stuff
(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])
(define-key input-decode-map "\e[1;5C" [C-right])
(define-key input-decode-map "\e[1;5D" [C-left])

(menu-bar-mode -1)


(setq global-nlinum-mode 1)

(require 'paren)
(setq show-paren-style 'parenthesis)
(setq show-paren-mode 1)
(setq paredit-mode 1)

;(require 'helm)

(set-face-attribute 'default nil :height 160)

(defun cider-repl-prompt-show-aws (namespace)
  "Return a prompt with aws profile prefix"
  (concat "AWS_PROFILE=" (getenv "AWS_PROFILE") " " (cider-repl-prompt-abbreviated namespace)))
(setq cider-repl-prompt-function 'cider-repl-prompt-show-aws)

;;; clj-kondo

(require 'flycheck-clj-kondo)
(global-flycheck-mode 1)


;;; clj-refactor

(require 'clj-refactor)

(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)


;;; autocompletion

(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

;;; which key
(add-to-list 'load-path "path/to/which-key.el")
(require 'which-key)
(which-key-mode)

