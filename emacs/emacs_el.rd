# RD で書いてみる
# 
=begin
= Emacs設定
== .emacs.d/init.elを晒す 
 ;; ロードパスの設定
 (setq load-path (append
                   '("~/.emacs.d")
                   load-path))
 ;; local.elの読み込み
 (ignore-errors (require 'local))
 
 ; 言語 --------------------------------------------------
 ;; 言語を日本語にする
 (set-language-environment 'Japanese)
 ;; 極力UTF-8とする
 (prefer-coding-system 'utf-8)
 
 ; eshell -----------------------------------------------
 ;; ショートカットでeshellが起動するようにする
 (global-set-key [?\C-c t] 'eshell)
 ;; 補完時に大文字小文字を区別しない
 (setq eshell-cmpl-ignore-case t)
 ;; 確認なしでヒストリ保存
 (setq eshell-ask-to-save-history (quote always))
 ;; sudoのあとも補完可能に
 (defun pcomplete/sudo ()
   "Completion rules for the `sudo' command."
   (let ((pcomplete-help "complete after sudo"))
     (pcomplete-here (pcomplete-here (eshell-complete-commands-list)))
   )
 )
 ;; 補完時にサイクルする
 (setq eshell-cmpl-cycle-completions t)
 ;; 補完時にサイクルしない
 ;(setq eshell-cmpl-cycle-completions nil)
 ;;補完候補がこの数値以下だとサイクルせずに候補表示
 (setq eshell-cmpl-cycle-cutoff-length 8)
 ;; エスケープシーケンスを処理
 ;; http://d.hatena.ne.jp/hiboma/20061031/1162277851
 (autoload 'ansi-color-for-comint-mode-on "ansi-color"
           "Set `ansi-color-for-comint-mode' to t." t)
 (add-hook 'eshell-load-hook 'ansi-color-for-comint-mode-on)
 ;; http://www.emacswiki.org/emacs-ja/EshellColor
 (require 'ansi-color)
 (require 'eshell)
 (defun eshell-handle-ansi-color ()
   (ansi-color-apply-on-region eshell-last-output-start
                               eshell-last-output-end))
 (add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color)
 
 ;---------------------------------------------------------
 ;; 編集行をハイライト
 (defface hlline-face
   '((((class color)
       (background dark))
      (:background "dark slate gray"))
     (((class color)
       (background light))
 ;;     (:background "ForestGreen"))
      (:background "#000000"))
     (t
      ()))
   "*Face used by hl-line.")
 (setq hl-line-face 'hlline-face)
 ;;(setq hl-line-face 'underline) ; 下線
 (global-set-key [?\C-h ?\C-i ] 'hl-line-mode)
 
 ;; 文字数自動表示
 (defun count-lines-and-chars ()
   (if mark-active
       (format "%d lines,%d chars "
               (count-lines (region-beginning) (region-end))
               (- (region-end) (region-beginning)))
       ;;(count-lines-region (region-beginning) (region-end)) ;; これだとエコーエリアがチラつく
     ""))
 
 (add-to-list 'default-mode-line-format
              '(:eval (count-lines-and-chars)))
 
 ;; 対応する括弧を光らせる。
 (show-paren-mode 1)
 
 ;; 最終行に必ず一行挿入する
 (setq require-final-newline t)
 
 ;-------------------------------------------------------------
 ;; URLをブラウザで開く
 (defun browse-url-at-point ()
   (interactive)
   (let ((url-region (bounds-of-thing-at-point 'url)))
     (when url-region
       (browse-url (buffer-substring-no-properties (car url-region)
 						    (cdr url-region))))))
 (global-set-key "\C-c\C-o" 'browse-url-at-point)  
 
 ; Window ---------------------------------------------------
 ;; Window 間の移動
 (global-set-key [next] 'other-window)
 (defun back-window ()
   (interactive)
   (other-window -1))
 (global-set-key [prior] 'back-window)
 ;; emacs -nw で起動した時にメニューバーを消す
 (if window-system (menu-bar-mode 1) (menu-bar-mode -1))
 
 ;;; Window を出した時の設定 ;;;
 (cond
   ( (eq window-system 'x) ;; EmacsがX上で起動している場合
     (setq inhibit-startup-message t)
     ;; ツールバーを表示しない
     (tool-bar-mode 0)
     ;; 文字の色を設定します。 
     (add-to-list 'default-frame-alist '(foreground-color . "white")) 
     ;; 背景色を設定します。 
     (add-to-list 'default-frame-alist '(background-color . "black")) 
     ;; font size
     (set-face-attribute 'default nil :height 130) 
     ;; 編集行をハイライト
     (defface hlline-face
       '((((class color)
 	  (background dark))
 	 (:background "dark slate gray"))
 	(((class color)
 	  (background light))
 	 (:background "ForestGreen"))
 	(t
 	 ()))
       "*Face used by hl-line.") 
     ;; スクロールバーを消す
     (scroll-bar-mode nil)
     ;; メニューバーを消す
     (menu-bar-mode nil)  ))
 
 
 
 ; 各Mode の設定 -------------------------------------------
 ;;; Ruby ;;;
 ; https://github.com/uwabami/dot.emacs.d/blob/master/config/ruby-mode_config.org
 (require 'ruby-mode nil 'noerror)
 (autoload 'ruby-mode "ruby-mode"
   "Major mode for ruby files" nil t)
 (add-to-list 'auto-mode-alist
             '("\\.rb$" . ruby-mode))
 (add-to-list 'auto-mode-alist
              '("\\.rake$" . ruby-mode))
 (add-to-list 'auto-mode-alist
              '("\\.ru$" . ruby-mode))
 (add-to-list 'auto-mode-alist
              '("Rakefile" . ruby-mode))
 (add-to-list 'auto-mode-alist
              '("Gemfile" . ruby-mode))
 (add-to-list 'auto-mode-alist
              '("Capfile" . ruby-mode))
 (add-to-list 'interpreter-mode-alist
              '("ruby" . ruby-mode))
 
 ;; rd-mode が起動した際に, =end \n\n =begin を省略しない.
 (add-hook 'rd-mode-hook 'rd-show-other-block-all)
 (add-to-list 'auto-mode-alist
              '("\\.rd$" . rd-mode))
 
 ;; C
 (add-hook 'c-mode-common-hook
           '(lambda ()
              ;; センテンスの終了である ';' を入力したら、自動改行+インデント
              (c-toggle-auto-hungry-state 1)
 	     ;; インデント幅を2にする
 	     (setq c-basic-offset 2) 
              ;; RET キーで自動改行+インデント
              (define-key c-mode-base-map "\C-m" 'newline-and-indent) ))
 
 ;; f90
 (add-hook
   'f90-mode-common-hook
   (lambda ()
     ;; インデント幅を2にする
     (setq c-basic-offset 2) ))
 (setq auto-mode-alist
       (append '(("\\.F90$" . f90-mode))
           auto-mode-alist))
 
 
=end
