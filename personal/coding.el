(defun my-coding-hook ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t)
  (linum-mode t)
  (if window-system (hl-line-mode t))
  (idle-highlight-mode t))

(add-hook 'emacs-lisp-mode-hook 'my-coding-hook)
(add-hook 'ruby-mode-hook 'my-coding-hook)
(add-hook 'python-mode-hook 'my-coding-hook)
(add-hook 'clojure-mode-hook 'my-coding-hook)

(require 'clj-refactor)
(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1)
  (cljr-add-keybindings-with-prefix "C-c C-m"))
(add-hook 'clojure-mode-hook 'my-clojure-mode-hook)
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))

(elpy-enable)
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")
;;(setq python-shell-interpreter "ipython"
;;      python-shell-interpreter-args "-i --simple-prompt")
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
