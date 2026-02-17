;;; key-bindings.el -*- lexical-binding: t; -*-

(map!
 "C-l"           #'switch-to-previous-buffer
 "C-x m"         #'magit-status
 "C-c C-w"       #'copy-word
 "C-x C-c"       #'projectile-find-file
 "C-M-<right>"   #'shift-right
 "C-M-<left>"    #'shift-left
 "C-/"           #'comment-dwim
 "C-c C-v"       #'save-all-and-compile
 "C-."           #'+lookup/definition
 "C-M-r"         #'query-replace
 )
