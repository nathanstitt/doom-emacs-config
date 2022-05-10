(require 'flycheck)

;; (flycheck-add-mode 'typescript-tslint 'typescript-tsx-mode)
;; (flycheck-add-next-checker 'lsp 'typescript-tslint 'append)

;; (require 'tsx-mode)

(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)

(setq js2-strict-missing-semi-warning 'nil)

(add-hook! 'js2-mode-hook
  (unless (locate-dominating-file default-directory ".prettierrc")
    (format-all-mode -1)))

(add-hook! 'typescript-mode-hook
  (unless (locate-dominating-file default-directory ".prettierrc")
    (format-all-mode -1)))


;; (add-hook! 'js-mode-hook #'(flycheck-mode rainbow-delimiters-mode))

;; If it's available globally, use eslint_d
(setq flycheck-javascript-eslint-executable (executable-find "eslint_d"))


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

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (setq flycheck-typescript-tslint-config 'nil)

;  (add-to-list 'flycheck-checkers 'javascript-tide 'jsx-tide)
  (setq tide-completion-detailed t)

  (lambda ()
    (when (string-equal "js" (file-name-extension buffer-file-name))
      (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)))
  (lambda ()
    (when (string-equal "jsx" (file-name-extension buffer-file-name))
      (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)))

  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1)
    ;; company-backends setup
  (set (make-local-variable 'company-backends)
       '((company-tide company-files :with company-yasnippet)
         (company-dabbrev-code company-dabbrev))))

(add-hook! 'js-mode-hook #'setup-tide-mode)

; (add-hook 'js2-mode-hook #'setup-tide-mode)

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)
(setq sgml-basic-offset 4)
;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)

  ;; (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
  ;; (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)

(add-hook 'typescript-mode-hook #'setup-tide-mode)





;(flycheck-add-mode 'javascript-tide 'jsx-tide)


; (flycheck-add-mode 'typescript-tslint 'web-mode)
; (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
;(flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)
;(flycheck-add-next-checker 'javascript-eslint 'tsx-tide 'append)


;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (when (string-equal "tsx" (file-name-extension buffer-file-name))
;;               (setup-tide-mode))))
;; ;; enable typescript-tslint checker

