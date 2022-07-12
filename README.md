
# Table of Contents

1.  [Global Settings](#orge35fb8c)
    1.  [custom-file](#org699945c)
    2.  [backup directory](#org655b77e)
2.  [UI](#org746175a)
    1.  [emacs tweaks](#org6f8af4d)
    2.  [themes](#orge02f72c)
3.  [UX](#org74311e6)
    1.  [dashboard](#org42fe8a3)
    2.  [yasnippets](#org18c44b4)
    3.  [paredit](#org48798ef)
4.  [Programming](#org9d1a5d4)
    1.  [yaml](#orgd1c698f)
    2.  [clojure](#org92ff3ef)
5.  [Productivity](#orgb1d8802)
    1.  [whick-key](#org5705ab0)
    2.  [org](#org2a04e3b)
    3.  [ssh-agency](#org2c9c32d)
    4.  [magit](#org53d7e9b)
6.  [Export to README.md](#org4eb63c1)

These emacs configuration uses literate programming to create my emacs config file.
All the configuration are create into one file config.el which is automatic loaded.


<a id="orge35fb8c"></a>

# Global Settings


<a id="org699945c"></a>

## custom-file

The custom-file is a variable bounded to custom.el file and is auto-populated by emacs used for storing customization information.

    (defvar custom-file-path (expand-file-name "custom.el" user-emacs-directory))
    (when (file-exists-p custom-file-path)
      (setq custom-file custom-file-path)
      (load custom-file))


<a id="org655b77e"></a>

## backup directory

Store the backup files \*~ into .backup~ folder.

    (setq backup-directory-alist `((".*" . ".backup~/")))


<a id="org746175a"></a>

# UI


<a id="org6f8af4d"></a>

## emacs tweaks

Remove some ui modes.

    (menu-bar-mode -1)
    (tool-bar-mode -1)
    (scroll-bar-mode -1)


<a id="orge02f72c"></a>

## themes

Instal themes.

    (use-package zenburn-theme :ensure t)
    (use-package spacemacs-theme :ensure t)
    (use-package all-the-icons  :ensure t)
    (load-theme 'zenburn 'no-confirm)


<a id="org74311e6"></a>

# UX


<a id="org42fe8a3"></a>

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


<a id="org18c44b4"></a>

## yasnippets

Insert pre-formatted codes.

    (use-package yasnippet
      :ensure t
      :config
      (yas-global-mode 1))
    
    (use-package yasnippet-snippets
      :ensure t)


<a id="org48798ef"></a>

## paredit

    (use-package paredit
      :ensure t
      :hook (prog-mode . paredit-mode))


<a id="org9d1a5d4"></a>

# Programming


<a id="orgd1c698f"></a>

## yaml

Yaml mode.

    (use-package yaml-mode
      :ensure t
      :config
      (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))


<a id="org92ff3ef"></a>

## clojure


<a id="orgb1d8802"></a>

# Productivity

Use for create a menu for which keys to select.


<a id="org5705ab0"></a>

## whick-key

    (use-package which-key
      :ensure t
      :init
      (which-key-mode))


<a id="org2a04e3b"></a>

## org

Use org-mode for enhance your productivity.

    (use-package org-bullets
      :ensure t
      :hook (org-mode . org-bullets-mode))


<a id="org2c9c32d"></a>

## ssh-agency

    (use-package ssh-agency
      :ensure t)


<a id="org53d7e9b"></a>

## magit

Magit is really a git porcelain.

    (use-package magit
      :ensure t)


<a id="org4eb63c1"></a>

# Export to README.md

Export this config.org to a README.md

    (defun config.org->README.md ()
      (find-file config-file)
      (switch-to-buffer "config.org")
      (org-md-export-as-markdown)
      (switch-to-buffer "*Org MD Export*")
      (write-file "~/.emacs.d/README.md"))

