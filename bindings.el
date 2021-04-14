;;; ~/.doom.d/bindings.el -*- lexical-binding: t; -*-

(map!
 "C-l"           #'switch-to-previous-buffer
 "C-x m"         #'magit-status
 "C-x C-c"       #'projectile-find-file
 "C-S-<right>"   #'shift-right
 "C-S-<left>"    #'shift-left
 "C-c C-v"       #'save-all-and-compile
 "s-."           #'+lookup/definition
 "M-s-r"         #'query-replace
 "s-N"           #'next-error
 "s-f"           #'company-files
 )

(map! :leader
      (:prefix ("d" . "smerge")
        "n"  #'smerge-next
        "u"  #'smerge-keep-upper
        "l"  #'smerge-keep-lower
        ))
