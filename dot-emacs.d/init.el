 ;;; --- UI & Performance ---
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font-12"))
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

;;; --- Package Management ---
(require 'package)
(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")))

(unless (bound-and-true-p package--initialized)
  (package-initialize))

;; Only refresh if we don't have a local cache (speeds up startup)
(unless package-archive-contents
  (package-refresh-contents))

;; Ensure use-package is installed
(require 'use-package)
(setq use-package-always-ensure t) ; Removes the need for :ensure t on every block

;;; --- Packages ---

(use-package which-key
  :config
  (which-key-mode))

(use-package evil
  :init
  (setq evil-want-integration t) ; Required for evil-collection
  (setq evil-want-keybinding nil)
  (setq evil-search-module 'evil-search)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

(let ((holpath (concat (getenv "HOLDIR") "/tools/editor-modes/emacs/hol-mode.el")))
  (if (file-exists-p holpath)
      (load holpath)
    (message "HOL mode not found")))

(use-package auctex
  :ensure t
  :defer t
  :mode ("\\.tex\\'" . latex-mode)
  :init
  ;; Use pdf-tools or system PDF viewer instead of dvi
  (setq TeX-PDF-mode t)
  :config
  ;; Parse the document to enable smart completions and wizardry
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  
  ;; Make Emacs prompt you for a master file if working on multi-file documents
  (setq-default TeX-master nil)

  ;; Enable RefTeX for citations and table of contents
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (setq reftex-plug-into-AUCTeX t)

  ;; Enable math support (makes typing LaTeX symbols easier)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode))

(eval-after-load "quail"
  (progn
    (define-key quail-translation-keymap (kbd "TAB") 'nil)
    (define-key quail-translation-keymap [tab] 'nil)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
