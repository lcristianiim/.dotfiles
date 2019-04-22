;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(require 'evil)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (misterioso)))
 '(org-agenda-files
   (quote
    ("~/Documents/me.org" "~/Documents/orgmode-mediawiki/me.org")))
 '(package-selected-packages (quote (fiplr cider powerline smex evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(evil-mode 1)
(setq inhibit-startup-screen t)
(menu-bar-mode 1)
(tool-bar-mode 0)
;; This sets the backup directory
(setq backup-directory-alist '(("." . "~/.emacs_saves")))
;; This makes you loop cool trough buffers
(ido-mode 1)
;; Smex configuration
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; Set cursor color to white
(set-cursor-color "#ffffff")
;; Resizing windows size shortcuts
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
;; winner mode
(when (fboundp 'winner-mode)
  (winner-mode 1))
;; add powerline
(powerline-center-theme)
(setq powerline-default-separator 'arrow)

;; my custom configuration
(add-to-list 'load-path "~/.emacs.d/workgroups.el")
(require 'workgroups)
(setq wg-prefix-key (kbd "C-c w"))
(workgroups-mode 1)
(wg-load "~/.emacs.d/workspaces")
