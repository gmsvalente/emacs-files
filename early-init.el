;;; early-init.el --- early init file -*- lexical-binding: t; -*-

;; CopyWhat? (©?) 2022 Gustavo Valente

;; Author: Gustavo Valente <gustavomsvalente@gmail.com>
;; Maintainer: Gustavo Valente <gustavomsvalente@gmail.com>
;; Version: 0.0.1

;;; Commentary:
;; this file will run before init.el

;;; Code:

;;; save gc original settings and set new values for startup
(put 'gc-cons-threshold 'original-value gc-cons-threshold)
(put 'gc-cons-threshold 'value-during-init most-positive-fixnum)

(put 'gc-cons-percentage 'original-value gc-cons-percentage)
(put 'gc-cons-percentage 'value-during-init 0.6)

(setq gc-cons-percentage (get 'gc-cons-percentage 'value-during-init))
(setq gc-cons-threshold (get 'gc-cons-threshold 'value-during-init))

(message "*** Using %d gc-cons-threshold on init ***" gc-cons-threshold)
(message "*** Using %.2f gc-cons-percentage on init ***" gc-cons-percentage)


(setq-default default-frame-alist
	      '((tool-bar-lines . nil)
		(width 	 	. 90)
		(font 		. "Noto Sans Mono")))

(setq file-name-handler-alist nil
      frame-inhibit-implied-resize t)

(defun after-init-fn ()
  "Say hello and return gc original values"
  (message "*** Hello %s ***" (user-login-name))
  (message "*** Emacs loaded in %.3f seconds with %d garbage collections ***"
	   (float-time (time-subtract after-init-time before-init-time))
	   gcs-done)
  (setq gc-cons-percentage (get 'gc-cons-percentage 'original-value))
  (setq gc-cons-threshold (get 'gc-cons-threshold 'original-value))
  (message "*** Setting gc-cons-threshold  back to %d ***" gc-cons-threshold)
  (message "*** Setting gc-cons-percentage back to %.2f ***" gc-cons-percentage))


(add-hook 'after-init-hook 'after-init-fn)

(provide 'early-init)
;;; early-init.el ends here
