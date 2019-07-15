(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(menu-bar-mode -1)
(global-linum-mode t)
(setq inhibit-splash-screen t)
(setq make-backup-files nil)

(electric-pair-mode t)
(show-paren-mode t)
(global-diff-hl-mode)

(set-language-environment 'UTF-8)
(set-locale-environment "UTF-8")

(setq c-default-style "linux")
(setq-default c-basic-offset 4
	      tab-width 4
	      indent-tabs-mode nil)

(fset 'yes-or-no-p 'y-or-n-p)
(setq mouse-yank-at-point t)

(global-set-key (kbd "C-\\") #'helm-imenu-anywhere)

(setq fiplr-root-markers '(".git" ".svn"))
(setq fiplr-ignored-globs '((directories (".git" ".svn"))
                            (files ("*.jpg" "*.png" "*.zip" "*~"))))
(global-set-key (kbd "C-x f") 'fiplr-find-file)

(avy-setup-default)
(global-set-key (kbd "M-s a") 'avy-goto-char)
(global-set-key (kbd "M-s l") 'avy-goto-line)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c k") 'counsel-ag)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(global-company-mode t)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(load-theme 'molokai t)

(autoload 'gtags-mode "gtags" "" t)
(add-hook 'gtags-select-mode-hook
          '(lambda ()
             (setq hl-line-face 'underline)
             (hl-line-mode 1)))
(add-hook 'c-mode-hook
          '(lambda ()
             (gtags-mode 1)))
(setq gtags-suggested-key-mapping t)
(setq gtags-auto-update t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm imenu-anywhere fiplr company diff-hl ivy swiper counsel avy molokai-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
