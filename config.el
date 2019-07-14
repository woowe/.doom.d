;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(add-to-list 'custom-theme-load-path "~/.doom.d/themes/challenger-deep-theme")

;; typescript mode
(require 'typescript-mode)

;; tide mode
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; angular mode
(require 'ng2-mode)
;; php mode
(require 'php-mode)

;; dockerfile mode
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; prettier
(setq prettier-js-args '(
  "--single-quote" "true"
))
(require 'prettier-js)
(add-hook 'typescript-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'ng2-ts-mode-hook 'prettier-js-mode)
(add-hook 'ng2-html-mode-hook 'prettier-js-mode)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'js-mode-hook 'prettier-js-mode)

;; doom themes
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
;; (load-theme 'doom-one t)
(load-theme 'challenger-deep t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)
;; or for treemacs users
(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; EMACS CONFIG

;; font settings
;; (setq doom-font (font-spec :family "Inconsolata" :size 15))
(set-frame-font "Inconsolata")
(set-face-attribute 'default nil :height 150)

;; (setq font-lock-support-mode 'jit-lock-mode)
;; (setq jit-lock-stealth-time 16
;;       jit-lock-defer-contextually t
;;       jit-lock-stealth-nice 0.5)
;; (setq-default font-lock-multiline t)

;; (setq jit-lock-defer-time 0)
;; (setq fast-but-imprecise-scrolling t)

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq create-lockfiles nil) ; stop creating #autosave# files

;; CUSTOM FUNCTIONS

(defun my/create-terminal-at-proj-root ()
    "Opens a new vertically split pane and opens a termina at the project root inside the buffer"
  (interactive)
  (evil-window-vsplit)
  (projectile-run-term "/bin/bash"))

(global-set-key (kbd "C-M-t")
                'my/create-terminal-at-proj-root)
