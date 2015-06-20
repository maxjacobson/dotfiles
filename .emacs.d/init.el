(require 'package)

(setq package-archives
  '(("gnu"         . "http://elpa.gnu.org/packages/")
    ("melpa"       . "http://melpa.milkbox.net/packages/")))

(package-initialize)

; Install evil mode (vim emulator) if it's not already installed
(when (not (package-installed-p 'evil))
  (package-refresh-contents)
  (package-install 'evil))

; Enable evil mode
; currently commented out because I'm trying to use normal emacs
; (evil-mode)

(global-linum-mode t)             ; add line numbers
(setq linum-format "%4d \u2502 ") ; display pipe after number
(set-default 'truncate-lines t)   ; don't wrap long lines
