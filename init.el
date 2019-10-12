
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'better-defaults)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(cursor-type (quote bar))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (ripgrep better-defaults go-autocomplete auto-complete go-snippets multiple-cursors magit htmlize go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "black")))))

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; go setup
(defun go-mode-setup()
  (local-set-key (kbd "M-.") 'godef-jump)
  (require 'go-autocomplete)
  (autocomplete-mode 1)
  (yay-minor-mode 1)
  (setq compile-command "go install"))
    
(add-hook 'before-save-hook 'gofmt-before-save)
(set-variable 'gofmt-command "goimports")
(add-hook 'go-mode-hook 'go-mode-setup)

;; permite escribir sobre la region seleccionada
(delete-selection-mode 1)

(setq dired-listing-switches "-alh")

;; auto save file
(setq auto-save-interval 20)
(setq backup-directory-alist
          `(("." . ,(expand-file-name "~/.emacs-auto-save"))))

;; backups
(setq backup-directory-alist `(("." . "~/.emacs-backups")))
(setq
 backup-by-copying t     ; don't clobber symlinks
 kept-new-versions 10    ; keep 10 latest versions
 kept-old-versions 0     ; don't bother with old versions
 delete-old-versions t   ; don't ask about deleting old versions
 version-control t       ; number backups
 vc-make-backup-files t) ; backup version controlled files

