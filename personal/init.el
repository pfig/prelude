;; This needs to be ran after Prelude (which loads exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
;; How to copy specific envvars:
;;(exec-path-from-shell-copy-env "PYTHONPATH")

(when (eq system-type 'darwin)
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char))

(define-key global-map (kbd "RET") 'newline-and-indent)

(require 'fill-column-indicator)
(setq-default fill-column 72)
(setq fci-rule-column 120)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)
