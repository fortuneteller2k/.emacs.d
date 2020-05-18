;;; lsp.el --- Language Server Protocol support -*- lexical-binding: t; -*-
;;; Commentary:
;; an interface for LSP clients
;;; Code:
(use-package lsp-mode
  :hook (lsp-mode . lsp-enable-which-key-integration)
  :custom
  (lsp-auto-configure t)
  (lsp-diagnostic-package :flycheck)
  :commands lsp)

(use-package lsp-ui
  :commands lsp-ui-mode
  :custom
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-sideline-delay 0.3)
  (lsp-ui-doc-enable)
  (lsp-ui-doc-position 'top))

(if (module-p! :ui ivy)
    (use-package lsp-ivy :commands lsp-ivy-workspace-symbol))
;;; lsp.el ends here
