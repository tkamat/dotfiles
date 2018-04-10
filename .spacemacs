;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     csv
     clojure
     python
     haskell
     (ranger :variables
             ranger-override-dired t
             ranger-show-preview t)
     yaml
     html
     (c-c++ :variables c-c++-enable-clang-support t)
     helm
     auto-completion
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      )
     better-defaults
     emacs-lisp
     latex
     git
     (mu4e  :variables
            mu4e-installation-path "/usr/share/emacs/site-lisp/mu4e")
     markdown
     bibtex
     (org :variables
          org-enable-reveal-js-support t
          org-enable-bootstrap-support t)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'ansi-term)
     spell-checking
     syntax-checking
     themes-megapack
     version-control
     java
     (haskell :variables
              haskell-completion-backend 'intero
              )
     games
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(gradle-mode
                                      groovy-mode
                                      dired
                                      gnuplot
                                      gnuplot-mode
                                      writegood-mode
                                      org-ref
                                      ox-twbs
                                      rainbow-mode
                                      golden-ratio
                                      langtool
                                      latex-preview-pane
                                      focus-autosave-mode
                                      drupal-mode
                                      org-gcal
                                      evil-smartparens
                                      litable
                                      pandoc-mode)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(fill-column-indicator
		   exec-path-from-shell
       org-projectile
		   )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(material
                         material-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `vim-powerline' and `vanilla'. The first three
   ;; are spaceline themes. `vanilla' is default Emacs mode-line. `custom' is a
   ;; user defined themes, refer to the DOCUMENTATION.org for more info on how
   ;; to create your own spaceline theme. Value can be a symbol or list with\
   ;; additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               ;;:size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; clojure config
  (add-hook 'prog-mode-hook 'rainbow-mode)
  (require 'seq-25)
  (setq cider-cljs-lein-repl
        "(do (require 'figwheel-sidecar.repl-api)
         (figwheel-sidecar.repl-api/start-figwheel!)
         (figwheel-sidecar.repl-api/cljs-repl))")


 (defun my-add-pretty-lambda ()
   "make some word or string show as pretty Unicode symbols"
   (setq prettify-symbols-alist
         '(("map" . 8614)   ; ↦
            ("fn" . 955)
            ("defn" . 402))))
 (add-hook 'clojure-mode-hook 'my-add-pretty-lambda)

 (defun clojure-goto-tests ()
   (interactive)
   "Switches from a clojure file to its corresponding test file."
   (let* ((current-file-name (file-name-nondirectory (file-name-sans-extension buffer-file-name)))
          (namespace-name (car (last (split-string (file-name-directory buffer-file-name) "/" t))))
          (new-file-name (if (string-match "._test" current-file-name)
                             (concat "../../src/"
                                     namespace-name "/"
                                     (string-remove-suffix "_test" current-file-name) ".clj")
                           (concat "../../test/" namespace-name "/"
                                   current-file-name "_test.clj"))))
     (find-file new-file-name)))
 (evil-leader/set-key-for-mode 'clojure-mode "gt" 'clojure-goto-tests)

 (defun load-buffer-on-save ()
   (add-hook 'after-save-hook
             '(lambda ()
                (if (and (boundp 'cider-mode)
                         cider-mode
                         tdd-mode
                         (not (string-match "\\.cljs\\'" buffer-file-name)))
                    (cider-load-buffer)))))

  (define-minor-mode tdd-mode
    "Run all tests whenever a file is saved."
    t nil nil
    :global t
    (if tdd-mode
        (add-hook 'cider-mode-hook 'load-buffer-on-save)
      (remove-hook 'cider-mode-hook 'load-buffer-on-save)))

  ;; org-mode config
  (setq org-image-actual-width nil)
  (add-hook 'org-mode-hook (lambda () (linum-mode nil)))
  (require 'ox-twbs)
  (spacemacs/set-leader-keys "aof" (lambda () (interactive) (find-file "~/Dropbox/org/todo.org.txt")))

  ;; org-babel
  (require 'ob-gnuplot)
  (setq org-latex-listings 'minted
        org-latex-packages-alist '(("" "minted"))
        org-latex-pdf-process
        '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))


  ;;org-ref
  (require 'org-ref)
  (require 'doi-utils)
  (require 'org-ref-pdf)
  (require 'org-ref-url-utils)
  (require 'org-ref-isbn)

  ;; reveal-js
  (setq org-export-with-section-numbers nil)
  (advice-add 'org-agenda-quit :before 'org-save-all-org-buffers)
  (advice-add 'org-agenda-todo :after 'org-save-all-org-buffers)
  (advice-add 'org-agenda-redo :after 'org-save-all-org-buffers)
  (advice-add 'org-gcal-sync :before 'org-gcal-refresh-token)

  ;; agenda files
  (setq org-agenda-files (list "~/Dropbox/org/todo.org.txt" "~/Dropbox/org/gcal.org"))
  (focus-autosave-mode)
  ;; todo settings
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "ONGOING(o)" "FUTURE(f)" "|" "DONE(d)")
                (sequence "WAITING(w@/!)" "|" "CANCELLED(c@/!)"))))
  (setq org-todo-keyword-faces
        (quote (("TODO" :foreground "red" :weight bold)
                ("ONGOING" :foreground "light blue" :weight bold)
                ("FUTURE" :foreground "purple" :weight bold)
                ("DONE" :foreground "forest green" :weight bold)
                ("WAITING" :foreground "orange" :weight bold)
                ("CANCELLED" :foreground "forest green" :weight bold))))
  (setq org-use-fast-todo-selection t)
  (setq org-default-notes-file "~/Dropbox/org/todo.org.txt")
  ;; capture settings
  (setq org-capture-templates
        (quote (("t" "todo" entry (file+headline "~/Dropbox/org/todo.org.txt" "Refile")
                 "** TODO")
                ("e" "Event" entry (file  "~/Dropbox/org/gcal.org" )
                 "* %?\n\n%^T\n\n")
                )))
  ;; refiling settings
  (setq org-refile-targets '((nil :maxlevel . 9)
                             (org-agenda-files :maxlevel . 9)))
  (setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
  (setq org-refile-use-outline-path t)                  ; Show full paths for refiling
  ;; archiving settings
  (defun bh/skip-non-archivable-tasks ()
    "Skip trees that are not available for archiving"
    (save-restriction
      (widen)
      ;; Consider only tasks with done todo headings as archivable candidates
      (let ((next-headline (save-excursion (or (outline-next-heading) (point-max))))
            (subtree-end (save-excursion (org-end-of-subtree t))))
        (if (member (org-get-todo-state) org-todo-keywords-1)
            (if (member (org-get-todo-state) org-done-keywords)
                (let* ((daynr (string-to-int (format-time-string "%d" (current-time))))
                       (a-month-ago (* 60 60 24 (+ daynr 1)))
                       (last-month (format-time-string "%Y-%m-" (time-subtract (current-time) (seconds-to-time a-month-ago))))
                       (this-month (format-time-string "%Y-%m-" (current-time)))
                       (subtree-is-current (save-excursion
                                             (forward-line 1)
                                             (and (< (point) subtree-end)
                                                  (re-search-forward (concat last-month "\\|" this-month) subtree-end t)))))
                  (if subtree-is-current
                      subtree-end ; Has a date in this month or last month, skip it
                    nil))  ; available to archive
              (or subtree-end (point-max)))
          next-headline))))
  ;; org mode and gcal
  (setq package-check-signature nil)
  (use-package org-gcal
    :ensure t
    :config
    (setq
          org-gcal-client-id "1007167813898-af95nv19lap962tqogbpburbnsogmm2t.apps.googleusercontent.com"
          org-gcal-client-secret "fpKpegO_7Q6jUqcoaOFSOZOC"
          org-gcal-file-alist '(("platypusdiamond@gmail.com"
          . "~/Dropbox/org/gcal.org"))))
  (add-hook 'org-agenda-redo-hook (lambda () (org-gcal-sync)))

  ;; functions

  (defun my/org-agenda-gcal ()
    (interactive)
    (browse-url "https://calendar.google.com/calendar/render#main_7%7Cmonth")) 
  (defun my/org-pomodoro-text-time ()
    "Display remaining pomodoro time in i3 status bar."
    (if (org-pomodoro-active-p)
        (format "Pomodoro: %d minutes - %s" (/ org-pomodoro-countdown 60) org-clock-heading)
      "No active pomodoro"))

  ;; keybindings
  (evil-leader/set-key-for-mode 'org-mode "k" 'org-gcal-delete-at-point)
  (evil-leader/set-key-for-mode 'org-mode "g" 'org-gcal-sync)
  (evil-leader/set-key-for-mode 'org-mode "t'" 'org-table-edit-field)
  (evil-leader/set-key-for-mode 'org-agenda-mode "g" 'my/org-agenda-gcal)
  (evil-leader/set-key-for-mode 'org-agenda-mode "l" 'org-agenda-open-link)
  (evil-leader/set-key-for-mode 'org-agenda-mode "r" 'org-gcal-sync)
  (evil-leader/set-key-for-mode 'latex-mode "w" 'thesaurus-choose-synonym-and-replace)

  ;; java config
  (add-hook 'java-mode-hook
            (lambda () (add-hook 'post-self-insert-hook
                             (lambda () (when (= (char-before) ?\;)
                                      (save-buffer))) nil t)))

  ;;required packages
  (require 'gradle-mode)
  (require 'company)

  ;;eclim settings

  ;;global modes
  (global-company-mode t)
  (require 'langtool)
  (setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "croutonurlhandler")
  (add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))
  (latex-preview-pane-enable)
  (setq langtool-default-language "en-US")
  (define-key company-mode-map (kbd "M-SPC") 'company-complete)
  (setq thesaurus-bhl-api-key "ce6c9369f52c6664a7f6c3840145839e")
  (global-prettify-symbols-mode)


  ;;haskell config

 (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
 (add-to-list 'exec-path "~/.local/bin/")

 (defun haskell-evil-open-above ()
   (interactive)
   (evil-digit-argument-or-evil-beginning-of-line)
   (haskell-indentation-newline-and-indent)
   (evil-previous-line)
   (haskell-indentation-indent-line)
   (evil-append-line nil))

 (defun haskell-evil-open-below ()
   (interactive)
   (evil-append-line nil)
   (haskell-indentation-newline-and-indent))

 (evil-define-key 'normal haskell-mode-map "o" 'haskell-evil-open-below
   "O" 'haskell-evil-open-above)
 (evil-define-key 'normal haskell-mode-map "==" 'hindent-reformat-decl-or-fill)

 (add-hook 'haskell-mode-hook 'hindent-mode)


  ;; miscellaneous
 (add-hook 'emacs-lisp-mode-hook 'smartparens-strict-mode)
 (add-hook 'clojure-mode-hook 'smartparens-strict-mode)
 (add-hook 'smartparens-strict-mode-hook 'evil-smartparens-mode)
 ;; (add-to-list 'load-path "~/.emacs.d/gnugo-3.0.2/")
 ;; (load "gnugo.el")
 ;; (load "gnugo-big-xpms.el")
 ;; (require 'gnugo)
 (add-to-list 'load-path "~/.emacs.d/el-go/")
 (add-to-list 'load-path "~/.emacs.d/el-go/back-ends/")
 (load "gnugo.el")
 (load "gtp.el")
 (load "gtp-pipe.el")
 (require 'gnugo)
 (require 'gtp)
 (require 'gtp-pipe)
 (require 'go)
 (spacemacs/set-leader-keys "ag" 'go-play)
 (setq exec-path-from-shell-arguments '("-c"))

 ;; location
 (setq calendar-location-name "Jacksonville, FL")
 (setq calendar-latitude 29.9)
 (setq calendar-longitude -81.3)

 ;; insert semicolon function
 (defun insert-semicolon-at-the-end-of-this-line ()
   (interactive)
   (save-excursion
     (end-of-line)
     (insert ";")))
 (setq tab-always-indent 'complete)

 ;;evil multiple cursors
 (global-evil-mc-mode t)
 (global-set-key (kbd "C-S-<mouse-1>") 'evil-mc-toggle-cursor-on-click)

 ;; email config
 (setq mu4e-maildir (expand-file-name "~/Maildir"))
 (setq mu4e-drafts-folder "/[Gmail].Drafts")
 (setq mu4e-sent-folder   "/[Gmail].Sent Mail")
 (setq mu4e-trash-folder  "/[Gmail].Trash")
 (setq mu4e-sent-messages-behavior 'delete)
 (setq mu4e-maildir-shortcuts
       '(("/INBOX"             . ?i)
         ("/[Gmail].Sent Mail" . ?s)
         ("/[Gmail].Trash"     . ?t)))
 (setq mu4e-get-mail-command "offlineimap")
 (setq
  user-mail-address "platypusdiamond@gmail.com"
  user-full-name  "Tushaar Kamat")
 (require 'smtpmail)

 (setq message-send-mail-function 'smtpmail-send-it
       starttls-use-gnutls t
       smtpmail-starttls-credentials
       '(("smtp.gmail.com" 587 nil nil))
       smtpmail-auth-credentials
       (expand-file-name "~/.authinfo.gpg")
       smtpmail-default-smtp-server "smtp.gmail.com"
       smtpmail-smtp-server "smtp.gmail.com"
       smtpmail-smtp-service 587
       smtpmail-debug-info t)
 (setq mu4e-update-interval 600)
 (require 'org-mu4e)
 (setq mu4e-view-prefer-html t)
 ;; (setq mu4e-html2text-command "html2text -utf8 -nobs -width 72")
 (mu4e t)
 (defun my-render-html-message ()
   (let ((dom (libxml-parse-html-region (point-min) (point-max))))
     (erase-buffer)
     (shr-insert-document dom)
     (goto-char (point-min))))
 (require 'mu4e-contrib)

 (setq mu4e-html2text-command 'mu4e-shr2text)
 (setq shr-color-visible-luminance-min 80)
 (setq shr-color-visible-distance-min 5)

 ;; evil keybindings
 (evil-leader/set-key-for-mode 'emacs-lisp-mode "ep" 'eval-and-replace)
 (evil-leader/set-key-for-mode 'latex-mode "pm" 'latex-preview-pane-mode)
 (define-key evil-visual-state-map (kbd "mc") 'mc/edit-lines)
 (define-key evil-normal-state-map (kbd "'") 'evil-goto-mark)

 ;;bibtex
 (evil-leader/set-key-for-mode 'bibtex-mode "," 'bibtex-clean-entry)
 (evil-leader/set-key-for-mode 'bibtex-mode "f" 'bibtex-make-field)
 (evil-leader/set-key-for-mode 'bibtex-mode "d" 'biblio-lookup)

 ;;lilypond
 (setq load-path (append (list (expand-file-name "~/site-lisp")) load-path))
 (autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)
 (add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
 (add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode))

 (defun eval-and-replace ()
   "Replace the preceding sexp with its value."
   (interactive)
   (backward-kill-sexp)
   (condition-case nil
       (prin1 (eval (read (current-kill 0)))
              (current-buffer))
     (error (message "Invalid expression")
            (insert (current-kill 0)))))

 (setq yas-triggers-in-field nil)

 ;; my-keys mode
 (require 'helm-bookmark)
 (defvar my-keys-minor-mode-map
   (let ((map (make-sparse-keymap)))
     (define-key map (kbd "C-k") 'evil-scroll-up)
     (define-key map (kbd "C-j") 'evil-scroll-down)
     (define-key map (kbd "C-'") 'flyspell-auto-correct-previous-word)
     (define-key map (kbd "C-;") 'insert-semicolon-at-the-end-of-this-line)
     (define-key map (kbd "C-SPC") 'er/expand-region)
     (define-key map (kbd "M-[") 'yas-expand)
     (define-key map (kbd "C-x p") 'eval-and-replace)
     map)
   "my-keys-minor-mode keymap.")
 (define-minor-mode my-keys-minor-mode
   "A minor mode so that my key settings override annoying major modes."
   :init-value t
   :lighter " my-keys")

 (my-keys-minor-mode 1)
 (add-hook 'after-load-functions 'my-keys-have-priority)
 (defun my-keys-have-priority (_file)
   "Try to ensure that my keybindings retain priority over other minor modes.

Called via the `after-load-functions' special hook."
   (unless (eq (caar minor-mode-map-alist) 'my-keys-minor-mode)
     (let ((mykeys (assq 'my-keys-minor-mode minor-mode-map-alist)))
       (assq-delete-all 'my-keys-minor-mode minor-mode-map-alist)
       (add-to-list 'minor-mode-map-alist mykeys)))))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "latex -shell-escape")
 '(LilyPond-pdf-command "zathura")
 '(TeX-view-program-selection
   (quote
    (((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Zathura")
     (output-html "xdg-open"))))
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(beacon-color "#cc6666")
 '(bibtex-BibTeX-entry-alist
   (quote
    (("Article" "Article in Journal"
      (("author")
       ("title" "Title of the article (BibTeX converts it to lowercase)"))
      (("journal")
       ("year"))
      (("volume" "Volume of the journal")
       ("number" "Number of the journal (only allowed if entry contains volume)")
       ("pages" "Pages in the journal")
       ("month")
       ("note")))
     ("InProceedings" "Article in Conference Proceedings"
      (("author")
       ("title" "Title of the article in proceedings (BibTeX converts it to lowercase)"))
      (("booktitle" "Name of the conference proceedings")
       ("year"))
      (("editor")
       ("volume" "Volume of the conference proceedings in the series")
       ("number" "Number of the conference proceedings in a small series (overwritten by volume)")
       ("series" "Series in which the conference proceedings appeared")
       ("pages" "Pages in the conference proceedings")
       ("month")
       ("address")
       ("organization" "Sponsoring organization of the conference")
       ("publisher" "Publishing company, its location")
       ("note")))
     ("InCollection" "Article in a Collection"
      (("author")
       ("title" "Title of the article in book (BibTeX converts it to lowercase)")
       ("booktitle" "Name of the book"))
      (("publisher")
       ("year"))
      (("editor")
       ("volume" "Volume of the book in the series")
       ("number" "Number of the book in a small series (overwritten by volume)")
       ("series" "Series in which the book appeared")
       ("type" "Word to use instead of \"chapter\"")
       ("chapter" "Chapter in the book")
       ("pages" "Pages in the book")
       ("edition" "Edition of the book as a capitalized English word")
       ("month")
       ("address")
       ("note")))
     ("InBook" "Chapter or Pages in a Book"
      (("author" nil nil 0)
       ("editor" nil nil 0)
       ("title" "Title of the book")
       ("chapter" "Chapter in the book"))
      (("publisher")
       ("year"))
      (("volume" "Volume of the book in the series")
       ("number" "Number of the book in a small series (overwritten by volume)")
       ("series" "Series in which the book appeared")
       ("type" "Word to use instead of \"chapter\"")
       ("address")
       ("edition" "Edition of the book as a capitalized English word")
       ("month")
       ("pages" "Pages in the book")
       ("note")))
     ("Proceedings" "Conference Proceedings"
      (("title" "Title of the conference proceedings")
       ("year"))
      nil
      (("booktitle" "Title of the proceedings for cross references")
       ("editor")
       ("volume" "Volume of the conference proceedings in the series")
       ("number" "Number of the conference proceedings in a small series (overwritten by volume)")
       ("series" "Series in which the conference proceedings appeared")
       ("address")
       ("month")
       ("organization" "Sponsoring organization of the conference")
       ("publisher" "Publishing company, its location")
       ("note")))
     ("Book" "Book"
      (("author" nil nil 0)
       ("editor" nil nil 0)
       ("title" "Title of the book"))
      (("publisher")
       ("year"))
      (("volume" "Volume of the book in the series")
       ("number" "Number of the book in a small series (overwritten by volume)")
       ("series" "Series in which the book appeared")
       ("address")
       ("edition" "Edition of the book as a capitalized English word")
       ("month")
       ("note")))
     ("Booklet" "Booklet (Bound, but no Publisher)"
      (("title" "Title of the booklet (BibTeX converts it to lowercase)"))
      nil
      (("author")
       ("howpublished" "The way in which the booklet was published")
       ("address")
       ("month")
       ("year")
       ("note")))
     ("PhdThesis" "PhD. Thesis"
      (("author")
       ("title" "Title of the PhD. thesis")
       ("school" "School where the PhD. thesis was written")
       ("year"))
      nil
      (("type" "Type of the PhD. thesis")
       ("address" "Address of the school (if not part of field \"school\") or country")
       ("month")
       ("note")))
     ("MastersThesis" "Master's Thesis"
      (("author")
       ("title" "Title of the master's thesis (BibTeX converts it to lowercase)")
       ("school" "School where the master's thesis was written")
       ("year"))
      nil
      (("type" "Type of the master's thesis (if other than \"Master's thesis\")")
       ("address" "Address of the school (if not part of field \"school\") or country")
       ("month")
       ("note")))
     ("TechReport" "Technical Report"
      (("author")
       ("title" "Title of the technical report (BibTeX converts it to lowercase)")
       ("institution" "Sponsoring institution of the report")
       ("year"))
      nil
      (("type" "Type of the report (if other than \"technical report\")")
       ("number" "Number of the technical report")
       ("address")
       ("month")
       ("note")))
     ("Manual" "Technical Manual"
      (("title" "Title of the manual"))
      nil
      (("author")
       ("organization" "Publishing organization of the manual")
       ("address")
       ("edition" "Edition of the manual as a capitalized English word")
       ("month")
       ("year")
       ("note")))
     ("Unpublished" "Unpublished"
      (("author")
       ("title" "Title of the unpublished work (BibTeX converts it to lowercase)")
       ("note"))
      nil
      (("month")
       ("year")))
     ("Misc" "Miscellaneous" nil nil
      (("author")
       ("title" "Title of the work (BibTeX converts it to lowercase)")
       ("howpublished" "The way in which the work was published")
       ("month")
       ("year")
       ("note")))
     ("Online" "Online entry"
      (("author")
       ("year")
       ("title")
       ("url")
       ("urldate"))
      nil nil)
     ("Website" "A website"
      (("year")
       ("title")
       ("url")
       ("urldate"))
      nil
      (("author"))))))
 '(bibtex-entry-format
   (quote
    (opts-or-alts required-fields numerical-fields realign)))
 '(cider-auto-test-mode t)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "12fca95bcf0f3526233a6100c8967356b243b92f103944587997c9cc9fe8e72e" "afa30b4eaa7b1ca516511e7179869ac66badc65bde73e53e7ea91a736c93cb9b" "f5b08a72c679389e480edc2f6f194bb0dc8a69ab8de8db7800f20f44faa63fb6" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(doc-view-continuous t)
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(evil-escape-key-sequence "jk")
 '(evil-move-beyond-eol t)
 '(evil-move-cursor-back t)
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#383838")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote dark))
 '(global-auto-revert-mode t)
 '(global-evil-mc-mode t)
 '(global-vi-tilde-fringe-mode nil)
 '(haskell-font-lock-symbols t)
 '(haskell-font-lock-symbols-alist
   (quote
    (("\\" . "λ")
     ("not" . "¬")
     ("->" . "→")
     ("<-" . "←")
     ("=>" . "⇒")
     ("==" . "≡")
     ("/=" . "≢")
     (">=" . "≥")
     ("<=" . "≤")
     ("!!" . "‼")
     ("&&" . "∩")
     ("||" . "∪")
     ("sqrt" . "√")
     ("undefined" . "⊥")
     ("pi" . "π")
     ("~>" . "⇝")
     ("-<" . "↢")
     ("::" . "∷")
     ("." "∘" haskell-font-lock-dot-is-not-composition)
     ("forall" . "∀"))))
 '(hl-sexp-background-color "#1c1f26")
 '(mc/always-run-for-all t)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-compact-blocks nil)
 '(org-agenda-custom-commands
   (quote
    ((" " "My Agenda"
      ((agenda "" nil)
       (todo "ONGOING|FUTURE" nil)
       (tags "REFILE" nil)
       (todo "DONE"
             ((org-agenda-overriding-header "Tasks to Archive")
              (org-agenda-skip-function
               (quote bh/skip-non-archivable-tasks))
              (org-tags-match-list-sublevels nil))
             nil))))))
 '(org-babel-load-languages
   (quote
    ((shell . t)
     (emacs-lisp . t)
     (awk . t)
     (clojure . t))))
 '(org-confirm-babel-evaluate nil)
 '(org-habit-graph-column 40)
 '(org-refile-use-outline-path t)
 '(org-src-tab-acts-natively t)
 '(package-archives
   (quote
    (("melpa" . "https://melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/")
     ("gnu" . "https://elpa.gnu.org/packages/")
     ("MELPA" . "melpa.milkbox.net/#/"))))
 '(package-selected-packages
   (quote
    (white-sand-theme rebecca-theme gandalf-theme flatui-theme flatland-theme exotica-theme spotify helm-spotify-plus multi org-mime auctex-latexmk gnuplot-mode ob-clojure-literate rainbow-mode php-mode dired-hacks-utils ox-twbs org-ref pdf-tools key-chord ivy helm-bibtex biblio parsebib biblio-core tablist ox-reveal csv-mode sequences disaster company-c-headers cmake-mode clang-format yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic drupal-mode mmt markdown-mode magit diminish autothemer packed auto-complete avy auctex eclim magit-popup highlight smartparens evil flyspell-correct git-commit with-editor yasnippet helm helm-core async company flycheck request alert log4e projectile f hydra dash s hlinum winum unfill sudoku solarized-theme madhat2r-theme fuzzy Ard-Dark-theme Arc-dark-theme intero hlint-refactor hindent helm-hoogle flycheck-haskell company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode haskell-snippets yaml-mode evil-smartparens evil-mu4e mu4e-maildirs-extension mu4e-alert ht org-alert litable groovy-imports focus-autosave-mode org-gcal stickyfunc-enhance srefactor multiple-cursors web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data zonokai-theme zenburn-theme zen-and-art-theme xterm-color ws-butler writegood-mode window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme typit twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org thesaurus tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacemacs-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle shell-pop seti-theme reverse-theme restart-emacs rainbow-delimiters railscasts-theme quelpa purple-haze-theme professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pastels-on-dark-theme paradox pandoc-mode pacmacs orgit organic-green-theme org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mwim mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow macrostep lush-theme lorem-ipsum link-hint light-soap-theme latex-preview-pane langtool jbeans-theme jazz-theme ir-black-theme inkpot-theme info+ indent-guide hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme groovy-mode grandshell-theme gradle-mode gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md flyspell-correct-helm flycheck-pos-tip flx-ido fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help elisp-slime-nav dumb-jump dracula-theme django-theme diff-hl define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme company-statistics company-quickhelp company-emacs-eclim company-auctex column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell 2048-game)))
 '(pdf-latex-command "pdflatex -shell-escape")
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(send-mail-function (quote mailclient-send-it))
 '(tab-always-indent t)
 '(tdd-mode t)
 '(thesaurus-bhl-api-key "c8a8969932f1c69d2f464578b9761c48" t)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBE" :slant normal :weight normal :height 111 :width normal)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "latex -shell-escape")
 '(LilyPond-pdf-command "zathura")
 '(TeX-view-program-selection
   (quote
    (((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Zathura")
     (output-html "xdg-open"))))
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(beacon-color "#cc6666")
 '(bibtex-BibTeX-entry-alist
   (quote
    (("Article" "Article in Journal"
      (("author")
       ("title" "Title of the article (BibTeX converts it to lowercase)"))
      (("journal")
       ("year"))
      (("volume" "Volume of the journal")
       ("number" "Number of the journal (only allowed if entry contains volume)")
       ("pages" "Pages in the journal")
       ("month")
       ("note")))
     ("InProceedings" "Article in Conference Proceedings"
      (("author")
       ("title" "Title of the article in proceedings (BibTeX converts it to lowercase)"))
      (("booktitle" "Name of the conference proceedings")
       ("year"))
      (("editor")
       ("volume" "Volume of the conference proceedings in the series")
       ("number" "Number of the conference proceedings in a small series (overwritten by volume)")
       ("series" "Series in which the conference proceedings appeared")
       ("pages" "Pages in the conference proceedings")
       ("month")
       ("address")
       ("organization" "Sponsoring organization of the conference")
       ("publisher" "Publishing company, its location")
       ("note")))
     ("InCollection" "Article in a Collection"
      (("author")
       ("title" "Title of the article in book (BibTeX converts it to lowercase)")
       ("booktitle" "Name of the book"))
      (("publisher")
       ("year"))
      (("editor")
       ("volume" "Volume of the book in the series")
       ("number" "Number of the book in a small series (overwritten by volume)")
       ("series" "Series in which the book appeared")
       ("type" "Word to use instead of \"chapter\"")
       ("chapter" "Chapter in the book")
       ("pages" "Pages in the book")
       ("edition" "Edition of the book as a capitalized English word")
       ("month")
       ("address")
       ("note")))
     ("InBook" "Chapter or Pages in a Book"
      (("author" nil nil 0)
       ("editor" nil nil 0)
       ("title" "Title of the book")
       ("chapter" "Chapter in the book"))
      (("publisher")
       ("year"))
      (("volume" "Volume of the book in the series")
       ("number" "Number of the book in a small series (overwritten by volume)")
       ("series" "Series in which the book appeared")
       ("type" "Word to use instead of \"chapter\"")
       ("address")
       ("edition" "Edition of the book as a capitalized English word")
       ("month")
       ("pages" "Pages in the book")
       ("note")))
     ("Proceedings" "Conference Proceedings"
      (("title" "Title of the conference proceedings")
       ("year"))
      nil
      (("booktitle" "Title of the proceedings for cross references")
       ("editor")
       ("volume" "Volume of the conference proceedings in the series")
       ("number" "Number of the conference proceedings in a small series (overwritten by volume)")
       ("series" "Series in which the conference proceedings appeared")
       ("address")
       ("month")
       ("organization" "Sponsoring organization of the conference")
       ("publisher" "Publishing company, its location")
       ("note")))
     ("Book" "Book"
      (("author" nil nil 0)
       ("editor" nil nil 0)
       ("title" "Title of the book"))
      (("publisher")
       ("year"))
      (("volume" "Volume of the book in the series")
       ("number" "Number of the book in a small series (overwritten by volume)")
       ("series" "Series in which the book appeared")
       ("address")
       ("edition" "Edition of the book as a capitalized English word")
       ("month")
       ("note")))
     ("Booklet" "Booklet (Bound, but no Publisher)"
      (("title" "Title of the booklet (BibTeX converts it to lowercase)"))
      nil
      (("author")
       ("howpublished" "The way in which the booklet was published")
       ("address")
       ("month")
       ("year")
       ("note")))
     ("PhdThesis" "PhD. Thesis"
      (("author")
       ("title" "Title of the PhD. thesis")
       ("school" "School where the PhD. thesis was written")
       ("year"))
      nil
      (("type" "Type of the PhD. thesis")
       ("address" "Address of the school (if not part of field \"school\") or country")
       ("month")
       ("note")))
     ("MastersThesis" "Master's Thesis"
      (("author")
       ("title" "Title of the master's thesis (BibTeX converts it to lowercase)")
       ("school" "School where the master's thesis was written")
       ("year"))
      nil
      (("type" "Type of the master's thesis (if other than \"Master's thesis\")")
       ("address" "Address of the school (if not part of field \"school\") or country")
       ("month")
       ("note")))
     ("TechReport" "Technical Report"
      (("author")
       ("title" "Title of the technical report (BibTeX converts it to lowercase)")
       ("institution" "Sponsoring institution of the report")
       ("year"))
      nil
      (("type" "Type of the report (if other than \"technical report\")")
       ("number" "Number of the technical report")
       ("address")
       ("month")
       ("note")))
     ("Manual" "Technical Manual"
      (("title" "Title of the manual"))
      nil
      (("author")
       ("organization" "Publishing organization of the manual")
       ("address")
       ("edition" "Edition of the manual as a capitalized English word")
       ("month")
       ("year")
       ("note")))
     ("Unpublished" "Unpublished"
      (("author")
       ("title" "Title of the unpublished work (BibTeX converts it to lowercase)")
       ("note"))
      nil
      (("month")
       ("year")))
     ("Misc" "Miscellaneous" nil nil
      (("author")
       ("title" "Title of the work (BibTeX converts it to lowercase)")
       ("howpublished" "The way in which the work was published")
       ("month")
       ("year")
       ("note")))
     ("Online" "Online entry"
      (("author")
       ("year")
       ("title")
       ("url")
       ("urldate"))
      nil nil)
     ("Website" "A website"
      (("year")
       ("title")
       ("url")
       ("urldate"))
      nil
      (("author"))))))
 '(bibtex-entry-format
   (quote
    (opts-or-alts required-fields numerical-fields realign)))
 '(cider-auto-test-mode t)
 '(cider-clojure-cli-command "clojure")
 '(cider-default-repl-command "lein")
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "12fca95bcf0f3526233a6100c8967356b243b92f103944587997c9cc9fe8e72e" "afa30b4eaa7b1ca516511e7179869ac66badc65bde73e53e7ea91a736c93cb9b" "f5b08a72c679389e480edc2f6f194bb0dc8a69ab8de8db7800f20f44faa63fb6" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(doc-view-continuous t)
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1ba1a1\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(evil-escape-key-sequence "jk")
 '(evil-move-beyond-eol t)
 '(evil-move-cursor-back t)
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#383838")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote dark))
 '(global-auto-revert-mode t)
 '(global-evil-mc-mode t)
 '(global-vi-tilde-fringe-mode nil)
 '(haskell-font-lock-symbols t)
 '(haskell-font-lock-symbols-alist
   (quote
    (("\\" . "λ")
     ("not" . "¬")
     ("->" . "→")
     ("<-" . "←")
     ("=>" . "⇒")
     ("==" . "≡")
     ("/=" . "≢")
     (">=" . "≥")
     ("<=" . "≤")
     ("!!" . "‼")
     ("&&" . "∩")
     ("||" . "∪")
     ("sqrt" . "√")
     ("undefined" . "⊥")
     ("pi" . "π")
     ("~>" . "⇝")
     ("-<" . "↢")
     ("::" . "∷")
     ("." "∘" haskell-font-lock-dot-is-not-composition)
     ("forall" . "∀"))))
 '(hl-sexp-background-color "#1c1f26")
 '(mc/always-run-for-all t)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-compact-blocks nil)
 '(org-agenda-custom-commands
   (quote
    ((" " "My Agenda"
      ((agenda "" nil)
       (todo "ONGOING|FUTURE" nil)
       (tags "REFILE" nil)
       (todo "DONE"
             ((org-agenda-overriding-header "Tasks to Archive")
              (org-agenda-skip-function
               (quote bh/skip-non-archivable-tasks))
              (org-tags-match-list-sublevels nil))
             nil))))))
 '(org-babel-load-languages
   (quote
    ((shell . t)
     (emacs-lisp . t)
     (awk . t)
     (clojure . t))))
 '(org-confirm-babel-evaluate nil)
 '(org-habit-graph-column 40)
 '(org-refile-use-outline-path t)
 '(org-src-tab-acts-natively t)
 '(package-archives
   (quote
    (("melpa" . "https://melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/")
     ("gnu" . "https://elpa.gnu.org/packages/")
     ("MELPA" . "melpa.milkbox.net/#/"))))
 '(package-selected-packages
   (quote
    (yasnippet-snippets symon string-inflection spaceline-all-the-icons all-the-icons memoize powerline sayid realgud test-simple loc-changes load-relative ranger pippel pipenv password-generator overseer request-deferred org-brain nameless mvn gntp meghanada maven-test-mode linum-relative importmagic epc ctable concurrent deferred impatient-mode simple-httpd dash-functional parent-mode helm-xref helm-rtags helm-purpose window-purpose imenu-list helm-mu pcache google-c-style gitignore-mode fringe-helper git-gutter+ git-gutter flycheck-rtags flx evil-org ghub let-alist evil-lion iedit evil-cleverparens anzu ensime sbt-mode scala-mode editorconfig dante lcr counsel-projectile counsel swiper company-rtags rtags pos-tip clojure-snippets clojure-cheatsheet clj-refactor inflections edn paredit peg cider-eval-sexp-fu cider seq spinner queue pkg-info clojure-mode epl centered-cursor-mode browse-at-remote popup font-lock+ goto-chg undo-tree bind-map bind-key white-sand-theme rebecca-theme gandalf-theme flatui-theme flatland-theme exotica-theme spotify helm-spotify-plus multi org-mime auctex-latexmk gnuplot-mode ob-clojure-literate rainbow-mode php-mode dired-hacks-utils ox-twbs org-ref pdf-tools key-chord ivy helm-bibtex biblio parsebib biblio-core tablist ox-reveal csv-mode sequences disaster company-c-headers cmake-mode clang-format yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic drupal-mode mmt markdown-mode magit diminish autothemer packed auto-complete avy auctex eclim magit-popup highlight smartparens evil flyspell-correct git-commit with-editor yasnippet helm helm-core async company flycheck request alert log4e projectile f hydra dash s hlinum winum unfill sudoku solarized-theme madhat2r-theme fuzzy Ard-Dark-theme Arc-dark-theme intero hlint-refactor hindent helm-hoogle flycheck-haskell company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode haskell-snippets yaml-mode evil-smartparens evil-mu4e mu4e-maildirs-extension mu4e-alert ht org-alert litable groovy-imports focus-autosave-mode org-gcal stickyfunc-enhance srefactor multiple-cursors web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data zonokai-theme zenburn-theme zen-and-art-theme xterm-color ws-butler writegood-mode window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme typit twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org thesaurus tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacemacs-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle shell-pop seti-theme reverse-theme restart-emacs rainbow-delimiters railscasts-theme quelpa purple-haze-theme professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pastels-on-dark-theme paradox pandoc-mode pacmacs orgit organic-green-theme org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mwim mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow macrostep lush-theme lorem-ipsum link-hint light-soap-theme latex-preview-pane langtool jbeans-theme jazz-theme ir-black-theme inkpot-theme info+ indent-guide hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme groovy-mode grandshell-theme gradle-mode gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md flyspell-correct-helm flycheck-pos-tip flx-ido fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help elisp-slime-nav dumb-jump dracula-theme django-theme diff-hl define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme company-statistics company-quickhelp company-emacs-eclim company-auctex column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell 2048-game)))
 '(pdf-latex-command "pdflatex -shell-escape")
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(send-mail-function (quote mailclient-send-it))
 '(tab-always-indent t)
 '(tdd-mode t)
 '(thesaurus-bhl-api-key "c8a8969932f1c69d2f464578b9761c48" t)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBE" :slant normal :weight normal :height 111 :width normal)))))
)
