;;; -*- lexical-binding: t -*-

(defun org/prettify-appearance ()
  "Transforms list bullets to Unicode ones
and set size for titles and headings"
  (font-lock-add-keywords
   'org-mode
   '(("^ *\\([\*]\\) "
      (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  (font-lock-add-keywords
   'org-mode
   '(("^ *\\([-]\\) "
      (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "⁃"))))))

  (custom-set-faces
   '(org-document-title ((t (:inherit outline-1 :height 3.0))))
   '(org-document-info ((t (:inherit outline-3 :height 1.5))))
   '(org-level-1 ((t (:inherit outline-1 :height 2.0))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.8))))
   '(org-level-3 ((t (:inherit outline-3 :height 1.4))))
   '(org-level-4 ((t (:inherit outline-4 :height 1.2))))
   '(org-level-5 ((t (:inherit outline-5 :height 1.0))))))

(pkg! org
  :mode
  ("\\.org\\'" . org-mode)
  :straight
  (:type git :url "https://code.orgmode.org/bzg/org-mode")
  :hook
  ((org-mode . org-mode-remove-stars)
   (org-mode . org/prettify-appearance))
  :custom
  (org-hide-emphasis-markers t)
  (org-hide-block-startup t)
  (org-hide-leading-stars t)
  (org-hide-macro-markers t))

(pkg! mixed-pitch
  :hook
  (org-mode . mixed-pitch-mode))

(pkg! toc-org
  :after org
  :hook
  (org-mode . toc-org-mode))

(defun org-mode-remove-stars ()
  (font-lock-add-keywords
   nil
   '(("^\\*+ "
      (0
       (prog1 nil
         (put-text-property
          (match-beginning 0) (match-end 0)
          'invisible t)))))))

(provide 'org-lang)
