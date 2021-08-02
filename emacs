;; ____________________________________________________________________________
;; Aquamacs custom-file warning:
;; Warning: After loading this .emacs file, Aquamacs will also load
;; customizations from `custom-file' (customizations.el). Any settings there
;; will override those made here.
;; Consider moving your startup settings to the Preferences.el file, which
;; is loaded after `custom-file':
;; ~/Library/Preferences/Aquamacs Emacs/Preferences
;; _____________________________________________________________________________

;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)

;; Make Org mode work with files ending in .org
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq org-directory "~/Documents/org")
(setq org-agenda-files (list "~/Documents/org/inbox.org"
                             "~/Documents/org/project.org"
			     "~/Documents/org/tickler.org"))
			     
(define-key global-map (kbd "C-c a") 'org-agenda)

(setq org-refile-targets (quote (("~/Documents/org/project.org" :maxlevel . 3)
                                 ("~/Documents/org/tickler.org" :level . 1)
                                 ("~/Documents/org/someday.org" :level . 2))))
				 

(setq org-capture-templates
       `(("i" "Inbox" entry  (file "inbox.org")
        ,(concat "* TODO %?\n"
                 "/Entered on/ %U"))))

(define-key global-map (kbd "C-c c") 'org-capture)

(defun org-capture-inbox ()
     (interactive)
     (call-interactively 'org-store-link)
     (org-capture nil "i"))

(define-key global-map (kbd "C-c i") 'org-capture-inbox)

(setq org-agenda-hide-tags-regexp "inbox")

(setq org-todo-keywords
      '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-log-done 'time)
