;; https://gist.github.com/rangeoshun/67cb17392c523579bc6cbd758b2315c1
;; Assign typescript-mode to .tsx files

;; Assign typescript-mode to .tsx files
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

;; Create submodules for multiple major modes
(require 'mmm-mode)
(setq mmm-global-mode t)
(setq mmm-submode-decoration-level 0) ;; Turn off background highlight
(setq mmm-parse-when-idle t)

;; Add css mode for CSS in JS blocks
(mmm-add-classes
  '((mmm-styled-mode
    :submode scss-mode
    :front "\\(styled\\|css\\)[.()<>[:alnum:]]?+`"
    :front-offset 1
    :back "`;")))

(mmm-add-mode-ext-class 'typescript-mode nil 'mmm-styled-mode)


;; ;; Add css mode for CSS in JS blocks
;; (mmm-add-classes
;;   '((mmm-styled-mode
;;     :submode css-mode
;;     :front "\\(styled\\|css\\)[.()<>[:alnum:]]?+`"
;;     :back "`;")))

;; (mmm-add-mode-ext-class 'typescript-mode nil 'mmm-styled-mode)

;; ;; Add submodule for graphql blocks
;; (mmm-add-classes
;;   '((mmm-graphql-mode
;;     :submode graphql-mode
;;     :front "gr?a?p?h?ql`"
;;     :back "`;")))

;; (mmm-add-mode-ext-class 'typescript-mode nil 'mmm-graphql-mode)

;; ;; Add JSX submodule, because typescript-mode is not that great at it
;; (mmm-add-classes
;;   '((mmm-jsx-mode
;;      :front "\\(return\s\\|n\s\\|(\n\s*\\)<"
;;      :front-offset -1
;;      :back ">\n?\s*)"
;;      :back-offset 1
;;      :submode web-mode)))

;; (mmm-add-mode-ext-class 'typescript-mode nil 'mmm-jsx-mode)

;; (defun mmm-reapply ()
;;   (mmm-mode)
;;   (mmm-mode))

;; (add-hook 'after-save-hook
;;           (lambda ()
;;             (when (string-match-p "\\.tsx?" buffer-file-name)
;;               (mmm-reapply))))
