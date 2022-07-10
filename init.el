(defvar config-file (expand-file-name "config.org" user-emacs-directory))

;;; include melpa to package-archives
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)


;;; verify use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(require 'org)

(org-babel-load-file config-file)



