;;; nas/lsp.el -*- lexical-binding: t; -*-

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
    (add-to-list 'lsp-file-watch-ignored-directories dir))

  ;; lsp-mode persists all workspaces to ~/.emacs.d/.lsp-session-v1 (or
  ;; ~/.config/emacs/.lsp-session-v1). On startup, it re-initializes ALL
  ;; previously opened projects, even if you have no buffers from them open.
  ;; Set to nil to disable this persistence entirely, or use
  ;; M-x lsp-workspace-folders-remove to selectively prune old projects.
  ;; See: https://github.com/emacs-lsp/lsp-mode/issues/3502
  (setq lsp-session-file nil))

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

(add-to-list 'auto-mode-alist '("\\.astro\\'\\." . typescript-mode))
