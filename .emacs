; important stuff

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

; start package.el with emacs
(require 'package)
; add HELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
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

(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))

(require 'hl-line)
;(global-hl-line-mode 1)
;(global-linum-mode t)

(setq visible-bell t)
(setq ring-bell-function 'ignore)

;(set-face-attribute 'font-lock-builtin-face nil :foreground "#DAB98F" )
;(set-face-attribute 'font-lock-comment-face nil :foreground "dark gray")
;(set-face-attribute 'font-lock-constant-face nil :foreground "peru")
;(set-face-attribute 'font-lock-doc-face nil :foreground "dim gray")
;(set-face-attribute 'font-lock-function-name-face nil :foreground "burlywood3")
;(set-face-attribute 'font-lock-keyword-face nil :foreground "DarkGoldenrod3")
;(set-face-attribute 'font-lock-string-face nil :foreground "peru")
;(set-face-attribute 'font-lock-type-face nil :foreground "burlywood3")
;(set-face-attribute 'font-lock-preprocessor-face nil :foreground "pero")
;(set-face-attribute 'font-lock-variable-name-face nil :foreground "#DAB98F")

(set-face-attribute 'font-lock-builtin-face nil :foreground "#DAB98F" )
(set-face-attribute 'font-lock-comment-face nil :foreground "medium sea green")
(set-face-attribute 'font-lock-constant-face nil :foreground "pale green")
(set-face-attribute 'font-lock-doc-face nil :foreground "dim gray")
(set-face-attribute 'font-lock-function-name-face nil :foreground "white")
(set-face-attribute 'font-lock-keyword-face nil :foreground "white")
(set-face-attribute 'font-lock-string-face nil :foreground "sea green")
(set-face-attribute 'font-lock-type-face nil :foreground "pale green")
(set-face-attribute 'font-lock-preprocessor-face nil :foreground "light sea green")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "light cyan")

; console mode
;(set-face-attribute 'font-lock-builtin-face nil :foreground "dark gray" )
;(set-face-attribute 'font-lock-comment-face nil :foreground "light green")
;(set-face-attribute 'font-lock-constant-face nil :foreground "dark gray")
;(set-face-attribute 'font-lock-doc-face nil :foreground "dark gray")
;(set-face-attribute 'font-lock-function-name-face nil :foreground "dark gray")
;(set-face-attribute 'font-lock-keyword-face nil :foreground "dark gray")
;(set-face-attribute 'font-lock-string-face nil :foreground "yellow green")
;(set-face-attribute 'font-lock-type-face nil :foreground "dark gray")
;(set-face-attribute 'font-lock-preprocessor-face nil :foreground "dark gray")
;(set-face-attribute 'font-lock-variable-name-face nil :foreground "dark gray")

; window mode
;(set-face-attribute 'font-lock-builtin-face nil :foreground "light gray" )
;(set-face-attribute 'font-lock-comment-face nil :foreground "green yellow")
;(set-face-attribute 'font-lock-constant-face nil :foreground "light gray")
;(set-face-attribute 'font-lock-doc-face nil :foreground "light gray")
;(set-face-attribute 'font-lock-function-name-face nil :foreground "light gray")
;(set-face-attribute 'font-lock-keyword-face nil :foreground "light gray")
;(set-face-attribute 'font-lock-string-face nil :foreground "green yellow")
;(set-face-attribute 'font-lock-type-face nil :foreground "light gray")
;(set-face-attribute 'font-lock-preprocessor-face nil :foreground "light gray")
;(set-face-attribute 'font-lock-variable-name-face nil :foreground "light gray")

(setq compile-command "make")

					;(global-set-key (kbd "M-m") 'compile)

(defun my-compile-shader()
  "This function calls compile.bat"
  (interactive)
  (compile "compile.bat"))

(defun my-compile-run ()
  "This  functions runs make run"
  (interactive)
  (compile "make run"))
(defun my-compile-compile()
  "This function runs make"
  (interactive)
  (compile "make"))
(defun my-compile-clean()
  "This function runs make clean"
  (interactive)
  (compile "make clean"))
(defun my-compile-debug()
  "This function runs the debugger"
  (interactive)
  (compile "make debug"))
(defun my-enable-flycheck()
  "This function enables flycheck"
  (interactive)
  (flycheck-mode))
(defun my-display-debug()
  "This function displays the debug output"
  (interactive)
  (compile "make display"))
(defun my-align()
  "This function aligns ="
  (interactive)
  (align))

(global-set-key (kbd "M-'") 'my-display-debug)
(global-set-key (kbd "M-,") 'my-compile-clean)
(global-set-key (kbd "M-m") 'my-compile-compile)
(global-set-key (kbd "M-r") 'my-compile-run)
(global-set-key (kbd "M-t") 'my-compile-debug)
(global-set-key (kbd "M-c") 'my-enable-flycheck)
(global-set-key (kbd "M-q") 'my-compile-shader)


(fa-config-default)
(add-to-list 'auto-mode-alist '("\\.h" . c++-mode))
(set-default 'semantic-case-fold t)
(semantic-add-system-include "C:/Program Files (x86)/Windows Kits/10/Include/10.0.17134.0/um/" 'c++-mode)
(semantic-add-system-include "C:/dependencies/GLFW/include/" 'c++-mode)
(semantic-add-system-include "C:/VulkanSDK/1.1.70.1/Include" 'c++-mode)
(semantic-add-system-include "C:/dependencies/GLEW/include" 'c++-mode)
(semantic-add-system-include "C:/dependencies/glm/" 'c++-mode)
(semantic-add-system-include "C:/dependencies/c++/" 'c++-mode)
(semantic-add-system-include "C:/dependencies/stb-master/" 'c++-mode)
(require 'semantic/bovine/c)
(add-to-list 'semantic-lex-c-preprocessor-symbol-file
    "C:/Program Files (x86)/Windows Kits/10/Include/10.0.17134.0/um/windows.h")

;(add-to-list 'auto-mode-alist '("\C:/Program Files (x86)/Windows Kits/10/Include/10.0.17134.0/um/windows.h\\'" . c++-mode))

(setq inhibit-startup-screen t)

(setq flycheck-gcc-include-path '("C:/dependencies/GLEW/include/" "C:/dependencies/GLFW/include/" "C:/dependencies/glfw-3.2.1.bin.WIN64/include/GLFW/" "C:/dependencies/" "C:/dependencies/xml_parser" "C:/dependencies/c++/" "C:/dependencies/json-loader/include" "C:/VulkanSDK/1.1.70.1/Include" "C:/dependencies/stb-master/"))
(setq flycheck-gcc-args '("-std=c++1z"))
(setq flycheck-gcc-definitions '("GLM_ENABLE_EXPERIMENTAL" "STB_IMAGE_IMPLEMENTATION" "GLEW_STATIC"))
(setq flycheck-gcc-warnings '())

(global-flycheck-mode 1)

(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 150))

;(global-hl-line-mode 1)
;(set-face-background hl-line-face "gray30")
(set-face-background hl-line-face "dark blue")

(set-face-attribute 'region nil :background "navy")
(set-face-attribute 'region nil :background "navy" :foreground "peru")

;(set-default indent-tabs-mode nil)

(set-face-foreground 'vertical-border "#052329")
(set-face-background 'vertical-border "#052329")
(set-cursor-color "green yellow")
(linum-mode 1)
(display-time-mode 1)
(electric-pair-mode 1)

(add-hook 'c++-mode
               (lambda ()
                (font-lock-add-keywords nil
                 '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))

; (hl-todo-mode 1)

;(set-face-foreground 'mode-line "green yellow")
(set-face-foreground 'mode-line "white")
(set-face-background 'mode-line "#052329")
(set-face-background 'mode-line-inactive "#052329")
(set-face-foreground 'mode-line-inactive "gray60")
(set-face-background 'fringe "#052329")

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

(setq truncate-lines nil)

(global-set-key (kbd "M-*") 'toggle-truncate-lines)
(nyan-mode 1)

(require 'wrap-region)

(wrap-region-mode t)
