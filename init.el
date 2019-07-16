(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(menu-bar-mode -1)
(global-linum-mode t)
(setq inhibit-splash-screen t)
(setq auto-save-default nil)
(setq make-backup-files nil)

(electric-pair-mode t)
(show-paren-mode t)
(global-auto-revert-mode t)
(global-diff-hl-mode)

(set-language-environment 'UTF-8)
(set-locale-environment "UTF-8")

(setq c-default-style "linux")
(setq-default c-basic-offset 4
	      tab-width 4
	      indent-tabs-mode nil)
(global-set-key (kbd "TAB") 'self-insert-command)
(setq backward-delete-char-untabify-method 'hungry)

(fset 'yes-or-no-p 'y-or-n-p)
(setq mouse-yank-at-point t)
(setq ring-bell-function 'ignore)

(defun show-buffer-file-name ()
  (interactive)
  (let ((file-name (buffer-file-name)))
    (if file-name
        (progn
          (message file-name)
          (kill-new file-name)))))
(global-set-key (kbd "C-c C-f") 'show-buffer-file-name)

(setq url-automatic-caching t)
(global-set-key (kbd "C-c i") 'youdao-dictionary-search-from-input)
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)

(global-set-key (kbd "M-o") 'ace-window)

(global-set-key (kbd "C-\\") #'helm-imenu-anywhere)

(setq fiplr-root-markers '(".git" ".svn"))
(setq fiplr-ignored-globs '((directories (".git" ".svn"))
                            (files ("*.jpg" "*.png" "*.zip" "*~"))))
(global-set-key (kbd "C-x f") 'fiplr-find-file)

(avy-setup-default)
(global-set-key (kbd "M-s a") 'avy-goto-char)
(global-set-key (kbd "M-s l") 'avy-goto-line)

(add-hook 'after-init-hook #'global-flycheck-mode)

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

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode)
              (ggtags-mode 1))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("0cd56f8cd78d12fc6ead32915e1c4963ba2039890700458c13e12038ec40f6f5" "73a13a70fd111a6cd47f3d4be2260b1e4b717dbf635a9caee6442c949fad41cd" "3eb93cd9a0da0f3e86b5d932ac0e3b5f0f50de7a0b805d4eb1f67782e9eb67a4" "b59d7adea7873d58160d368d42828e7ac670340f11f36f67fa8071dbf957236a" default)))
 '(package-selected-packages
   (quote
    (ggtags flycheck youdao-dictionary ace-window helm imenu-anywhere fiplr company diff-hl ivy swiper counsel avy molokai-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
