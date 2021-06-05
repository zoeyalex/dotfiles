; Disable junk
;;(setq inhibit-startup-message t)
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)          ; Disable the menu bar

;; Remove screen flashing top/bottom line
(setq visible-bell nil)

;; Change default font, theme
(set-face-attribute 'default nil :font "SourceCodePro-10")
(load-theme 'dracula t)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Disable line wrapping
(set-default 'truncate-lines t)

;; Initialize package manager
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Enable line numbers
(column-number-mode)
(global-display-line-numbers-mode t)
;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;; Discord integratin
(require 'elcord)
(elcord-mode)

(add-hook 'python-mode-hook 'lsp)

;; Set up ivy/counsel and bind fuzzy find globally
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-switch-buffer)
	 ("C-x C-f" . counsel-find-file))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^
(defun sufind ()
  (interactive)
  (counsel-find-file "/su::/"))


(defun subs ()
  (interactive)
  (evil-ex "%s//"))

(use-package general
  :config
  (general-create-definer zoey/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")
  (zoey/leader-keys

    "b"   '(:ignore t :which-key "buffer")
    "bk"  '(:ignore t :which-key "kill buffer")
    "f"   '(:ignore t :which-key "file")
    "h"   '(:ignore t :which-key "help")
    "t"   '(:ignore t :which-key "toggles")
    "s"   '(subs :which-key "substitute")
    "e"   '(xref-find-definitions :which-key "jump to def")
    "q"   '(xref-pop-marker-stack :which-key "go back")
    "tt"  '(counsel-load-theme :which-key "choose theme")
    "ts"  '(hydra-text-scale/body :which-key "scale text")
    "hf"  '(describe-function :which-key "describe function")
    "hk"  '(describe-key :which-key "describe key")
    "hp"  '(describe-package :which-key "describe package")
    "fn"  '(make-empty-file :which-key "create file")
    "fe"  '(counsel-find-file :which-key "edit file")
    "fr"  '(sufind :which-key "open as root")
    "be"  '(eval-buffer :which-key "eval buffer")
    "br"  '(revert-buffer :which-key "revert buffer") 
    "bs"  '(counsel-switch-buffer :which-key "switch buffer")
    "bw"  '(save-buffer :which-key "buffer write")
    "bkc" '(kill-current-buffer :which-key "kill current buffer")
    "bks" '(kill-buffer :which-key "kill a buffer")))

;; Customize modeline and provide icon fonts
(use-package all-the-icons)
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

;; Package that makes creating themes easier
(use-package autothemer)

;; Highlight hex, string colors etc.
(use-package rainbow-mode
  :hook (prog-mode . rainbow-mode ))

;; C-x C-h etc... command helper
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0))

;; M-x command helper
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

;; Colour the same brackets
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Emojis 😳
(use-package emojify
  :hook (after-init . global-emojify-mode))

(use-package projectile
  :config
  (projectile-mode +1)) 

;; Customize starting screen
(use-package dashboard
    :diminish dashboard-mode
    :config
    (setq dashboard-banner-logo-title "hewwo uwu, he do be t-posing tho 😳")
    (setq dashboard-startup-banner "/home/zoey/Pictures/uwu_pose.png")
    (setq dashboard-center-content t)
    (setq dashboard-set-heading-icons t)
    (setq dashboard-set-file-icons t)
    (setq dashboard-projects-backend 'projectile)
    (setq dashboard-items '((projects  . 5)
                            (bookmarks . 5)
			    (recents . 5)))
    (dashboard-setup-startup-hook))

;; Use .custom.el for custom-set-variables
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Better help interface
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

;; Set up evil keybindings
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  (setq evil-ex-substitute-global t)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  ;; 
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal)
  ;; Vim-like history and redo
  (global-undo-tree-mode)
  (evil-set-undo-system 'undo-tree)
  ;; Remap Z-Q to force quit
  (define-key evil-normal-state-map (kbd "ZQ") 'evil-quit-all-with-error-code))
(require 'goto-chg)
(global-set-key [(control ?.)] 'goto-last-change)
(global-set-key [(control ?,)] 'goto-last-change-reverse)
;; Disable evil in certain modes
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))
