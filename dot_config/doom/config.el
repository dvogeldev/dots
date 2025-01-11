(setq user-full-name "David Vogel"
  user-mail-address "dvogelca@proton.me")

(setq kill-whole-line t)

(setq display-line-numbers-type 'relative)

(setq auto-save-default t
      make-backup-files t)

(setq-default tab-width 2
              evil-shift-width 2
              indent-tabs-mode nil)

(setq shell-file-name (executable-find "bash"))
(setq-default vterm-shell (executable-find "fish"))

(use-package gcmh
  :init
  (gcmh-mode 1)
  :config
  (setq gcmh-idle-delay 5
        gcmh-high-cons-threshold (* 32 1024 1024)))

;; The default is 800 kilobytes.  Measured in bytes.
;;   (setq gc-cons-threshold (* 50 1000 1000))
;;
   (defun btwiue/display-startup-time ()
     (message "Emacs loaded in %s with %d garbage collections."
              (format "%.2f seconds"
                      (float-time
                        (time-subtract after-init-time before-init-time)))
              gcs-done))

   (add-hook 'emacs-startup-hook #'btwiue/display-startup-time)
(setq read-process-output-max (* 1024 1024))    ;       Increase read chunk size
(setq process-adaptive-read-buffering nil)      ;       Disable adaptive buffering

(use-package auto-package-update
  :defer 10     ;       Delay loading by 10 seconds after startup
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))

(setq doom-font (font-spec :family "GeistMono Nerd Font" :size 18)
      doom-variable-pitch-font (font-spec :family "Poppins" :size 18)
      doom-big-font (font-spec :family "GeistMono Nerd Font" :size 54))

;; Allow mixed fonts in a buffer.
;; (add-hook! 'org-mode-hook #'mixed-pitch-mode)
(add-hook! 'org-mode-hook
           markdown-mode-hook)
        #'mixed-pitch-mode)

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(setq epg-gpg-program "/usr/bin/gpg")
; (setq doom-theme 'catppuccin)
; (setq catppuccin-flavor 'macchiato)

(setq modus-themes-mode-line '(borderless accented ))
;; (setq modus-themes-mode-line '(borderless accented padded))
(setq modus-themes-region '(bg-only accented))
(setq modus-themes-completions '(opinionated))

(setq modus-themes-bold-constructs t)
(setq modus-themes-italic-constructs t)
;; (setq modus-themes-paren-match '(bold intense ))
(setq modus-themes-syntax '(yellow-comments))

(setq modus-themes-headings
      '((1 . (rainbow overline background 1.4))
        (2 . (rainbow background 1.3))
        (3 . (rainbow bold 1.2))
        (4 . (semi-light 1.1))))
(setq modus-themes-scale-headings t)
(setq modus-themes-org-blocks '(tinted-background))
;;(setq doom-theme 'modus-vivendi)

(setq projectile-project-search-path '(("~/projects" .2) ("~/btwiue" .1)))

(use-package! treemacs
  :defer t      ;       Only when needed
  :config
  (treemacs-follow-mode t)
  (treemacs-project-follow-mode t)
  (custom-set-faces
   '(treemacs-root-face ((t (:inherit variable-pitch :height 1.2 :weight bold))))
   '(treemacs-directory-face ((t (:inherit variable-pitch))))
   '(treemacs-file-face ((t (:inherit variable-pitch))))))

(setq org-directory "~/org")
(setq org-ellipsis " ▾")
(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(g)" "DONE(d)")))

(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.2))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
)
(setq org-agenda-files '("~/org/"))
(setq org-agenda-custom-commands
      '(("n" "My Weekly Agenda"
         ((agenda "" nil)
          (todo "DOING" nil)
          (todo "TODO" nil)
          (todo "DONE" nil))
         nil)))
(add-hook 'org-mode-hook
            (lambda ()
              (define-key org-mode-map (kbd "s-i") 'org-clock-in)
              (define-key org-mode-map (kbd "s-o") 'org-clock-out)
              (define-key org-mode-map (kbd "s-d") 'org-todo)))
(with-eval-after-load 'org-agenda
  ;;(define-key org-mode-map (kbd "s-p") 'org-pomodoro)
  (setq org-agenda-custom-commands
        '(("n" "My Weekly Agenda"
           ((agenda "" nil)
            (todo "DOING" nil)
            (todo "TODO" nil)
            (todo "DONE" nil))
           nil)
          ("p" "Pomodoro Agenda"
           ((agenda "" nil)
            (todo "DOING" nil)
            (org-pomodoro))
           nil)))

(setq org-download-screenshot-method "gnome-screenshot -a -f $s"))

;;(after org-pomodoro
;;  (setq org-pomodoro-length 25)
;;  (setq org-pomodoro-short-break-length 5)
;;  (setq org-pomodoro-long-break-length 15)
;;  (setq org-pomodoro-format "%s")
;;  (setq org-pomodoro-timer-set-hook
;;        (lambda ()
;;          (message "Pomodoro started")))
;;  (setq org-pomodoro-timer-finished-hook
;;        (lambda ()
;;          (message "Pomodoro finished"))))
  ;;(map :leader
   ;;     (:prefix-map ("y" . "pomodoro")
    ;;      :desc "Start Pomodoro" "s" #'org-pomodoro
     ;;     :desc "Stop Pomodoro" "q" #'org-pomodoro-kill
      ;;    :desc "Pause Pomodoro" "p" #'org-pomodoro-pause
       ;;   :desc "Resume Pomodoro" "r" #'org-pomodoro-resume)))

;; Configuration for Denote with specific directories for notes and j)ournal
(use-package denote
  :after org
  :custom
  (denote-directory (expand-file-name "~/Documents/notes"))
  :config
  (setq denote-known-keywords '("project" "documentation" "emacs" "development")
        denote-file-type nil ; Org is the default, set to 'markdown for markdown files
        denote-prompts '(title keywords)
        denote-sort-keywords t
        denote-infer-keywords t
        denote-link-backlinks-display-buffer-action t))

  ;; Keybindings
  (map! :leader
        :desc "Create a new Denote note" "d n" #'denote
        :desc "Open or create Denote file" "d f" #'denote-open-or-create
        :desc "Denote date" "d d" #'denote-date
        :desc "Search Denote notes" "d s" #'denote-search
        :desc "Link Denote notes" "d l" #'denote-link
        :desc "View Denote backlinks" "d b" #'denote-backlinks
        :desc "Rename Denote file" "d r" #'denote-rename-file)

(after! org
  (setq org-capture-templates
        '(("s" "System KB" entry
           (file+headline "~/Documents/notes/system.org" "System Knowledge Base")
           "* %^{Title}\n:PROPERTIES
                      :ID: %(denote-create-note)\n:END:\n\n%?"
           :empty-lines 1)

          ("p" "Project Note" entry
           (file+headline "~/Local Sites/%(read-string \"Project name: \")/app/public/docs/project.org" "Project Notes")
           "* %^{Title}\n:PROPERTIES:\n:ID: %(denote-create-note)\n:END:\n\n%?"
           :empty-lines 1
           :immediate-finish t)

          ("t" "Topic for Further Research" entry
           (file+headline "~/Documents/notes/research.org" "Topics for Further Research")
           "* %^{Title}\n:PROPERTIES:\n:ID: %(denote-create-note)\n:END:\n\n%?"
           :empty-lines 1
           :immediate-finish t))))

(setenv "dvpc" "/ssh:david@192.168.1.210#5784:")
(setenv "dvtp" "/ssh:david@192.168.1.205#5784:")
(defun my-tramp-shell-prompt ()
  "Customize Tramp shell prompt based on the interactive shell."
  (cond ((string-match-p "bash" (getenv "SHELL"))
         (setq tramp-shell-prompt-pattern "\\(?:^\\|\\)[^#$%>\n]*[#$%>] *"))
        ((string-match-p "fish" (getenv "SHELL"))
         (setq tramp-shell-prompt-pattern "^\\(?:[^@\\n]+@[^@\\n]+\\|\\)[^#$%>\n]*[#$%>] *"))
        ((string-match-p "zsh" (getenv "SHELL"))
         (setq tramp-shell-prompt-pattern "^\\(?:[^@\\n]+@[^@\\n]+\\|\\)[^#$%>\n]*[#$%>] *"))
        (t (setq tramp-shell-prompt-pattern "^.* $"))))
(add-hook 'tramp-mode-hook 'my-tramp-shell-prompt)
(after! tramp
  (setq tramp-default-method "ssh")
  (setenv "SHELL" "/usr/bin/fish"))

(map! :leader
      (:prefix ("F" . "frames")
       :desc "New frame" "n" #'make-frame-command
       :desc "Delete frame" "d" #'delete-frame
       :desc "Next frame" "f" #'other-frame))

(defun btwiue/split-window-and-display-image ()
  "Split the window vertically and display the image in the right window."
  (interactive)
  (let ((image-buffer (current-buffer)))
    (when (eq major-mode 'image-mode)
      (delete-other-windows)  ; Ensure there's only one window before splitting
      (split-window-right)
      (set-window-buffer (next-window) image-buffer)
      (select-window (next-window)))))

(defun btwiue/close-image-window ()
  "Close the image window and return to the Dired buffer."
  (interactive)
  (when (eq major-mode 'image-mode)
    (kill-buffer-and-window)))

(add-hook 'image-mode-hook
          (lambda ()
            (local-set-key (kbd "q") (lambda ()
                                       (interactive)
                                       (kill-buffer-and-window)))
            (btwiue/split-window-and-display-image)))

;; Toggle between Modus Operandi and Modus Vivendi themes
(defun toggle-modus-themes ()
  (interactive)
  (if (eq doom-theme 'modus-operandi)
      (progn
        (setq doom-theme 'modus-vivendi)
        (load-theme 'modus-vivendi t))
    (progn
      (setq doom-theme 'modus-operandi)
      (load-theme 'modus-operandi t))))

(map! :leader
      :desc "Toggle Modus Themes"
      "t m" #'toggle-modus-themes)

(add-to-list 'auto-mode-alist '("Justfile\\'" . makefile-mode))
(add-hook 'makefile-mode-hook
          (lambda ()
            (setq tab-width 4)))

(use-package! apheleia
:config
(add-to-list 'apheleia-formatters '(my-formatter "npx" "prettier" "--stdin-filepath" filepath)))

(when (getenv "WAYLAND_DISPLAY")
  (setq interprogram-paste-function
        (lambda ()
          (shell-command-to-string "wl-paste -n | tr -d '/r' "))))
(delete-selection-mode 1)
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-selection-value)
(setq x-select-enable-clipboard t)

(defun my-md-to-org-region (start end)
  "Convert region from markdown to org"
  (interactive "r")
  (shell-command-on-region start end "pandoc -f markdown -t org" t t))

;; Configure Codeium
(use-package codeium
  :init
  ;; Use globally or on a specific hook
  (add-to-list 'completion-at-point-functions #'codeium-completion-at-point)
  ;; Alternatively, use on a hook
  ;; (add-hook 'python-mode-hook
  ;;           (lambda ()
  ;;             (setq-local completion-at-point-functions '(codeium-completion-at-point))))
  :config
  ;; Disable popup boxes
  (setq use-dialog-box nil)
  ;; Optionally set API key (do not hardcode in config files for security reasons)
  ;; (setq codeium/metadata/api_key "your-api-key-here")
  ;; Get Codeium status in the modeline
  (setq codeium-mode-line-enable (lambda (api) (not (memq api '(CancelRequest Heartbeat AcceptCompletion)))))
  (add-to-list 'mode-line-format '(:eval (car-safe codeium-mode-line)) t)

  ;; Limit the string sent to Codeium for better performance
  (defun my-codeium/document/text ()
    (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (min (+ (point) 1000) (point-max))))
  (defun my-codeium/document/cursor_offset ()
    (codeium-utf8-byte-length (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (point))))
  (setq codeium/document/text 'my-codeium/document/text)
  (setq codeium/document/cursor_offset 'my-codeium/document/cursor_offset))

;; If you want multiple completion backends, use cape
;; (use-package cape
;;   :after minemacs
;;   :config
;;   (add-hook 'python-mode-hook
;;             (lambda ()
;;               (setq-local completion-at-point-functions
;;                           (list (cape-super-capf #'codeium-completion-at-point #'lsp-completion-at-point))))))

;; Add Corfu package
(use-package corfu
  :after minemacs
  :custom
  (corfu-cycle t)               ; Enable cycling for `corfu-next`/`corfu-previous`
  (corfu-auto t)                 ; Automatically start completion
  (corfu-commit-on-ret t)        ; Commit selected candidate on RET
  (corfu-quit-at-boundary t)     ; Automatically quit at word boundary
  (corfu-quit-no-match t)        ; Automatically quit if there is no match
  (corfu-preview-current nil)    ; Do not display the current candidate in the echo area
  (corfu-preselect-first nil)    ; Do not preselect the first candidate
  :config
  (global-corfu-mode))

;; Optionally, you can customize the Corfu UI
(use-package corfu-doc
  :after corfu
  :config
  (corfu-doc-mode))

(use-package kind-icon
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))
