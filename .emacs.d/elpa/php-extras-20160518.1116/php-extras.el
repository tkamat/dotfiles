;;; php-extras.el --- Extra features for `php-mode'

;; Copyright (C) 2012, 2013, 2014, 2015 Arne Jørgensen

;; Author: Arne Jørgensen <arne@arnested.dk>
;; URL: https://github.com/arnested/php-extras
;; Created: June 28, 2012
;; Version: 2.2.1
;; Package-Requires: ((php-mode "1.5.0"))
;; Keywords: programming, php

;; This software is free software: you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.

;; This software is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this software.  If not, see
;; <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Extra features for `php-mode':

;;   * `php-extras-insert-previous-variable'
;;   * `php-extras-eldoc-documentation-function'
;;   * Auto complete source for PHP functions based on
;;     `php-extras-eldoc-documentation-function'

;;; Code:

(require 'eldoc)
(require 'thingatpt)
(eval-when-compile (require 'cl-lib))

;; Silence byte-compiler warnings
(declare-function php-get-pattern "php-mode" ())
(declare-function company-doc-buffer "company" (&optional string))
(declare-function company-grab-symbol "company" ())
(declare-function company-begin-backend "company" (backend &optional callback))
(defvar company-backends)
(defvar ac-sources)

(defvar php-extras-php-variable-regexp
  (format "\\(\\$[a-zA-Z_%s-%s][a-zA-Z0-9_%s-%s]*\\(\\[.*\\]\\)*\\)"
          (char-to-string 127) (char-to-string 255)
          (char-to-string 127) (char-to-string 255))
  "Regexp for a PHP variable.")

(defvar php-extras-eldoc-functions-file (concat (file-name-directory (or load-file-name buffer-file-name)) "php-extras-eldoc-functions")
  "File holding `php-extras-function-arguments' hash table.")

(defvar php-extras-function-arguments 'not-loaded
  "Hash table of PHP functions and their function arguments.
Generated by `php-extras-gen-eldoc-elem-string'.")

;;;###autoload
(defcustom php-extras-insert-previous-variable-key [(control c) (control $)]
  "Key sequence for `php-extras-insert-previous-variable'."
  :group 'php
  :set #'(lambda (symbol value)
       ;; Always set the variable `php-extras-insert-previous-variable-key'.
       (set-default symbol value)
       ;; When `php-mode-map' is already loaded define it in the map.
       (when (boundp 'php-mode-map)
         ;; First undefine the old key sequence if defined.
         (when (eq (lookup-key php-mode-map php-extras-insert-previous-variable-key) 'php-extras-insert-previous-variable)
           (define-key php-mode-map php-extras-insert-previous-variable-key 'undefined))
         ;; Then define the new key sequence.
         (define-key php-mode-map value 'php-extras-insert-previous-variable)))
  :type 'key-sequence)

;;;###autoload
(defcustom php-extras-auto-complete-insert-parenthesis t
  "Whether auto complete insert should add a pair of parenthesis."
  :group 'php
  :type 'boolean)



;;;###autoload
(defun php-extras-insert-previous-variable (arg)
  "Insert previously used variable from buffer.
With prefix argument search that number of times backwards for
variable. If prefix argument is negative search forward."
  (interactive "P")
  (when (null arg)
    (setq arg 1))
  (save-excursion
    (dotimes (var (abs arg))
      (if (> arg 0)
          (re-search-backward php-extras-php-variable-regexp nil t)
        (re-search-forward php-extras-php-variable-regexp nil t))))
  (if (match-string-no-properties 1)
      (insert (match-string-no-properties 1))
    (message "No variable to insert.")))

(defun php-extras-get-function-property (symbol property)
  "Get property of symbol.
Property can be: 'versions, 'return, 'prototype, 'purpose, or 'id."
  (cdr (assoc property (gethash symbol php-extras-function-arguments))))

;;;###autoload
(defun php-extras-eldoc-documentation-function ()
  "Get function arguments for core PHP function at point."
  (when (eq php-extras-function-arguments 'not-loaded)
    (php-extras-load-eldoc))
  (when (hash-table-p php-extras-function-arguments)
    (or
     (php-extras-get-function-property (php-get-pattern) 'prototype)
     (save-excursion
       (ignore-errors
         (backward-up-list)
         (php-extras-get-function-property (php-get-pattern) 'prototype))))))

;;;###autoload
(add-hook 'php-mode-hook 'php-extras-eldoc-setup)

(defun php-extras-eldoc-setup ()
  (when (memq eldoc-documentation-function '(nil ignore))
      (set (make-local-variable 'eldoc-documentation-function)
           #'php-extras-eldoc-documentation-function))
  (eldoc-add-command 'completion-at-point))

(defun php-extras-load-eldoc ()
  (unless
      (require 'php-extras-eldoc-functions php-extras-eldoc-functions-file t)
    (warn "PHP function descriptions not loaded. Try M-x php-extras-generate-eldoc")))



(defun php-extras-ac-insert-action ()
  "Auto-complete insert action for PHP.
If `php-extras-auto-complete-insert-parenthesis' is t insert a
pair of parenthesis after the inserted auto complete selection;
place point in between the parenthesis and show the `eldoc'
documentation for the inserted selection."
  (when php-extras-auto-complete-insert-parenthesis
    (insert "()")
    (backward-char)
    (when (and (boundp 'eldoc-documentation-function)
               (not (memq eldoc-documentation-function '(nil ignore)))
               (fboundp 'eldoc-message))
      (eldoc-message (funcall eldoc-documentation-function)))))

(defun php-extras-function-documentation (symbol)
  "Documentation for PHP function."
  (php-extras-get-function-property symbol 'documentation))

(defvar ac-source-php-extras
  '((candidates . php-extras-autocomplete-candidates)
    (candidate-face . php-extras-autocomplete-candidate-face)
    (selection-face . php-extras-autocomplete-selection-face)
    (document . php-extras-function-documentation)
    (action . php-extras-ac-insert-action)
    (symbol . "f")
    (cache))
  "Auto complete source for PHP functions.")

(defface php-extras-autocomplete-candidate-face
  '((t (:inherit ac-candidate-face)))
  "Face for PHP auto complete candidate."
  :group 'php)

(defface php-extras-autocomplete-selection-face
  '((t (:inherit ac-selection-face)))
  "Face for PHP auto complete selection."
  :group 'php)

(defun php-extras-autocomplete-candidates ()
  "Generate PHP auto complete candidates.
The candidates are generated from the
`php-extras-function-arguments' hash table."
  (let (candidates)
    (when (eq php-extras-function-arguments 'not-loaded)
      (php-extras-load-eldoc))
    (when (hash-table-p php-extras-function-arguments)
      (maphash (lambda (key value) (setq candidates (cons key candidates))) php-extras-function-arguments))
    candidates))

;;;###autoload
(defun php-extras-autocomplete-setup ()
  (eval-after-load 'auto-complete
    '(add-to-list 'ac-sources 'ac-source-php-extras)))

;;;###autoload
(add-hook 'php-mode-hook #'php-extras-autocomplete-setup)


;;; Setup basic Emacs completion-at-point to complete on function names

;;;###autoload
(defun php-extras-completion-at-point ()
  (when (eq php-extras-function-arguments 'not-loaded)
    (php-extras-load-eldoc))
  (when (hash-table-p php-extras-function-arguments)
    (let ((bounds (bounds-of-thing-at-point 'symbol)))
      (if bounds
          (list (car bounds) (cdr bounds) php-extras-function-arguments
                :exclusive 'no)
        nil))))

;;;###autoload
(defun php-extras-completion-setup ()
  (add-hook 'completion-at-point-functions
            #'php-extras-completion-at-point
            nil t))

;;;###autoload
(add-hook 'php-mode-hook #'php-extras-completion-setup)


;;; Backend for `company-mode'

;;;###autoload
(defun php-extras-company (command &optional candidate &rest ignore)
  "`company-mode' back-end using `php-extras-function-arguments'."
  (interactive (list 'interactive))
  (when (derived-mode-p 'php-mode)
    (cl-case command
      (interactive
       (company-begin-backend 'php-extras-company))

      (init
       (php-extras-load-eldoc)
       (unless (hash-table-p php-extras-function-arguments)
         ;; Signaling an error here will cause company-mode to remove
         ;; this backend from the list, so we need not check that the
         ;; hash table exists later
         (error "No PHP function information loaded")))

      (prefix
       (company-grab-symbol))

      (candidates
       (all-completions candidate php-extras-function-arguments))

      (annotation
       (let ((prototype (php-extras-get-function-property candidate 'prototype)))
         (and prototype
              (replace-regexp-in-string "\\`[^(]*" "" prototype))))

      (meta
       (php-extras-get-function-property candidate 'purpose))

      (doc-buffer
       (let ((docs (php-extras-get-function-property candidate 'documentation)))
         (when docs
           (company-doc-buffer docs))))

      (post-completion
       (php-extras-ac-insert-action)))))

;;;###autoload
(defun php-extras-company-setup ()
  ;; Add `php-extras-company' to `company-backends' only if it's not
  ;; already present in the list, to avoid overwriting any user
  ;; preference for the order and merging of backends (as configured
  ;; via customize, e.g.).  Elements of `company-backends' may be
  ;; lists of backends to merge together, so this is more complicated
  ;; than just (memq ..)
  (when (boundp 'company-backends)
    (unless
        (cl-loop
         for backend in company-backends
         thereis (or (eq backend 'php-extras-company)
                     (and (listp backend)
                          (memq 'php-extras-company backend))))
      (add-to-list 'company-backends 'php-extras-company))))

;;;###autoload
(eval-after-load 'company
  '(php-extras-company-setup))



;;;###autoload
(eval-after-load 'php-mode
  `(let ((map php-mode-map)
         (key php-extras-insert-previous-variable-key))
     (define-key map key 'php-extras-insert-previous-variable)))



(provide 'php-extras)

;;; php-extras.el ends here
