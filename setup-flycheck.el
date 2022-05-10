;;; setup-flycheck.el -*- lexical-binding: t; -*-

;; (require 'flycheck)

;;(setq flycheck-javascript-eslint-executable (executable-find "eslint_d"))

(defun nas-use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook 'nas-use-eslint-from-node-modules)


(defvar-local my/flycheck-local-cache nil)

(defun my/flycheck-checker-get (fn checker property)
  (or (alist-get property (alist-get checker my/flycheck-local-cache))
      (funcall fn checker property)))

;; (with-eval-after-load 'tree-sitter
;;   (add-to-list 'tree-sitter-major-mode-language-alist 'typescript-tsx-ts-mode))

(advice-add 'flycheck-checker-get :around 'my/flycheck-checker-get)

(add-hook 'lsp-managed-mode-hook
          (lambda ()
            (when (derived-mode-p 'tsx-mode)
              (progn
                (flycheck-add-mode 'javascript-eslint 'tsx-mode)
                (setq my/flycheck-local-cache '((lsp . ((next-checkers . (javascript-eslint))))))
                )
              )))

;; (use-package flycheck
;;   :config
;;   (flycheck-add-mode 'javascript-eslint 'tsx-mode)
;;   (global-flycheck-mode t))
;;


;; (setq +format-on-save-enabled-modes
;;       '(not emacs-lisp-mode  ; elisp's mechanisms are good enough
;; 	    sql-mode         ; sqlformat is currently broken
;; 	    tex-mode         ; latexindent is broken
;; 	    latex-mode))

;; (setq +format-with-lsp nil)

;;(progn
;;  (with-eval-after-load 'flycheck
;;    (flycheck-add-mode 'javascript-eslint 'typescript-tsx-ts-mode)
;;    (flycheck-add-next-checker 'javascript-eslint 'lsp)))


;;
;;

;; (lambda ()
;;   (when (string-equal "tsx" (file-name-extension buffer-file-name))
;;     (flycheck-add-next-checker 'javascript-eslint 'append)))

;; (progn
;;   (with-eval-after-load 'flycheck

;;     (defvar-local flycheck-local-checkers nil)

;;     (flycheck-add-mode 'javascript-eslint 'typescript-tsx-ts-mode)

;;     (defun flycheck-checker-get (fn checker property)
;;       (or (alist-get property (alist-get checker flycheck-local-checkers))
;;           (funcall fn checker property)))

;;     (advice-add 'flycheck-checker-get :around 'flycheck-checker-get)

;;     (add-hook 'lsp-managed-mode-hook
;;               (lambda ()
;;                 (when (derived-mode-p 'typescript-tsx-ts-mode)
;;                   (setq flycheck-local-checkers '((lsp . ((next-checkers . (javascript-eslint)))))))

;;                 (when (derived-mode-p 'sh-mode)
;;                   (setq flycheck-local-checkers '((lsp . ((next-checkers . (sh-shellcheck)))))))

;;                 (when (derived-mode-p 'go-mode)
;;                   (setq flycheck-local-checkers '((lsp . ((next-checkers . (golangci-lint)))))))
;;       ))
;;   ))
