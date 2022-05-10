
;;(require 'tsx-mode)
(use-package! tsx-mode)


;; :config
  ;; (add-to-list 'tree-sitter-major-mode-language-alist '(typescript-tsx-ts-mode . tsx)))
;;(add-hook! typescript-mode 'lsp!)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-mode))
;; (add-to-list 'auto-mode-alist '("\\.tsx$" . tsx-mode))

(setq tsi-typescript-indent-offset 4)

;; (tsi-typescript-mode t)

;; (straight-use-package '(tsi :type git :host github :repo "orzechowskid/tsi.el"))


;; (use-package! typescript-mode
;;   :init
;;   (define-derived-mode typescript-tsx-ts-mode typescript-mode "typescript-tsx")
;;   (add-to-list 'auto-mode-alist (cons (rx ".tsx" string-end) #'typescript-tsx-ts-mode))
;;   t)

;; (add-hook! typescript-mode 'lsp!)
;; (add-hook! typescript-tsx-ts-mode 'lsp!)

;; (use-package! tree-sitter
;;   :hook (prog-mode . turn-on-tree-sitter-mode)
;;   :hook (tree-sitter-after-on . tree-sitter-hl-mode)
;;   :init
;;   :config
;;   (require 'tree-sitter-langs)
;;   (tree-sitter-require 'tsx)
;;   (add-to-list 'tree-sitter-major-mode-language-alist '(typescript-tsx-ts-mode . tsx))
;;   ;; This makes every node a link to a section of code
;;   (setq tree-sitter-debug-jump-buttons t
;;         ;; and this highlights the entire sub tree in your code
;;         tree-sitter-debug-highlight-jump-region t))






;; (after! tree-sitter
;;   (add-to-list 'tree-sitter-major-mode-language-alist '(typescript-tsx-ts-mode . tsx)))

;; (with-eval-after-load 'tree-sitter
;;   (add-to-list 'tree-sitter-major-mode-language-alist '(typescript-tsx-ts-mode . tsx)))


;; (add-load-path! "tsi")
;; (require 'tsx-mode)
;; (tsx-mode t)

;; (require 'flycheck)


;; (straight-use-package '(tsx-mode :type git :host github :repo "orzechowskid/tsx-mode.el"))

;; (require 'tsi)

;; (package! typescript-mode)
;;   ;; :init
;;   ;; (define-derived-mode typescript-tsx-ts-mode typescript-mode "typescript-tsx")
;;   ;; (add-to-list 'auto-mode-alist (cons (rx ".tsx" string-end) #'typescript-tsx-ts-mode))
;;   ;; )

;; (add-hook! typescript-tsx-ts-mode 'lsp!)

;; (use-package! tree-sitter
;;   :hook (prog-mode . turn-on-tree-sitter-mode)
;;   :hook (tree-sitter-after-on . tree-sitter-hl-mode)
;;   :config
;;   (require 'tree-sitter-langs)

;;   (tree-sitter-require 'tsx)
;;   (add-to-list 'tree-sitter-major-mode-language-alist '(typescript-tsx-ts-mode . tsx))

;;   ;; This makes every node a link to a section of code
;;   (setq tree-sitter-debug-jump-buttons t
;;         ;; and this highlights the entire sub tree in your code
;;         tree-sitter-debug-highlight-jump-region t))
