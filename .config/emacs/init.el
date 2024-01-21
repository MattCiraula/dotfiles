;initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			("melpa-stable" . "https://stable.melpa.org/packages/")
                        ("org" . "https://orgmode.org/elpa/")
			("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; turn off bad defaults
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(setq visible-bell t)
(setq fill-column 80)
(setq scroll-step 1)
(setq scroll-conservatively 10000)

;; display line numbers
(column-number-mode)
(global-display-line-numbers-mode 1)
(global-hl-line-mode 1)

;; disable line numbers in some contexts
(dolist (mode
   '(org-mode-hook
     term-mode-hook
     info-mode-hook
     doc-view-mode-hook
     eshell-mode-hook
     dired-mode-hook
     pdf-view-mode-hook))
  ;; TODO: turn off global-hl-line-mode?
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; use pixels rather than line height when resizing frame
(setq frame-resize-pixelwise t)

;; follow version controlled symlinks without asking
(setq vc-follow-symlinks t)

(use-package doom-themes
  :init
  (load-theme 'doom-gruvbox t))

(setq backup-directory-alist `(("." . ,(expand-file-name "tmp/backups/" user-emacs-directory))))

;; set tab width
(setq-default tab-width 2)

;; use spaces for indentation
(setq-default indent-tabs-mode nil)

(use-package evil
  :init
  (evil-mode))

(use-package vertico
  :init
  (vertico-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-preview-current nil)
  :init
  (global-corfu-mode))

;; TODO: install from git repo
;; https://codeberg.org/akib/emacs-corfu-terminal
;; (use-package corfu-terminal
;;   :init
;;   (unless (display-graphic-p)
;;     (corfu-terminal-mode +1)))

(global-set-key (kbd "C-<tab>") 'completion-at-point)

(use-package yasnippet
  :init
  (yas-global-mode 1))

(use-package yasnippet-snippets)

;; From vertico github...
;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (setq tab-always-indent 'complete)

  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode))

;; Enable rich annotations using the Marginalia package
(use-package marginalia
  :init
  (marginalia-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package consult
  :bind (;; C-x bindings (ctl-x-map)
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
         ("C-s" . consult-line)
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ("<help> a" . consult-apropos)            ;; orig. apropos-command
         ;; M-g bindings (goto-map)
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings (search-map)
         ("M-s d" . consult-find)
         ("M-s D" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s m" . consult-multi-occur)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
         ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)                 ;; orig. next-matching-history-element
         ("M-r" . consult-history))                ;; orig. previous-matching-history-element

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init
  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref))

;; (use-package ripgrep)

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/programming")
    (setq projectile-project-search-path '("~/programming")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package dired
  :ensure nil
 :config
  (setq dired-listing-switches "-ahgo --group-directories-first"))

(use-package sly-asdf)
(use-package sly-quicklisp)

(use-package sly
  :config
  (sly-symbol-completion-mode -1)
  (setq sly-xref--popup-method 'consult-xref)
  (setq inferior-lisp-program "sbcl"))

(use-package lispy
  :hook
  ((lisp-mode . lispy-mode)
   (emacs-lisp-mode . lispy-mode)
   (scheme-mode . lispy-mode)
   (clojure-mode . lispy-mode)))

(use-package cider
  :hook
  ((clojure-mode . cider-mode)))

(use-package geiser
  :init
  (setq geiser-default-implementation 'guile))

(use-package geiser-guile)

(use-package geiser-racket)

(use-package rustic)

(use-package eglot)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(connection-local-criteria-alist
   '(((:application tramp)
      tramp-connection-local-default-system-profile tramp-connection-local-default-shell-profile)) t)
 '(connection-local-profile-alist
   '((tramp-connection-local-darwin-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o" "pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "state=abcde" "-o" "ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (euid . number)
       (user . string)
       (egid . number)
       (comm . 52)
       (state . 5)
       (ppid . number)
       (pgrp . number)
       (sess . number)
       (ttname . string)
       (tpgid . number)
       (minflt . number)
       (majflt . number)
       (time . tramp-ps-time)
       (pri . number)
       (nice . number)
       (vsize . number)
       (rss . number)
       (etime . tramp-ps-time)
       (pcpu . number)
       (pmem . number)
       (args)))
     (tramp-connection-local-busybox-ps-profile
      (tramp-process-attributes-ps-args "-o" "pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "stat=abcde" "-o" "ppid,pgid,tty,time,nice,etime,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (user . string)
       (group . string)
       (comm . 52)
       (state . 5)
       (ppid . number)
       (pgrp . number)
       (ttname . string)
       (time . tramp-ps-time)
       (nice . number)
       (etime . tramp-ps-time)
       (args)))
     (tramp-connection-local-bsd-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o" "pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (euid . number)
       (user . string)
       (egid . number)
       (group . string)
       (comm . 52)
       (state . string)
       (ppid . number)
       (pgrp . number)
       (sess . number)
       (ttname . string)
       (tpgid . number)
       (minflt . number)
       (majflt . number)
       (time . tramp-ps-time)
       (pri . number)
       (nice . number)
       (vsize . number)
       (rss . number)
       (etime . number)
       (pcpu . number)
       (pmem . number)
       (args)))
     (tramp-connection-local-default-shell-profile
      (shell-file-name . "/bin/sh")
      (shell-command-switch . "-c"))
     (tramp-connection-local-default-system-profile
      (path-separator . ":")
      (null-device . "/dev/null"))) t)
 '(custom-safe-themes
   '("bcfeecf5f2ee0bbc64450f7c5155145d8d2c590b1310a898c505f48b4b5f4c75" "f5f3921b9cec1b37758ba865127d773f8f5e4816e63712af7582b447acfa5326" "d47e82e61cffed27dd2aef3b614f6dd727776f6bcb92e738e89056b325a5aeab" "c6b317b294f9e0ecf7290a6d76b4c96ffd52213cdcb3fdad5db29141c63866cf" "032426ec19e515fd3a54b38016a1c5e4ec066be3230198cb3df82d05630a02ed" "910b36cacb8486580842582661ab2f16d8e05e6ec081dcaa141e0ca98ee5e9c2" "13f343f7d098365848ba4366801a9ae91c35faea85b017818fd4d07dfd18de61" "20d3ce5f5cb95716edca608ef7bbc27d9f8d66c9a51200f7be3f08c107810f3e" "68b35e92f9daa37685218bd11aa5307140a0ec4c8fd17142a83457619e7b1240" "49887e6f0c666dfc10fad4c23c7a83a176cb296968648c02b85deec25bb11103" "02790c735d32ad3b28c630329fdfc503ea62077d088b0c52302ab61e5a3b037e" "aee4c6b492ad130f13868464e4d7f2b2846de9b7f0d2933499c907f47dc010f4" "2141b59c9b098b476a7e20f7a621985b5d89544ae22a8d4b79b574f1203b6496" "e0aaf54e0194bd9f452ae36f0012b23d3f82d2092e2b800cc07e0e73f4ac131f" "f126b518f12b4f6bd50808143f7bd26c1d47de25d90170d3d632a46c2a08a1af" "41bbaed6a17405ee6929c7e1f8035cffd05d0ebf3f08ce388da0e92c63fb6cef" "e5a748cbefd483b74b183d7da4fca6228207a6bf9be9792dc85403a186724e1f" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af" "5b9a45080feaedc7820894ebbfe4f8251e13b66654ac4394cb416fef9fdca789" "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "eb277447cd8fd1c99b32dc18cb7c17916ad4b58d38d2e924f1d88e1e7befe7e6" "098bc2b3038a9a58b2f7034262b54f56a547d8d9a09ebe5b7a4a5fb6fbcaeae5" default))
 '(package-selected-packages
   '(rustic yasnippet-snippets yasnippet eglot desktop-environment which-key vertico use-package sly ripgrep rainbow-delimiters projectile pdf-tools orderless marginalia magit lispy geiser-racket geiser-guile exwm evil-surround embark-consult doom-themes corfu cider)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
