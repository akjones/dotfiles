;;;;;;;;;;;;;;;;;;
;; key bindings ;;
;;;;;;;;;;;;;;;;;;

;;;;;;;;;;
;; elpa ;;
;;;;;;;;;;

(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))

(unless package--initialized
  (package-initialize))

(when (null package-archive-contents)
  (package-refresh-contents))

;; add/remove any packages you like here
(dolist (package
         '(ido-ubiquitous
           magit
           markdown-mode
           org
           smex
           yasnippet))
  (if (not (package-installed-p package))
      (package-install package)))

(global-set-key (kbd "C-c p") 'list-packages)

;;;;;;;;;;
;; smex ;;
;;;;;;;;;;

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

(ido-mode 1)
(ido-ubiquitous-mode 1)

(global-set-key (kbd "M-x") 'smex)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; display & appearance ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; show time and battery status in mode line

(display-time-mode 1)
(setq display-time-format "%H:%M")
(display-battery-mode 1)

;; whitespace

(setq sentence-end-double-space nil)
(setq shift-select-mode nil)
(setq whitespace-style '(face trailing lines-tail tabs))
(setq whitespace-line-column 80)
(add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))

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
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))
(setq recentf-max-saved-items 100)

(global-auto-revert-mode t)

;; other niceties

(add-to-list 'safe-local-variable-values '(lexical-binding . t))
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq diff-switches "-u")

(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

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

(color-theme-molokai)

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

;; set the path to your extempore-directory
(setq user-extempore-directory "/usr/local/Cellar/extempore/HEAD/")
(autoload 'extempore-mode (concat user-extempore-directory "extras/extempore.el") "" t)
(add-to-list 'auto-mode-alist '("\\.xtm$" . extempore-mode))

(autoload #'llvm-mode (concat user-extempore-directory "extras/llvm-mode.el")
  "Major mode for editing LLVM IR files" t)

(add-to-list 'auto-mode-alist '("\\.ir$" . llvm-mode))
(add-to-list 'auto-mode-alist '("\\.ll$" . llvm-mode))

;; you can delete this once you've setup your extempore path
(if (string-equal user-extempore-directory "/path/to/extempore/")
    (if user-init-file
        (progn (find-file user-init-file)
               (search-forward "/path/to/extempore/" nil t 2)
               (message "You need to set your Extempore path!"))))


;;;;;;;;;;;;;;;;;;
;; coffeescript ;;
;;;;;;;;;;;;;;;;;;

(custom-set-variables '(coffee-tab-width 2))
