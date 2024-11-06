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


(provide 'acm-backend-lsp-ai)
;;; acm-backend-lsp-ai.el ends here
