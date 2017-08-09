
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
 '(package-selected-packages (quote (evil dracula-theme)))
 '(tabbar-separator (quote (0.5))))

(load-theme 'dracula t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(set-frame-parameter (selected-frame) 'alpha (list 90 70))
(add-to-list 'default-frame-alist (cons 'alpha (list 75 70)))



;; custom keymap
(define-key global-map (kbd "C-x C-o") 'other-window)

;; change window size
(global-set-key (kbd "M-I") 'shrink-window) 
(global-set-key (kbd "M-K") 'enlarge-window) 
(global-set-key (kbd "M-J") 'shrink-window-horizontally) 
(global-set-key (kbd "M-L") 'enlarge-window-horizontally) 


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


;;This sector is about initial style 
(setq initial-frame-alist '((top . 0) (left . 0) (width . 156) (height . 58)));;maxmize frame after launch
(set-default-font "-*-Menlo-normal-normal-normal-*-20-*-*-*-m-0-iso10646-1");;deafault font
(tool-bar-mode 0);;hide toolbar




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







;;neotree
(add-to-list 'load-path "~/.emacs.d/diy/emacs-neotree-dev")
(require 'neotree)
(global-set-key (kbd "C-\\") 'neotree-toggle)

;;melpa
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packagesg
/")))
(package-initialize) ;; You might already have this line

;;evil-mode
(require 'evil)
(evil-mode 1)
(setq evil-default-state 'emacs) 

;;set C-d as ESC in N-mode
(define-key evil-insert-state-map (kbd "C-d") 'evil-change-to-previous-state) 
(define-key evil-normal-state-map (kbd "C-d") 'evil-force-normal-state) 
(define-key evil-replace-state-map (kbd "C-d") 'evil-normal-state) 
(define-key evil-visual-state-map (kbd "C-d") 'evil-exit-visual-state) 

;;set C-o as N-mode just one step
(define-key evil-emacs-state-map (kbd "C-o") 'evil-execute-in-normal-state) 

;;tab-bar


(global-set-key (kbd "C-x C-p") 'tabbar-backward-tab)
(global-set-key (kbd "C-x C-n") 'tabbar-forward-tab)
(global-set-key (kbd "C-x C-S-P") 'tabbar-backward-group)
(global-set-key (kbd "C-x C-S-N") 'tabbar-forward-group)  

