;; Theme
(load-theme 'tango t)

;; Turn off backup
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Turn on line and column numbers
(global-display-line-numbers-mode t)
(column-number-mode)

;; Line wrap
(global-visual-line-mode t)

;; Disable menu, scroll and tool bars
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Scrolloff
(setq scroll-margin 8)
(setq scroll-step 1)

;; Set up visual bell
(setq visual-bell t)

;; Inhibit start message
(setq inhibit-startup-message t)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Move customize configs to separate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; ========== Set packages repositories ==========
;; Set up package.el to work with MELPA
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(unless package-archive-contents 
  (package-refresh-contents))


;; ========== Packages ==========

;; use-package
(unless (package-installed-p 'use-package) 
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Undo Tree
(use-package undo-tree
             :config
             (global-undo-tree-mode 1))

;; Evil
(use-package evil
             :after undo-tree
             :init
             (setq evil-want-integration t)
             (setq evil-want-keybinding nil)
             (setq evil-want-C-u-scroll t)
             :config
             (evil-mode 1)
             (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
             (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
             (evil-global-set-key 'motion "j" 'evil-next-visual-line)
             (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
             (evil-set-undo-system 'undo-tree)
             )

;; Rainbow delimiters
(use-package rainbow-delimiters
             :hook (prog-mode . rainbow-delimiters-mode))

;; Which key
(use-package which-key
             :init 
             (which-key-mode)
             :config
             (setq which-key-idle-delay 1))

;; SML and HOL
(use-package sml-mode
             :hook flyspell-prog-mode
             :config
             (setq sml-program-name "poly"))

(load "/home/hak/Sources/HOL/tools/hol-mode") 
(load "/home/hak/Sources/HOL/tools/hol-unicode") 
