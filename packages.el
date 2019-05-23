;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)

(package! typescript-mode)
(package! tide)
(package! ng2-mode)
(package! dockerfile-mode)
(package! prettier-js :recipe (:fetcher github :repo "prettier/prettier-emacs"))
(package! doom-themes)
