# RD で書いてみる
# 
=begin
= Emacs メモ

== emacs.elの設定
* emacs の設定
今のところこんな感じ. 
他所から持ってきたもので一部(ほとんど?)解読されていない. 

 ;; 言語を日本語にする
 (set-language-environment 'Japanese)
 ;; 極力UTF-8とする
 (prefer-coding-system 'utf-8)
 ;; ショートカットでeshellが起動するようにする
 (global-set-key [?\C-c t] 'eshell)
 ;; 補完時に大文字小文字を区別しない
 (setq eshell-cmpl-ignore-case t)
 ;; 確認なしでヒストリ保存
 (setq eshell-ask-to-save-history (quote always))
 ;; 対応する括弧を光らせる。
 (show-paren-mode 1)
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
 
 (global-set-key [next] 'other-window)
 (defun back-window ()
   (interactive)
   (other-window -1))
 (global-set-key [prior] 'back-window)
 
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
 
=end
