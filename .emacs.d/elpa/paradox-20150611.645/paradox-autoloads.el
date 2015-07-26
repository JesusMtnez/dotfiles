;;; paradox-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "paradox" "../../../../.emacs.d/elpa/paradox-20150611.645/paradox.el"
;;;;;;  "6c9967302bf409c8a76354797a67cd53")
;;; Generated autoloads from ../../../../.emacs.d/elpa/paradox-20150611.645/paradox.el

(autoload 'paradox-list-packages "paradox" "\
Improved version of `package-list-packages'.  The heart of Paradox.
Function is equivalent to `package-list-packages' (including the
prefix NO-FETCH), but the resulting Package Menu is improved in
several ways.

Among them:

1. Uses `paradox-menu-mode', which has more functionality and
keybinds than `package-menu-mode'.

2. Uses some font-locking to improve readability.

3. Optionally shows the number GitHub stars and Melpa downloads
for packages.

4. Adds useful information in the mode-line.

\(fn NO-FETCH)" t nil)

(autoload 'paradox-upgrade-packages "paradox" "\
Upgrade all packages.  No questions asked.
This function is equivalent to `list-packages', followed by a
`package-menu-mark-upgrades' and a `package-menu-execute'.  Except
the user isn't asked to confirm deletion of packages.

If `paradox-execute-asynchronously' is non-nil, part of this
operation may be performed in the background.

The NO-FETCH prefix argument is passed to `list-packages'.  It
prevents re-download of information about new versions.  It does
not prevent downloading the actual packages (obviously).

\(fn &optional NO-FETCH)" t nil)

(autoload 'paradox-require "paradox" "\
Like `require', but also install FEATURE if it is absent.
FILENAME is passed to `require'.
If NOERROR is non-nil, don't complain if the feature couldn't be
installed, just return nil.

- If FEATURE is present, `require' it and return t.

- If FEATURE is not present, install PACKAGE with `package-install'.
If PACKAGE is nil, assume FEATURE is the package name.
After installation, `require' FEATURE.

By default, the current package database is only updated if it is
empty.  Passing a non-nil REFRESH argument forces this update.

\(fn FEATURE &optional FILENAME NOERROR PACKAGE REFRESH)" nil nil)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/paradox-20150611.645/paradox-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/paradox-20150611.645/paradox-commit-list.el"
;;;;;;  "../../../../.emacs.d/elpa/paradox-20150611.645/paradox-core.el"
;;;;;;  "../../../../.emacs.d/elpa/paradox-20150611.645/paradox-execute.el"
;;;;;;  "../../../../.emacs.d/elpa/paradox-20150611.645/paradox-github.el"
;;;;;;  "../../../../.emacs.d/elpa/paradox-20150611.645/paradox-menu.el"
;;;;;;  "../../../../.emacs.d/elpa/paradox-20150611.645/paradox-pkg.el"
;;;;;;  "../../../../.emacs.d/elpa/paradox-20150611.645/paradox.el")
;;;;;;  (21941 14654 357797 946000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; paradox-autoloads.el ends here
