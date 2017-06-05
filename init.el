
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (wheatgrass))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(set-frame-parameter (selected-frame) 'alpha (list 75 70))
(add-to-list 'default-frame-alist (cons 'alpha (list 75 70)))



;; my custom keymap
(define-key global-map (kbd "C-x C-o") 'other-window)


;; disable emacs autosave ( #file# )
(setq auto-save-default nil) ;; By default on is t ,nil is off
(setq make-backup-files nil) ;; By default on is t ,nil is off


;;
;; ace jump mode major function
;;

(add-to-list 'load-path "~/.emacs.d/diy/ace-jump-mode-master")
(autoload
  'ace-jump-mode
   "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you qprefer to

(define-key global-map (kbd "C-c C-SPC") 'ace-jump-mode)

 

;; 
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-c C-x C-SPC") 'ace-jump-mode-pop-mark)


;;sr-speedbar
 
(add-to-list 'load-path "~/.emacs.d/diy")
(require 'sr-speedbar)
(global-set-key (kbd "C-x C-\\") 'sr-speedbar-toggle)

;;window-numbering

(require 'window-numbering)
(window-numbering-mode 1)

;;
;;This sector is about initial style 
;;

(setq initial-frame-alist '((top . 0) (left . 0) (width . 171) (height . 52)));;maxmize frame after launch

(set-default-font "-*-Menlo-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1");;deafault font

(tool-bar-mode 0);;hide toolbar

;;
;;This secotr over
;;



;;format xml
(defun xml-pretty (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t) 
        (backward-char) (insert "\n"))
      (indent-region begin end))
    (message "Ah, much better!"))


(set-default-font "-*-Menlo-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")

