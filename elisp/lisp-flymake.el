(defun flymake-elisp-init ()
  (unless (string-match "^ " (buffer-name))
    (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))
           (local-file  (file-relative-name
                         temp-file
                         (file-name-directory buffer-file-name))))
      (list
       (expand-file-name invocation-name invocation-directory)
       (list
        "-Q" "--batch" "--eval" 
        (prin1-to-string
         (quote
          (dolist (file command-line-args-left)
            (with-temp-buffer
              (insert-file-contents file)
              (condition-case data
                  (scan-sexps (point-min) (point-max))
                (scan-error
                 (goto-char(nth 2 data))
                 (princ (format "%s:%s: error: Unmatched bracket or quote\n"
                                file (line-number-at-pos)))))))
          )
         )
        local-file)))))
(push '("\\.el$" flymake-elisp-init) flymake-allowed-file-name-masks)
(add-hook 'emacs-lisp-mode-hook
          ;; workaround for (eq buffer-file-name nil)
          (lambda ()
	      ;;(if buffer-file-name (flymake-mode))
	    (flymake-find-file-hook)
	    ))

(provide 'lisp-flymake)
