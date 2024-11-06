;;; acm-backend-lsp-ai.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2024 John Doe
;;
;; Author: John Doe <john@doe.com>
;; Maintainer: John Doe <john@doe.com>
;; Created: November 06, 2024
;; Modified: November 06, 2024
;; Version: 0.0.1
;; Keywords: Symbol’s value as variable is void: finder-known-keywords
;; Homepage: https://github.com/regal/acm-backend-lsp-ai
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(defgroup acm-backend-lsp-ai nil
  "ACM LSP AI support."
  :group 'acm)

(defcustom acm-backend-lsp-ai-api-key-path (expand-file-name (concat user-emacs-directory (file-name-as-directory "lsp-bridge") ".lsp_ai_key"))
  "The path to store LSP-AI API Key."
  :type 'string
  :group 'acm-backend-codeium)

(defvar-local acm-backend-lsp-ai-items nil)

(defun acm-backend-lsp-ai-candidates (keyword)
  (acm-with-cache-candidates
   acm-backend-lsp-ai-cache-candiates
   acm-backend-lsp-ai-items))

(defun acm-backend-lsp-ai-candidate-expand (candidate-info bound-start &optional preview)
  ;; We need replace whole area with codeium label.
  (let ((end-position (line-end-position)))
    (forward-line (- (plist-get candidate-info :line) (count-lines (point-min) (line-beginning-position))))
    (if preview
        (acm-preview-create-overlay (point) end-position (plist-get candidate-info :label))
      (delete-region (point) end-position)
      (insert (plist-get candidate-info :label))
      (when acm-backend-lsp-ai-accept
        (lsp-bridge-call-async
         "lsp_ai_completion_accept" (plist-get candidate-info :id))))))

(defun acm-backend-lsp-ai-candidate-doc (candidate)
  (plist-get candidate :documentation))

(defun acm-backend-lsp-ai-clean ()
  (setq-local acm-backend-lsp-ai-items nil)
  (setq-local acm-backend-lsp-ai-cache-candiates nil))


(provide 'acm-backend-lsp-ai)
;;; acm-backend-lsp-ai.el ends here
