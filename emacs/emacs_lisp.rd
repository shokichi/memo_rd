#####################################
# Emacs Lisp 入門
#
#####################################
= Emacs Lisp 入門
== はじめに
=== elisp(emacs lisp)とは
elispはEmacsを拡張するためのプログラミング言語である.
文法はほとんどclispと同じである. 

=== 得意なこと・苦手なこと
得意なこと
* テキスト加工
* 対話インターフェースの作成
* 他のプログラムとの連携
* テキスト色付け

苦手なこと
* 素早い動作

elispはテキストの加工などは得意だが, 
動作が遅いため複雑な処理は苦手である. 

=== 準備
* auto-install.el のインストール
 $ mkdir -p ~/.emacs.d/auto-install
 $ cd ~/.emacs.d/auto-install
 $ wget http://eee.emacswiki.org/emacs/download/auto-install.el
 $ emacs --batch -Q -f batch-byte-compile auto-install.el

設定に以下を追加
 (add-to-list 'load-path ""~/.emacs.d/auto-install/")
 (require 'auto-install)
 (auto-install-update-emacswiki-package-name t)
 (auto-install-compatibility-setup)
 (setq ediff-window-setup-function 'ediff-setup-windows-plain)

再起動をおこなう

* 必須ファイルのインストール
:open-junk-file.el 
試行錯誤ファイルを開く
 M-x install-elisp-from-emacswiki open-junk-file.el
:lispxmp.el
式の評価結果を注釈
 M-x install-elisp-from-emacswiki lispxmp.el
:paredit.el
カッコの対応を保持して編集
 M-x install-elisp http://mumble.net/~campbell/emacs/paredit.el
:auto-async-byte-compile.el
保存時に自動コンパイル
 M-x install-elisp-from-emacswiki auto-async-byte-compile.el

できない

* 設定

== 参考資料
* るびきち: Emacs Lisp テクニックバイブル, 2011, 技術評論社.
