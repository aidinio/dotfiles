(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq inhibit-startup-message t)

(use-package exec-path-from-shell :straight t)

(use-package haskell-mode :straight t)

(define-key input-decode-map [?\C-m] [C-m])
(global-unset-key (kbd "M-j"))
(global-set-key (kbd "M-j") 'join-line)
(global-set-key (kbd "M-RET") 'default-indent-new-line)
(global-set-key (kbd "C-x <C-m>") 'execute-extended-command)
(global-set-key (kbd "C-x p /") 'consult-ripgrep)
(global-set-key (kbd "C-x M-f") 'consult-fd)
(global-set-key (kbd "C-x p b") 'consult-project-buffer)
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-c"))

(use-package embark-consult :straight t)
(setq-default message-log-max :error)

(setq initial-major-mode 'emacs-lisp-mode)
(setq switch-to-buffer-obey-display-actions t)

(use-package mode-local
  :straight t)

(setq-default warning-minimum-level :error)
(setq make-backup-files nil
      auto-save-default nil
      auto-save-list-file-prefix nil
      create-lockfiles nil)

(use-package avy
  :straight t
  :demand t
  :config (avy-setup-default)
  :bind ("C-;" . avy-goto-word-1)
  ("C-'" . avy-goto-char-in-line)
  ("<C-m> C-c" . avy-goto-char-2)
  ("<C-m> C-l" . avy-goto-line)
  ("<C-m> C-w" . avy-goto-word-1)
  ("<C-m> <C-m>" . avy-goto-word-1)
  (:map isearch-mode-map
        ("C-;" . avy-isearch)))

(use-package ace-window
  :straight t
  :demand t
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
        aw-dispatch-always t)
  :bind
  ("C-x o" . other-window)
  ("M-o" . ace-window))

(tab-bar-mode 1)

(pixel-scroll-precision-mode 1)
(setq scroll-preserve-screen-position 1
      scroll-conservatively 101)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      create-lockfiles nil)

(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font 13" :weight 'medium)
(use-package all-the-icons :straight t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 0)
(menu-bar-mode -1)
(hl-line-mode 1)

(setq undo-limit 10000000 ; 10MB
      undo-strong-limit 15000000) ; 15MB
(column-number-mode 1)
(add-hook 'prog-mode-hook (lambda () (display-line-numbers-mode 1)))
(setq warning-minimum-level :error)

(use-package doom-modeline
  :straight t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15))
  :config
  (setq doom-modeline-height 20
		doom-modeline-bar-width 7
		doom-modeline-indent-info t
		doom-modeline-hud 1
		doom-modeline-buffer-file-name-style 'truncate-nil
		doom-modeline-icon t
		doom-modeline-major-mode-icon t
		doom-modeline-buffer-state-icon t
		doom-modeline-buffer-name t)
  (set-face-attribute 'doom-modeline-bar nil :background "#b8bb26")
  (set-face-attribute 'doom-modeline-bar-inactive nil :background "#a89984"))

(use-package helpful
  :straight t
  :bind
  ("C-h f" . helpful-callable)
  ("C-h v" . helpful-variable)
  ("C-h k" . helpful-key)
  ("C-h x" . helpful-command))

(use-package consult
  :straight t
  :demand t
  :bind
  ("<C-m> C-i" . consult-imenu)
  ("<C-m> C-s" . consult-line)
  ("M-y" . yank-pop)
  ("M-g g" . consult-goto-line)
  ("M-g M-g" . consult-goto-line)
  ("<C-m> C-d" . consult-mark)
  ("M-g M-m" . consult-mark))

(use-package orderless
  :straight t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package embark
  :straight t
  :demand t
  :bind
  (:map minibuffer-mode-map
        ("C-." . embark-act))
  :config
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult :straight t)

(use-package marginalia
  :straight t
  :init
  (marginalia-mode))

(use-package vertico
  :straight t
  :demand t
  :bind (:map vertico-map
              ("C-n" . vertico-next)
              ("C-p" . vertico-previous))
  :config
  (setq vertico-cycle t)
  :init
  (vertico-mode))

(use-package marginalia
  :straight t)

(setq-default tab-width 4)
(indent-tabs-mode -1)

;; (use-package org-modern-indent
  ;; :straight (org-modern-indent :type git :host github :repo "jdtsmith/org-modern-indent")
  ;; :config ; add late to hook
  ;; (add-hook 'org-mode-hook #'org-modern-indent-mode 90))

(use-package org
  :straight t
  ;; :hook
  ;; (org-mode . org-modern-mode)
  :config
  (setq
   org-startup-indented t
   org-return-follows-link t
   org-hide-emphasis-markers t
   org-insert-heading-respect-content t
   org-src-tab-acts-natively nil
   org-adapt-indentation t
  ;;  org-hide-leading-stars t
   )
  (set-face-attribute 'org-default nil :family "SF Pro Display" :height 190 :weight 'heavy)
  (set-face-attribute 'org-inline-src-block nil :family "JetBrainsMono Nerd Font")
  (set-face-attribute 'org-block nil :family "JetBrainsMono Nerd Font")
  (set-face-attribute 'org-code nil :family "JetbrainsMono Nerd Font")
  (set-face-attribute 'org-level-1 nil :height 1.0 :weight 'bold)
  (set-face-attribute 'org-level-2 nil :height 1.0 :weight 'bold)
  (set-face-attribute 'org-level-3 nil :height 1.0 :weight 'bold)
  (set-face-attribute 'org-level-4 nil :height 1.0 :weight 'bold)
  (set-face-attribute 'org-level-5 nil :height 1.0 :weight 'bold)
  (set-face-attribute 'org-level-6 nil :height 1.0 :weight 'bold)
  (set-face-attribute 'variable-pitch nil :family "SF Pro Display")
  ;; (set-face-attribute 'org-hide nil :height 1)
  (setq exec-path (append exec-path '("/usr/bin/tex") '("/usr/bin/latex") '("/usr/bin/dvipng") '("/usr/bin/pdflatex")))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((plantuml . t)
     (latex . t)))
  )


(use-package org-modern
  :straight t
  :config
  (setq
   ;; Edit settings
   org-auto-align-tags nil
   org-tags-column 0
   org-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t
   org-modern-star 'replace
   ;; Org styling, hide markup etc.
   org-hide-emphasis-markers t
   org-pretty-entities t
   org-agenda-tags-column 0
   org-ellipsis "…"))

(use-package plantuml-mode
  :straight t
  :config
  (setq plantuml-jar-path "~/.emacs.d/plantuml.jar"
        plantuml-default-exec-mode 'jar
        org-plantuml-jar-path "~/.emacs.d/plantuml.jar")
  (add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
  (add-to-list
   'org-src-lang-modes '("plantuml" . plantuml)))

;; (use-package corfu
;;   ;; TAB-and-Go customizations
;;   :straight t
;;   :custom
;;   (corfu-cycle t)           ;; Enable cycling for `corfu-next/previous'
;;   (corfu-preselect 'prompt) ;; Always preselect the prompt

;;   ;; Use TAB for cycling, default is `corfu-complete'.
;;   :bind
;;   (:map corfu-map
;;         ("TAB" . corfu-next)
;;         ([tab] . corfu-next)
;;         ("S-TAB" . corfu-previous)
;;         ([backtab] . corfu-previous))

;;   :init
;;   (global-corfu-mode)
;;   :config
;;   (setq corfu-auto t
;;         corfu-auto-delay 0
;;         corfu-auto-prefix 1))

(use-package hl-todo :straight t)

(use-package nerd-icons
  :straight t)

;; (use-package nerd-icons-corfu
;;   :straight t
;;   :config
;;   (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

;; Remember to add an entry for `t', the library uses that as default.

;; The Custom interface is also supported for tuning the variable above.

(visual-line-mode 1)

(use-package magit
  :straight t
  :bind
  ("C-x g" . magit-status))

(use-package rjsx-mode
  :straight t)

(use-package emmet-mode :straight t)

(use-package popper
  :straight t
  :bind
  ("C-x C-' f" . popper-cycle)
  ("C-x C-' b" . popper-cycle-backwards)
  ("C-,"  . popper-toggle)
  ("C-x C-' t" . popper-toggle-type)
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "\\*Help\\*"
          "\\*Occur\\*"
          "\\*Embark \\(Export\\|Collect\\):.*\\*"
          "\\*eldoc for\\*$"
          "Output\\*$"
          "\\*Backtrace\\*"
          "\\*Async Shell Command\\*"
          help-mode
          compilation-mode
          comint-mode
          vterm-mode
          helpful-mode
          inferior-emacs-lisp-mode
          term-mode
          eshell-mode))
  (popper-mode +1)
  (popper-echo-mode +1))

(use-package vterm
  :straight t
  :bind
  ("C-x T" . vterm-other-window))

(use-package lsp-ui
  :straight t
  :custom
  (lsp-ui-doc-position 'bottom))

(which-key-mode 1)

(use-package lsp-mode
  :straight t
  :commands (lsp lsp-deferred)
  :hook
  (lsp-mode . lsp-ui-mode)
  (jtsx-tsx-mode . lsp-mode)
  (jtsx-jsx-mode . lsp-mode)
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))

(use-package rainbow-delimiters
  :straight t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package catppuccin-theme
  :straight t
  :config
  (load-theme 'catppuccin t))

;; (global-set-key (kbd "C-j") 'left-char)
;; (global-set-key (kbd "C-;") 'right-char)
;; (global-set-key (kbd "C-l") 'previous-line)
;; (global-set-key (kbd "C-k") 'next-line)
;; (global-set-key (kbd "M-;") 'right-word)
;; (global-set-key (kbd "M-j") 'left-word)
;; (global-set-key (kbd "M-l") 'previous-line)
;; (global-set-key (kbd "M-k") 'next-line)

(defconst jetbrains-ligature-mode--ligatures
  '("-->" "//" "/**" "/*" "
*/" "<!--" ":=" "->>" "<<-" "->" "<-"
"<=>" "==" "!=" "<=" ">=" "=:=" "!==" "&&" "||" "..." ".."
"|||" "///" "&&&" "===" "++" "--" "=>" "|>" "<|" "||>" "<||"
"|||>" "<|||" ">>" "<<" "::=" "|]" "[|" "{|" "|}"
"[<" ">]" ":?>" ":?" "/=" "[||]" "!!" "?:" "?." "::"
"+++" "??" "###" "##" ":::" "####" ".?" "?=" "=!=" "<|>"
"<:" ":<" ":>" ">:" "<>" ";;" "/==" ".=" ".-" "__"
"=/=" "<-<" "<<<" ">>>" "<=<" "<<=" "<==" "<==>" "==>" "=>>"
">=>" ">>=" ">>-" ">-" "<~>" "-<" "-<<" "=<<" "---" "<-|"
"<=|" "/\\" "\\/" "|=>" "|~>" "<~~" "<~" "~~" "~~>" "~>"

"<$>" "<$" "$>" "<+>" "<+" "+>" "<*>" "<*" "*>" "</>" "</" "/>"
"<->" "..<" "~=" "~-" "-~" "~@" "^=" "-|" "_|_" "|-" "||-"
"|=" "||=" "#{" "#[" "]#" "#(" "#?" "#_" "#_(" "#:" "#!" "#="
"&="))

(sort jetbrains-ligature-mode--ligatures (lambda (x y) (> (length x) (length y))))

(dolist (pat jetbrains-ligature-mode--ligatures)
  (set-char-table-range composition-function-table
						(aref pat 0)
						(nconc (char-table-range composition-function-table (aref pat 0))
                               (list (vector (regexp-quote pat)
											 0
											 'compose-gstring-for-graphic)))))

(use-package lua-mode :straight t)
(use-package format-all :straight t)

;;;;
;;;;;;;;;;;
;; (use-package yasnippet-snippets :straight t)
(use-package company :straight t
  :bind (:map company-mode-map
			  ("C-." . company-complete)))
(add-hook 'after-init-hook 'global-company-mode)

;; (use-package typescript-mode :straight t)
;; (use-package web-mode :straight t)
;; (use-package tsx-mode :straight t)
;; (straight-use-package '(tsx-mode :type git :host github :repo "orzechowskid/tsx-mode.el"))
;; (use-package css-in-js :straight t)
(use-package jtsx
  :straight t
  :mode (("\\.ts\\'"  . jtsx-tsx-mode)
		 ("\\.tsx\\'" . jtsx-tsx-mode)))
(use-package real-auto-save
  :straight t
  :hook (fundamental-mode . real-auto-save-mode)
  :init
  (setq real-auto-save-interval 0.3))

(use-package smartparens
  :straight t
  :hook (prog-mode . smartparens-mode))

(use-package flymake-eslint
  :straight t
  :config
  (setq flymake-eslint-prefer-json-diagnostics t))

(defun use-local-eslint ()
  "Set project's `node_modules' binary eslint as first priority.
    If nothing is found, keep the default value flymake-eslint set or
    your override of `flymake-eslint-executable-name.'"
  (interactive)
  (let* ((root (locate-dominating-file (buffer-file-name) "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/.bin/eslint"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flymake-eslint-executable-name eslint)
      (message (format "Found local ESLINT! Setting: %s" eslint))
      (flymake-eslint-enable))))

(defun configure-eslint-with-flymake ()
  (when (or (eq major-mode 'tsx-ts-mode)
			(eq major-mode 'typescript-ts-mode)
			(eq major-mode 'typescriptreact-mode))
    (use-local-eslint)))

(add-hook 'jtsx-tsx-mode-hook #'use-local-eslint)

;; With older projects without LSP or if eglot fails
;; you can call interactivelly M-x lemacs/use-local-eslint RET
;; or add a hook like:
;; (add-hook 'js-ts-mode-hook #'use-local-eslint))

(use-package pdf-tools
  :straight t
  :config
  (auto-revert-mode 1)
  (setq auto-revert-verbose nil
        pdf-view-use-scaling t))

(use-package auctex
  :straight t)

(use-package doom-themes
  :straight t)

(use-package rust-mode
  :straight t)
(use-package csv-mode
  :straight t)

(use-package leetcode
  :straight t
  :config
  (setq leetcode-prefer-language "python3"
		leetcode-save-solutions t
		leetcode-directory "~/prg/emacs-leetcode"))

(use-package vundo
  :straight t
  :bind
  ("C-x u" . vundo))

(global-set-key (kbd "C-x C-. e")
				'(lambda () (interactive) (find-file "~/.emacs.d/init.el")))

(defun exwm-launch-app (command)
  (interactive (list (read-shell-command "$ ")))
  (start-process-shell-command command nil command))

(use-package exwm
  :straight t
  :config
  (setq exwm-workspace-number 4)
  ;; Make class name the buffer name.
  (add-hook 'exwm-update-class-hook
			(lambda () (exwm-workspace-rename-buffer exwm-class-name)))
  ;; Global keybindings.
  (setq exwm-input-global-keys
		`(([?\s-r] . exwm-reset) ;; s-r: Reset (to line-mode).
          ([?\s-w] . exwm-workspace-switch) ;; s-w: Switch workspace.
          ([?\s-&] . (lambda (cmd) ;; s-&: Launch application.
                       (interactive (list (read-shell-command "$ ")))
                       (start-process-shell-command cmd nil cmd)))
          ;; s-N: Switch to certain workspace.
          ,@(mapcar (lambda (i)
                      `(,(kbd (format "s-%d" i)) .
						(lambda ()
                          (interactive)
                          (exwm-workspace-switch-create ,i))))
					(number-sequence 0 9)))))

;; Set the initial workspace number.

;; Enable EXWM
;; (exwm-wm-mode)

(use-package go-mode
  :straight t
  :hook (go-mode . lsp-mode))
