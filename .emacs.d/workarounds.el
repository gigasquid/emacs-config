;; come on guys; autoloads are not rocket science
(autoload 'marmalade-upload-buffer "marmalade" nil t)

(autoload 'markdown-mode "markdown-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

(autoload 'yaml-mode "yaml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; do not compile scss files on save
(setq scss-compile-at-save nil)
