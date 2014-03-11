;; key bindings

(global-set-key (kbd "C-c <left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-c <right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-c <down>") 'shrink-window)
(global-set-key (kbd "C-c <up>") 'enlarge-window)

(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<down>") 'windmove-down)

(global-set-key (kbd "<RET>") 'newline-and-indent)

(global-unset-key (kbd "C-x C-z"))

;; elpa

(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))

(unless package--initialized
  (package-initialize))

(when (null package-archive-contents)
  (package-refresh-contents))

(dolist (package
         '(ido-ubiquitous
           flx-ido
           magit
           markdown-mode
           org
           smex
           color-theme-solarized
           js2-mode
           ace-jump-mode
           expand-region
           coffee-mode
           slime
           haml-mode
           projectile
           ag
           auto-complete
           yasnippet))
  (if (not (package-installed-p package))
      (package-install package)))

(global-set-key (kbd "C-c p") 'list-packages)

;; smex

(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

(require 'flx-ido)
(ido-mode 1)
(ido-ubiquitous-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-use-faces nil)

(global-set-key (kbd "M-x") 'smex)

(setq gc-cons-threshold 20000000) ;; do less garbage collection


;; display & appearance

(require 'color-theme)
(setq visible-bell t)
(setq inhibit-startup-message t)
(setq color-theme-is-global t)

(set-default 'indent-tabs-mode nil)
(set-default 'tab-width 2)
(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)

(show-paren-mode 1)
(column-number-mode 1)
(hl-line-mode t)

(tool-bar-mode -1)

;; show time and battery status in mode line

(display-time-mode 1)
(setq display-time-format "%H:%M")

;; whitespace

(setq sentence-end-double-space nil)
(setq shift-select-mode nil)
(setq whitespace-style '(face trailing lines-tail tabs))
(setq whitespace-line-column 80)
(add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; mark region commands as safe

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; text mode tweaks

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(remove-hook 'text-mode-hook 'smart-spacing-mode)

;; file visiting stuff

(setq save-place t)
(setq save-place-file (concat user-emacs-directory "places"))
(setq recentf-max-saved-items 100)

;; Backups

(defvar backup-directory-path (concat user-emacs-directory "backups"))
(unless (file-exists-p backup-directory-path)
  (make-directory backup-directory-path))
(setq backup-directory-alist `((".*" . ,backup-directory-path)))
(setq auto-save-file-name-transforms `((".*" ,backup-directory-path t)))

(setq backup-by-copying t
  delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(global-auto-revert-mode t)

;; other niceties

(add-to-list 'safe-local-variable-values '(lexical-binding . t))
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq diff-switches "-u")

(projectile-global-mode)

(yas-global-mode 1)

(global-auto-complete-mode)

(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

(defalias 'yes-or-no-p 'y-or-n-p)

;; pretty lambdas

(add-hook 'prog-mode-hook
          '(lambda ()
             (font-lock-add-keywords
              nil `(("(?\\(lambda\\>\\)"
                     (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                               ,(make-char 'greek-iso8859-7 107))
                                                              nil)))))))

;; color theme

(if (daemonp)
    (add-hook 'after-make-frame-functions
              '(lambda (f)
                 (with-selected-frame f
                   (when (window-system f) (color-theme-solarized-dark)))))
  (color-theme-solarized-dark))

;; faces

;; to choose a font (and size), you can use this code

;; ;; font size
;; (setq base-face-height 200)
;; ;; monospace font
;; (set-face-attribute 'default nil :height base-face-height :family "Ubuntu Mono")
;; ;; variable-width font
;; (set-face-attribute 'variable-pitch nil :height base-face-height :family "Ubuntu")

;;;;;;;;;;;;;;;
;; extempore ;;
;;;;;;;;;;;;;;;

(setq user-extempore-directory "/usr/local/Cellar/extempore/HEAD/")
(autoload 'extempore-mode (concat user-extempore-directory "extras/extempore.el") "" t)
(add-to-list 'auto-mode-alist '("\\.xtm$" . extempore-mode))

(autoload #'llvm-mode (concat user-extempore-directory "extras/llvm-mode.el")
  "Major mode for editing LLVM IR files" t)

(add-to-list 'auto-mode-alist '("\\.ir$" . llvm-mode))
(add-to-list 'auto-mode-alist '("\\.ll$" . llvm-mode))

;;;;;;;;;;;;;;;;;;
;; coffeescript ;;
;;;;;;;;;;;;;;;;;;

(custom-set-variables '(coffee-tab-width 2))

;;;;;;;;;;;;;;;;
;; javascript ;;
;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(custom-set-variables
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t))

(setq js-indent-level 2)

(add-hook 'js2-mode-hook
          (lambda ()
            (slime-js-minor-mode 1)))


(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c C-l") 'slime-eval-buffer))

(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c C-j") 'slime-connect))
