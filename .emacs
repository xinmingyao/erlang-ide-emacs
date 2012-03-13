(setq load-path(cons "~/elisp/common/color-theme-6.6.0/" load-path))
(setq load-path(cons "~/elisp/common/tabbar/" load-path))
(setq load-path(cons "~/elisp/common" load-path))
(setq load-path(cons "~/elisp/common/yasnippet-0.6.1c/" load-path))
;;(setq load-path(cons "~/elisp/wrangler/elisp/" load-path))
(setq load-path(cons "~/elisp/erlang-emacs-extend/elisp/" load-path))

(require 'yasnippet)
(setq yas/root-directory "~/elisp/common/yasnippet-0.6.1c/snippets")
(yas/initialize)
(yas/load-directory yas/root-directory)
(require 'wb-line-number)
;;(wb-line-number-toggle)
(require 'hl-line)
(hl-line-mode 1)
;; speedbar
(require 'sr-speedbar)
;;(sr-speedbar-toggle)
(setq speedbar-directory-unshown-regexp "^\\(CVS\\|RCS\\|SCCS\\|\\.\\.*$\\)\\'")
;; This is needed for esense setup
(setq speedbar-show-unknown-files (not speedbar-show-unknown-files))
;;(speedbar-refresh)
(xterm-mouse-mode t)
(mouse-wheel-mode t)
;;setq load-path (cons "~/elisp/esense-1.12" load-path))
(setq load-path (cons "~/elisp" load-path))
;; This is needed for Erlang mode setup
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq load-path (cons "/usr/local/lib/erlang/lib/tools-2.6.6.2/emacs" load-path))
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
(require 'erlang-start)
;; This is needed for Distel setup
(let ((distel-dir "~/elisp/distel/elisp"))
  (unless (member distel-dir load-path)
    ;; Add distel-dir to the end of load-path
    (setq load-path (append load-path (list distel-dir)))))

;;(setq erl-nodename-cache 'distel@erlang.ide)
;;(set distel-modeline-node "distel")
(require 'distel)
(distel-setup)

;; esense
;;(require 'esense)
;;(esense-mode t)
;;(require 'esense-trace)
;;(setq esense-indexer-program "~/elisp/esense-1.12/esense.sh")
;;(global-set-key (kbd "<f2>") 'esense-mode)
;;(require 'esense-start)
;; A number of the erlang-extended-mode key bindings are useful in the shell too
(defconst distel-shell-keys
  '(("\C-\M-i"   erl-complete)
    ("\M-?"      erl-complete)	
    ("\M-]"      erl-find-source-under-point)
    ("\M-,"      erl-find-source-unwind) 
    ("\M-/"      erl-find-source-unwind) 
    )
  "Additional keys to bind when in Erlang shell.")

;;(require 'wrangler)
;;(toggle-erlang-wrangler)

(global-set-key [f5] 'my-speedbar)
;;(load-library "flymake-cursor")
;;(add-to-list  'etags-table-alist 
;;	       '("." "~/tool/otp_src_R14B01/"))

(defun my-speedbar()
	(interactive "")
(if (not (sr-speedbar-exist-p))
	(sr-speedbar-open)
	(sr-speedbar-close)
)
	) 
;;(require 'ecb)

(put 'upcase-region 'disabled nil)
(setq inhibit-splash-screen t)

(defun my-maximized ()
(interactive)
(x-send-client-message
nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
(x-send-client-message
nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
)
;;(my-maximized) ;; 

(setq auto-save-default nil) 
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((erlang-indent-level . 4)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(require 'auto-complete)
(require 'auto-complete-config)
;;(require 'auto-complete-etags)

(require 'auto-complete-distel)
(add-to-list 'load-path "~/elisp/common/")
;;(require 'etags-table)
(add-to-list 'ac-dictionary-directories "~/elisp/common/dict")
(ac-config-default)
(global-auto-complete-mode 1)

;;(setq-default ac-sources '(ac-source-distel))
(setq-default ac-sources '(
		  ac-source-yasnippet  
		  ac-source-semantic  
                  ac-source-imenu  
                  ac-source-abbrev  
                  ac-source-words-in-buffer  
                  ;;ac-source-files-in-current-dir  
                  ac-source-filename)
                  ) 

(require 'extend-erlang-distel)
(defvar dark-background nil)

(defun toggle-dark-background ()
  (interactive)
  (let ((difficult-colors
         '("red" "blue" "medium blue")))
    (mapc
     (lambda (face)
       (and (member (face-attribute face :foreground)  difficult-colors)
            (set-face-bold-p face (not dark-background))))
     (face-list)))
  (setq dark-background (not dark-background)))
;;(toggle-dark-background)
(require 'color-theme)
(color-theme-initialize)
;;(color-theme-jsc-light)
;;(color-theme-dark-blue2)
;;(my-color-theme-aalto-light)
(require 'tabbar)
(tabbar-mode)
(menu-bar-mode -1)
(add-hook 'emacs-lisp-mode-hook 
	  (lambda()
	    (let* ((lisp-tags))
	      (setq tags-table-list '("~/elisp/common/color-theme-6.6.0" 
				      "~/elisp/common/color-theme-6.6.0/themes"  
				      "~/elisp"
				      "~/elisp/distel/elisp" 
				      "/home/elisp/tool/emacs-23.1/lisp")))))
	    
(set-face-background 'region "wheat3")
