;;; simple-httpd-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "simple-httpd" "../../../../.emacs.d/elpa/simple-httpd-1.4.6/simple-httpd.el"
;;;;;;  "ce1e2f10b5ced7864b2cce3ec3caa7ff")
;;; Generated autoloads from ../../../../.emacs.d/elpa/simple-httpd-1.4.6/simple-httpd.el

(autoload 'httpd-start "simple-httpd" "\
Start the web server process. If the server is already
running, this will restart the server. There is only one server
instance per Emacs instance.

\(fn)" t nil)

(autoload 'httpd-stop "simple-httpd" "\
Stop the web server if it is currently running, otherwise do nothing.

\(fn)" t nil)

(autoload 'httpd-serve-directory "simple-httpd" "\
Start the web server with given `directory' as `httpd-root'.

\(fn DIRECTORY)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/simple-httpd-1.4.6/simple-httpd-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/simple-httpd-1.4.6/simple-httpd.el")
;;;;;;  (21843 7119 193240 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; simple-httpd-autoloads.el ends here
