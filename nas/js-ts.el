;;; nas/js-ts.el -*- lexical-binding: t; -*-

(after! lsp-mode
  ;; Configure lsp-mode's file watcher exclusions (this is what prevents the fd exhaustion)
  (setq lsp-file-watch-threshold 2000)  ; warn above this many files
  (dolist (dir '("[/\\\\]\\.git\\'"
                 "[/\\\\]node_modules\\'"
                 "[/\\\\]\\.next\\'"
                 "[/\\\\]ios\\'"
                 "[/\\\\]DerivedData\\'"
                 "[/\\\\]tmp\\'"
                 "[/\\\\]dist\\'"
                 "[/\\\\]build\\'"
                 "[/\\\\]\\.cache\\'"
                 "[/\\\\]coverage\\'"
                 "[/\\\\]\\.turbo\\'"
                 "[/\\\\]\\.vercel\\'"))
    (add-to-list 'lsp-file-watch-ignored-directories dir)))

(use-package! lsp-vtsls
  :after lsp-mode
  :config
  (setq
   ;; show all LSP doc on minibuffer
   lsp-eldoc-render-all t
   ;; https://github.com/yioneko/vtsls#bad-performance-of-completion
   lsp-vtsls-server-side-fuzzy-match t
   lsp-vtsls-entries-limit 30)
  ;; TypeScript server's own watcher exclusions (separate from lsp-mode's watcher)
  (lsp-register-custom-settings
   '(("typescript.tsserver.watchOptions.excludeDirectories" ["**/node_modules" "**/.next" "**/dist" "**/build"]))))

(after! apheleia
  (set-formatter! 'biome '("npx" "biome" "format" "--stdin-file-path" filepath)
                  :modes '(js-mode js-ts-mode typescript-mode typescript-ts-mode tsx-ts-mode)))

(add-to-list 'auto-mode-alist '("\\.astro\\'\\." . typescript-mode))
