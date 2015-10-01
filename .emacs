(setenv "PATH" (getenv "PATH"))

;; MELPA
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (package-initialize)
  )

(setq backup-directory-alist
  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
  `((".*" ,temporary-file-directory t)))

(load-theme 'leuven t)
(set-background-color "WhiteSmoke")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "unknown" :family "Fira Mono"))))
 '(bold ((t (:foreground "white" :weight bold))))
 '(bold-italic ((t (:foreground "white" :slant italic :weight bold))))
 '(completions-first-difference ((t (:inherit bold :foreground "white"))))
 '(css-selector ((t (:foreground "deep sky blue" :weight bold))))
 '(custom-comment-tag ((t (:foreground "deep sky blue"))))
 '(custom-link ((t (:foreground "deep sky blue" :underline t))))
 '(font-lock-function-name-face ((t (:foreground "deep sky blue" :weight normal))))
 '(font-lock-keyword-face ((t (:foreground "deep sky blue" :weight normal))))
 '(font-lock-type-face ((t (:foreground "medium orchid" :weight normal))))
 '(info-menu-star ((t (:foreground "white"))))
 '(italic ((t (:foreground "white" :slant italic))))
 '(nobreak-space ((t (:background "gray10"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "cyan"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "royal blue"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "dark violet"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "brown"))))
 '(speedbar-directory-face ((t (:foreground "deep sky blue")))))

;; Coq
(load "/usr/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el")
(global-set-key (kbd "C-c <C-right>") (kbd "C-c <C-return>"))
(global-set-key (kbd "C-c <C-down>") (kbd "C-c C-n"))
(global-set-key (kbd "C-c <C-up>") (kbd "C-c C-u"))

;; Haskell
(require 'haskell-mode)
(require 'haskell-process)
(require 'bind-key)
(bind-key "C-`"     'haskell-interactive-bring     haskell-mode-map)
(bind-key "SPC"     'haskell-mode-contextual-space haskell-mode-map)
(bind-key "C-c C-?" 'haskell-mode-find-uses        haskell-mode-map)
(bind-key "C-c C-t" 'haskell-mode-show-type-at     haskell-mode-map)
(bind-key "C-c C-l" 'haskell-process-load-file     haskell-mode-map)
(bind-key "C-c C-i" 'haskell-process-do-info       haskell-mode-map)
(setq
 haskell-align-imports-pad-after-name        t
 haskell-font-lock-symbols                   t
 haskell-process-args-cabal-repl             '("--ghc-option=-ferror-spans")
 haskell-process-auto-import-loaded-modules  t
 haskell-process-log                         t
 haskell-process-path-ghci                   "ghci-ng"
;; haskell-process-suggest-hoogle-imports      t
;; haskell-process-suggest-remove-import-lines t
 haskell-process-type                        'cabal-repl
 haskell-stylish-on-save                     nil
 )
(require 'speedbar)
(speedbar-add-supported-extension ".hs")
;;(speedbar 1)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

;; No toolbar
(tool-bar-mode -1)

;; Turn on rainbow-delimiters whenever entering a programming mode
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Ctrl-Enter smart completion
(global-set-key (kbd "<C-return>") 'dabbrev-expand)

;; Stop jumping around when I scroll
(setq scroll-step 1
      scroll-conservatively 10000)

;; Never use tabs
(setq-default indent-tabs-mode nil)

;; Delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

