(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(setq packages-installed '(go-autocomplete emmet-mode web-mode go-mode magit multiple-cursors))

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package packages-installed)
  (unless (package-installed-p package)
    (package-install package)))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

; Auto-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)


(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
