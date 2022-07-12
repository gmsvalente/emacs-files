
# Table of Contents

1.  [Global Settings](#org36007d8)
    1.  [custom-file](#orge1d4c1e)
    2.  [backup directory](#orge70fb76)
2.  [UI](#org2db3dca)
    1.  [emacs tweaks](#org7cbbfaa)
    2.  [themes](#orgefa96e0)
3.  [UX](#orgcefcb8e)
    1.  [dashboard](#orgfe9b5eb)
    2.  [yasnippets](#orgf95e77d)
4.  [Programming](#org1ea3dc1)
    1.  [yaml](#org3b31de2)
5.  [Productivity](#org806347f)
    1.  [whick-key](#org238842f)
    2.  [org](#orge6f024b)
    3.  [ssh-agency](#org71a0b6f)
    4.  [magit](#org65bacb9)
6.  [Export to README.md](#orgc2c467f)

These emacs configuration uses literate programming to create my emacs config file.
All the configuration are create into one file config.el which is automatic loaded.


<a id="org36007d8"></a>

# Global Settings


<a id="orge1d4c1e"></a>

## custom-file

The custom-file is a variable bounded to custom.el file and is auto-populated by emacs used for storing customization information.

    (defvar custom-file-path (expand-file-name "custom.el" user-emacs-directory))
    (when (file-exists-p custom-file-path)
      (setq custom-file custom-file-path)
      (load custom-file))


<a id="orge70fb76"></a>

## backup directory

Store the backup files \*~ into .backup~ folder.

    (setq backup-directory-alist `((".*" . ".backup~/")))


<a id="org2db3dca"></a>

# UI


<a id="org7cbbfaa"></a>

## emacs tweaks

Remove some ui modes.

    (menu-bar-mode -1)
    (tool-bar-mode -1)
    (scroll-bar-mode -1)


<a id="orgefa96e0"></a>

## themes

Instal themes.

    (use-package zenburn-theme :ensure t)
    (use-package spacemacs-theme :ensure t)
    (use-package all-the-icons  :ensure t)
    (load-theme 'zenburn 'no-confirm)


<a id="orgcefcb8e"></a>

# UX


<a id="orgfe9b5eb"></a>

## dashboard

Use dashboard to fast select files and projects.
Prevent dashboard warning about loaded banner by creating init-dashboard use-package.
You can create an use-package that is not associated to any package.

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


<a id="orgf95e77d"></a>

## yasnippets

Insert pre-formatted codes.

    (use-package yasnippet
      :ensure t
      :config
      (yas-global-mode 1))
    
    (use-package yasnippet-snippets
      :ensure t)


<a id="org1ea3dc1"></a>

# Programming


<a id="org3b31de2"></a>

## yaml

Yaml mode.

    (use-package yaml-mode
      :ensure t
      :config
      (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))


<a id="org806347f"></a>

# Productivity

Use for create a menu for which keys to select.


<a id="org238842f"></a>

## whick-key

    (use-package which-key
      :ensure t
      :init
      (which-key-mode))


<a id="orge6f024b"></a>

## org

Use org-mode for enhance your productivity.

    (use-package org-bullets
      :ensure t
      :hook (org-mode . org-bullets-mode))


<a id="org71a0b6f"></a>

## ssh-agency

    (use-package ssh-agency
      :ensure t)


<a id="org65bacb9"></a>

## magit

Magit is really a git porcelain.

    (use-package magit
      :ensure t)


<a id="orgc2c467f"></a>

# Export to README.md

Export this config.org to a README.md

    (defun config.org->README.md ()
      (find-file config-file)
      (switch-to-buffer "config.org")
      (org-md-export-as-markdown)
      (switch-to-buffer "*Org MD Export*")
      (write-file "~/.emacs.d/README.md"))

