;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;; melpa package
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;; tell meacs where ist yout personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")


;; load the packaged named x
;;(load "x")


;; define keybinding :
;; (global-set-key (kbd "M-a") 'backward-char)
;; how to find key syntax :
;; alt-x describe-key then key combination
;; remove keybinding :
;; (global-set-key (kbd "C-b" ) nil)
;; or
;; (global-unset-key (kbd "C-b"))


;;load files :
;;(load (xah-get-fullpaht "filename"))

;; emacs set default window size
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 200) ; chars
              (height . 60) ; lines
              (left . 30)
              (top . 20)))
      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 106)
              (height . 60)
              (background-color . "grey")
              (left . 50)
              (top . 50))))
  (progn
    (setq initial-frame-alist '( (tool-bar-lines . 0)))
    (setq default-frame-alist '( (tool-bar-lines . 0)))))


;; set theme
(load-theme 'tsdh-dark)

;; menu bar
(menu-bar-mode -1)

;; toolbar
(tool-bar-mode -1)

;; scroll bar
(scroll-bar-mode -1)

;;blink cursor
(blink-cursor-mode -1)

;; tooltip to mini buffer
(tooltip-mode -1)

;; hilight current line
(global-hl-line-mode 1)

;; close paren
(electric-pair-mode 1)

;; show paren
(show-paren-mode 1)

 ;; visual line
(global-visual-line-mode 1)

;; line number
(global-linum-mode 1)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (web-mode jedi flycheck ein use-package company-anaconda anaconda-mode ivy-rich ivy-hydra counsel flx smex ivy markdown-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; ivy package
(require 'swiper)
(require 'smex)
(require 'flx)
(ivy-mode 1)


;;elpy
(use-package elpy
  :ensure t
  :init
  (elpy-enable))

;;set python interpreter
(require 'python)
(defun python-shell-parse-command ()
  "Return the string used to execute the inferior Python process."
  "/usr/bin/python3 -i"
  )


;;  flycheck :
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

;; jedi
(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup))

;; tutorial page of
(setq inhibit-startup-screen -1)


;; start up mini-buffer message :
(defun display-startup-echo-area-message ()
  (message "gib einen Befehl ein"))

;; start up message : 
(setq initial-scratch-message "                                                                     Hallo Moamen, vergiss die Tasks zu sehen")


