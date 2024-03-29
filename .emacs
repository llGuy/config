(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

; start package.el with emacs
(require 'package)
; add HELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/elpa/powerline/")
(load "powerline")

; start auto complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)


(require 'yasnippet)
(yas-global-mode 1)


(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include/c++/5")
)

(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

(semantic-mode 1)

(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

(defun my-c++-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'inline-open 0)
  )

(add-hook 'c++-mode-hook  'my-c++-mode-hook)
(add-hook 'c-mode-hook  'my-c++-mode-hook)

(global-ede-mode 1)
(put 'upcase-region 'disabled nil)

;; (set-frame-parameter ...

;(set-frame-parameter (selected-frame) 'alpha '(80 80))
;(add-to-list 'default-frame-alist '(alpha 90 90))

(require 'hl-line)
;(global-hl-line-mode 1)
;(global-linum-mode t)

(setq visible-bell t)
(setq ring-bell-function 'ignore)

(defface my-comment-face
  '((t :foreground "gray50"
       :underline t
       ))
  "Face for comments"
  :group 'c++-mode)

(set-face-attribute 'font-lock-builtin-face nil :foreground "#CDB8A4")
(set-face-attribute 'font-lock-comment-face nil :foreground "gray50")
(set-face-attribute 'font-lock-constant-face nil :foreground "#CDB8A4")
(set-face-attribute 'font-lock-doc-face nil :foreground "#CDB8A4")
(set-face-attribute 'font-lock-function-name-face nil :foreground "#CDB8A4")
(set-face-attribute 'font-lock-keyword-face nil :foreground "#DE3C51")
(set-face-attribute 'font-lock-string-face nil :foreground "#7A8B3B")
(set-face-attribute 'font-lock-type-face nil :foreground "DarkGoldenrod3")
(set-face-attribute 'font-lock-preprocessor-face nil :foreground "#81A27A")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "#CDB8A4")
(set-face-attribute 'font-lock-warning-face nil :foreground "red" :underline t)

(setq compile-command "make")

(defun my-compile-shader()
  "This function calls build.bat"
  (interactive)
  (compile "build.bat"))

(defun my-compile-run ()
  "This  functions runs make run"
  (interactive)
  (compile "build.bat run"))
(defun my-compile-compile()
  "This function runs make"
  (interactive)
  (compile "build.bat compile"))
(defun my-compile-clean()
  "This function runs make clean"
  (interactive)
  (compile "build.bat clean"))
(defun my-compile-debug()
  "This function runs the debugger"
  (interactive)
  (compile "build.bat debug"))
(defun my-enable-flycheck()
  "This function enables flycheck"
  (interactive)
  (flycheck-mode))

(global-set-key (kbd "M-,") 'my-compile-clean)
(global-set-key (kbd "M-m") 'my-compile-compile)
(global-set-key (kbd "M-r") 'my-compile-run)
(global-set-key (kbd "M-q") 'my-compile-debug)


(fa-config-default)
(add-to-list 'auto-mode-alist '("\\.h" . c++-mode))
(set-default 'semantic-case-fold t)
(semantic-add-system-include "C:/Program Files (x86)/Windows Kits/10/Include/10.0.17134.0/um/" 'c++-mode)
(semantic-add-system-include "C:/dependencies/GLFW/include/" 'c++-mode)
(semantic-add-system-include "C:/VulkanSDK/1.1.108.0/Include" 'c++-mode)
(semantic-add-system-include "C:/dependencies/GLEW/include" 'c++-mode)
(semantic-add-system-include "C:/dependencies/glm/" 'c++-mode)
(semantic-add-system-include "C:/dependencies/c++/" 'c++-mode)
(semantic-add-system-include "C:/dependencies/stb-master/" 'c++-mode)
(semantic-add-system-include "C:/dependencies/json-loader/include/" 'c++-mode)
(semantic-add-system-include "C:/dependencies/Lua/include/" 'c++-mode)
(require 'semantic/bovine/c)
(add-to-list 'semantic-lex-c-preprocessor-symbol-file
    "C:/Program Files (x86)/Windows Kits/10/Include/10.0.17134.0/um/windows.h")

;(add-to-list 'auto-mode-alist '("\C:/Program Files (x86)/Windows Kits/10/Include/10.0.17134.0/um/windows.h\\'" . c++-mode))

(setq inhibit-startup-screen t)

(setq flycheck-gcc-include-path '("C:/dependencies/GLEW/include/" "C:/dependencies/GLFW/include/" "C:/dependencies/glfw-3.2.1.bin.WIN64/include/GLFW/" "C:/dependencies/" "C:/dependencies/xml_parser" "C:/dependencies/c++/" "C:/dependencies/json-loader/include/" "C:/VulkanSDK/1.1.108.0/Include" "C:/dependencies/stb-master/" "C:/dependencies/Lua/include/"))
(setq flycheck-gcc-args '("-std=c++1z"))
(setq flycheck-gcc-definitions '("GLM_ENABLE_EXPERIMENTAL" "STB_IMAGE_IMPLEMENTATION" "GLEW_STATIC"))
(setq flycheck-gcc-warnings '())

;(global-flycheck-mode 1)

(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 200))

;(global-hl-line-mode 1)
(set-face-background hl-line-face "midnight blue")
;(set-face-background hl-line-face "")
;(set-face-background hl-line-face "grey26")
;(global-hl-line-mode 1)

(set-face-attribute 'region nil :background "navy")
(set-face-attribute 'region nil :background "navy" :foreground "peru")

;(set-default indent-tabs-mode nil)

(set-face-foreground 'vertical-border "#282729")
					;(set-face-background 'vertical-border "#052329")
;(set-face-foreground 'vertical-border "gray7")
;(set-face-background 'vertical-border "gray7")
(set-cursor-color "gray80")
(linum-mode 1)
(display-time-mode 1)
;(electric-pair-mode 1)

;(set-face-foreground 'mode-line "lawn green")
;(set-face-background 'mode-line "gray7")
;(set-face-background 'mode-line-inactive "gray7")
;(set-face-foreground 'mode-line-inactive "gray60")

(set-face-background 'fringe "#282729")
(fringe-mode 0)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq scroll-step 1)

(require 'multiple-cursors)
(global-set-key (kbd "C-]") 'mc/edit-lines)

;(set-face-background 'modeline-inactive "tomato")

(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (previous-line 2))

(global-set-key (kbd "M-(") 'move-line-up)

(defun move-line-down ()
  (interactive)
  (next-line 1)
  (transpose-lines 1)
  (previous-line 1))

(global-set-key (kbd "M-)") 'move-line-down)

(windmove-default-keybindings)

(global-set-key (kbd "M--") 'windmove-up)
(global-set-key (kbd "M-p") 'windmove-left)
(global-set-key (kbd "M-[") 'windmove-down)
(global-set-key (kbd "M-]") 'windmove-right)

(setq truncate-lines t)

(global-set-key (kbd "M-*") 'toggle-truncate-lines)
;(nyan-mode 1)

(require 'wrap-region)

(wrap-region-mode t)

(add-to-list 'load-path "~/.emacs.d/themes/el/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; Open split shell on launch
(add-hook 'emacs-startup-hook
  (lambda ()
    (let ((w (split-window-right)))
      (select-window w)
      (eshell))
    (switch-to-buffer "*eshell*")))

(require 'powerline)
(powerline-default-theme)

;(load-theme 'soothe)

;(nyan-mode t)

(add-hook 'dired-mode-hook 'dired-hide-details-mode)

(global-set-key (kbd "M-_") 'mc/mark-all-like-this)

(defun toggle-nyan-animation ()
  (interactive)
  nyan-toggle-wavy-trail t
  nyan-start-animation t)

(global-set-key (kbd "M-+") 'toggle-nyan-animation)
(put 'narrow-to-region 'disabled nil)

(set-face-attribute 'mode-line-inactive nil
                    :box '(:color "#282729"))

(defun my-set-indent-tabs-mode ()
  (interactive)
  (setq indent-tabs-mode nil))

(add-hook 'c++-mode-hook 'my-set-indent-tabs-mode)

(require 'lua-mode)

(set-background-color "#282729")

(setq-default indent-tabs-mode nil)

;(add-to-list 'load-path "~/.emacs.d/everything/everything.el")
;(require 'everything)

(add-hook 'c-mode-common-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))

(add-hook 'c-mode-common-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("\\<\\(NOTE\\|WARNING\\):" 1 font-lock-keyword-face t)))))

(setq tab-width 4)

(set-face-foreground 'mode-line "DarkGoldenrod3")

(require 'disable-mouse)
(global-disable-mouse-mode)

(require 'projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c C-f") 'projectile-find-file)

(setq projectile-compile-project-cmd 'my-compile-compile)

(require 'magit)

(global-linum-mode 1)
(set-face-foreground 'linum "gray40")

;(setq-default left-fringe-width  30)
(setq linum-format (lambda (line) (propertize (format (let ((w (length (number-to-string (count-lines (point-min) (point-max)))))) (concat "%" 
(number-to-string w) "d ")) line) 'face 'linum)))
