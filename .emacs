(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message "
// Date Create: ")
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(global-set-key "\C-l" 'goto-line); [Ctrl]-[L]
(global-set-key [f9] 'compile)
(global-set-key [f8] 'shell)
(global-set-key [f2] 'split-windows-vertically);
(global-set-key [f1] 'remove-split);
(global-set-key [f5] 'copy-region-as-kill); Copy
(global-set-key [f6] 'kill-region); Cut
(global-set-key [f7] 'yank); Paste
"C mode with adjustment for use with linux kernel"
  (interactive)
  (c-mode)
  (c-set-style "K&R")
  (setq tab-width 8)
  (setq indent-tabs-mode t)
  (setq c-basic-offset 8)

(global-hl-line-mode 1)
(line-number-mode 1)
(column-number-mode 1)

(set-cursor-color "#FF0000")

(global-linum-mode 1)

(add-to-list 'load-path "~/.emacs.d/Fill-Column-Indicator")
(require 'fill-column-indicator)
(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda () (fci-mode t)))
(global-fci-mode t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(define-key global-map (kbd "RET") 'newline-and-indent)

(setq-default tab-width 4 indent-tabs-mode nil)

;;; Highlight parentheses. to use: M-x highlight-parentheses
(add-to-list 'load-path "~/.emacs.d/highlight-parentheses")
(require 'highlight-parentheses)
(setq hl-paren-colors '("red" "orange" "cyan" "magenta" "green" "black" "black"))
(highlight-parentheses-mode 1)
;(defun hpm-on ()
;(highlight-parentheses-mode 1))
;(add-hook 'ess-mode-hook 'hpm-on)
;(add-hook 'inferior-ess-mode-hook 'hpm-on)
;(add-hook 'c-mode-hook 'hpm-on) ;; auto use in c-mode
;(add-hook 'emacs-lisp-mode-hook 'hpm-on)  ;; auto use in lisp

;;; AUTO PAIR
(add-to-list 'load-path "~/.emacs.d/autopair") ;; comment if autopair.el is in standard load path
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers
(setq autopair-autowrap 1)
(add-hook 'c-mode-hook
           #'(lambda ()
               (push '(?< . ?>)
                     (getf autopair-extra-pairs :code)))) ;; auto pair <>
