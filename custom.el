(setq exec-path (append exec-path '("/opt/homebrew/bin" "/usr/local/bin")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-indent-guides-method 'character)
 '(package-selected-packages
   '(typescript-mode rainbow-delimiters company-terraform terraform-doc terraform-mode exec-path-from-shell tree-sitter-langs origami))
 '(safe-local-variable-values
   '((web-mode-css-indent-offset . 2)
     (web-mode-code-indent-offset . 2)
     (web-mode-markup-indent-offset . 2)
     (web-mode-indent-style . 2)
     (web-mode-attr-indent-offset . 2)
     (coffee-tab-width . 2)
     (js2-basic-offset . 2)
     (enh-ruby-indent-level . 4)
     (js2-basic-offset . 4)))
 '(warning-suppress-log-types '((emacs) (emacs)))
 '(warning-suppress-types '((before-save-hook) (emacs))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
