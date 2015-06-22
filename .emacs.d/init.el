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

; via https://snarfed.org/gnu_emacs_backup_files
; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
 '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)

; disable autosave (does it work?)
(setq auto-save-default nil)

