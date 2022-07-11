
# Table of Contents

1.  [custom-file](#orgd92cb04)
2.  [globals](#orgf3e8592)
3.  [Packages](#org19b48c9)
    1.  [Themes](#org617c4e2)
    2.  [yasnippets](#org228cb91)
    3.  [Dashboard](#org796e23c)
    4.  [Org](#orgd95712e)
4.  [Export to README.md](#org34168b3)



<a id="orgd92cb04"></a>

# custom-file

    (defvar custom-file-path (expand-file-name "custom.el" user-emacs-directory))
    (when (file-exists-p custom-file-path)
      (setq custom-file custom-file-path)
      (load custom-file))


<a id="orgf3e8592"></a>

# globals

    (setq backup-directory-alist `((".*" . ".backup~/")))
    (menu-bar-mode -1)
    (tool-bar-mode -1)
    (scroll-bar-mode -1)


<a id="org19b48c9"></a>

# Packages


<a id="org617c4e2"></a>

## Themes

    (use-package spacemacs-theme
      :ensure t
      :defer nil
      :config
      (load-theme 'spacemacs-dark 'no-confirm))
    
    (use-package all-the-icons
      :ensure t)


<a id="org228cb91"></a>

## yasnippets

    (use-package yasnippet
      :ensure t
      :config
      (yas-global-mode t))


<a id="org796e23c"></a>

## Dashboard

Prevent dashboard warning about loaded banner by creating init-dashboard use-package.

    (use-package dashboard
      :ensure t
      :init
      (setq dashboard-startup-banner (expand-file-name "assets/images/figo-green.png" user-emacs-directory))
      (setq dashboard-set-heading-icons t)
      (setq dashboard-set-file-icons t)
      (setq dashboard-items '((recents . 15)))
      :config
      (dashboard-modify-heading-icons
       '((recents . "file-text"))))
    
    (use-package init-dashboard
      :after 'dashboard
      :init
      (dashboard-setup-startup-hook))


<a id="orgd95712e"></a>

## Org

    (use-package org-bullets
      :ensure t
      :hook (org-mode . org-bullets-mode))


<a id="org34168b3"></a>

# Export to README.md

    (defun config.org->README.md ()
      (find-file config-file)
      (switch-to-buffer "config.org")
      (org-md-export-as-markdown)
      (switch-to-buffer "*Org MD Export*")
      (write-file "~/.emacs.d/README.md"))

