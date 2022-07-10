
# Table of Contents

1.  [init](#org28706a1)
2.  [Packages](#org3b4c466)
    1.  [Themes](#org292e178)
3.  [Export to README.md](#org35676c1)



<a id="org28706a1"></a>

# init

    (setq backup-directory-alist `((".*" . ".backup~/")))
    (auto-compression-mode t)
    ;; include melpa to package-archives


<a id="org3b4c466"></a>

# Packages


<a id="org292e178"></a>

## Themes

    (use-package spacemacs-theme
      :ensure t
      :defer nil
      :config
      (load-theme 'spacemacs-dark 'no-confirm))


<a id="org35676c1"></a>

# Export to README.md

    (defun config.org->README.md ()
      (find-file config-file)
      (switch-to-buffer "config.org")
      (org-md-export-as-markdown)
      (switch-to-buffer "*Org MD Export*")
      (write-file "~/.emacs.d/README.md"))

