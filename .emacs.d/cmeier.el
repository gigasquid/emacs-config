;;Custom configuration

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path (concat dotfiles-dir "/misc"))

(require 'project-grep)
(require 'ruby-test)
(global-set-key (kbd "C-c tf") 'ruby-test-file)
(global-set-key (kbd "C-c tm") 'ruby-test-function)
(global-set-key (kbd "C-c s") 'project-grep)

;; Color Theme

(add-to-list 'load-path (concat dotfiles-dir "/color-theme"))
(require 'color-theme)

(add-to-list 'load-path (concat dotfiles-dir "/emacs-color-theme-solarized"))
(require 'color-theme-solarized)

(require 'color-theme-github)
(require 'colman)
(require 'color-theme-day)
(require 'color-theme-night)

(defun ct-github ()
  "Select the github theme."
  (interactive)
  (require 'color-theme-github)
  (color-theme-github))

(defun ct-day ()
  "Select the basic light theme."
  (interactive)
  (require 'color-theme-day)
  (color-theme-day))

(defun ct-night ()
  "Select the basic dark theme."
  (interactive)
  (require 'color-theme-night)
  (color-theme-night))

(color-theme-night)


;;Ag
(require 'ag)

;; I like to bind the *-at-point commands to F5 and F6:

(global-set-key (kbd "<f5>") 'ag-project-at-point)
(global-set-key (kbd "<f6>") 'ag-regexp-project-at-point)



;;trailing white space
(setq-default show-trailing-whitespace t)

;;auto refresh buffer
(global-auto-revert-mode t)

;; visible bell
(setq visible-bell nil)
;; allow selection deletion
(delete-selection-mode t)
;; make sure delete key is delete key
(global-set-key [delete] 'delete-char)
;; turn on the menu bar
(menu-bar-mode 1)

(defun my-zoom (n)
"Increase or decrease font size based upon argument"
(set-face-attribute 'default (selected-frame) :height
(+ (face-attribute 'default :height) (* (if (> n 0) 1 -1) 10))))
(global-set-key (kbd "C-c C-+")      '(lambda nil (interactive) (my-zoom 1)))
;(global-set-key [C-kp-add]       '(lambda nil (interactive) (my-zoom 1)))
(global-set-key (kbd "C-c C--")      '(lambda nil (interactive) (my-zoom -1)))
;(global-set-key [C-kp-subtract]  '(lambda nil (interactive) (my-zoom -1)))
(message "All done!")

;;lisp indent
;(setq lisp-indent-offset 2)

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


;(remove-hook 'prog-mode-hook 'esk-turn-on-idle-highlight-mode)
;(remove-hook 'prog-mode-hook 'esk-pretty-lambdas)
(remove-hook 'ruby-mode-hook 'esk-paredit-nonlisp)

(global-set-key (kbd "C-z") 'scroll-down) ; I *hate* suspend bound on
                                ; this key



;; coffeescript
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Allow input to be sent to somewhere other than inferior-lisp
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This is a total hack: we're hardcoding the name of the shell buffer
(defun shell-send-input (input)
  "Send INPUT into the *shell* buffer and leave it visible."
  (save-selected-window
    (switch-to-buffer-other-window "*shell*")
    (goto-char (point-max))
    (insert input)
    (comint-send-input)))

(defun defun-at-point ()
  "Return the text of the defun at point."
  (apply #'buffer-substring-no-properties
         (region-for-defun-at-point)))

(defun region-for-defun-at-point ()
  "Return the start and end position of defun at point."
  (save-excursion
    (save-match-data
      (end-of-defun)
      (let ((end (point)))
        (beginning-of-defun)
        (list (point) end)))))

(defun expression-preceding-point ()
  "Return the expression preceding point as a string."
  (buffer-substring-no-properties
   (save-excursion (backward-sexp) (point))
   (point)))

(defun shell-eval-last-expression ()
  "Send the expression preceding point to the *shell* buffer."
  (interactive)
  (shell-send-input (expression-preceding-point)))

(defun shell-eval-defun ()
  "Send the current toplevel expression to the *shell* buffer."
  (interactive)
  (shell-send-input (defun-at-point)))

(add-hook 'clojure-mode-hook
          '(lambda ()
             (define-key clojure-mode-map (kbd "C-c e") 'shell-eval-last-expression)
             (define-key clojure-mode-map (kbd "C-c x") 'shell-eval-defun)))

;; nrepl
(add-hook 'nrepl-interaction-mode-hook
  'nrepl-turn-on-eldoc-mode)

(setq nrepl-popup-stacktraces nil)

(add-to-list 'same-window-buffer-names "*nrepl*")


;;; org-mode
;; The following lines are always needed.  Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


;; tempo
(require 'tempo)
(setq tempo-interactive t)

;;yasnippet
(yas-global-mode 1)
