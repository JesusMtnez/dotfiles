;;; neotree-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "neotree" "../../../../.emacs.d/elpa/neotree-20150726.636/neotree.el"
;;;;;;  "ddc6b36a11bcfe29cec1fa40048b7985")
;;; Generated autoloads from ../../../../.emacs.d/elpa/neotree-20150726.636/neotree.el

(autoload 'neotree-find "neotree" "\
Quick select node which specified PATH in NeoTree.
If path is nil and no buffer file name, then use DEFAULT-PATH,

\(fn &optional PATH DEFAULT-PATH)" t nil)

(autoload 'neotree-projectile-action "neotree" "\
Integration with `Projectile'.

Usage:
    (setq projectile-switch-project-action 'neotree-projectile-action).

When running `projectile-switch-project' (C-c p p), `neotree' will change root
automatically.

\(fn)" t nil)

(autoload 'neotree-toggle "neotree" "\
Toggle show the NeoTree window.

\(fn)" t nil)

(autoload 'neotree-show "neotree" "\
Show the NeoTree window.

\(fn)" t nil)

(autoload 'neotree-hide "neotree" "\
Close the NeoTree window.

\(fn)" t nil)

(autoload 'neotree-dir "neotree" "\
Show the NeoTree window, and change root to PATH.

\(fn PATH)" t nil)

(defalias 'neotree 'neotree-show "\
Show the NeoTree window.")

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/neotree-20150726.636/neotree-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/neotree-20150726.636/neotree-pkg.el"
;;;;;;  "../../../../.emacs.d/elpa/neotree-20150726.636/neotree.el")
;;;;;;  (21941 14666 495937 479000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; neotree-autoloads.el ends here
