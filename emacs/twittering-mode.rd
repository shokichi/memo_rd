############################
#  Twitter on Emacs
#
############################
=begin
= Emacs Twittering-mode
EmacsからTwitterに投稿
== ダウンロード
 $ cd ~/.emacs/modules 
 $ git clone git://github.com/hayamiz/twittering-mode.git

== パスの設定
* init.elに以下を追加
 (load-file 
   (expand-file-name 
      "~/.emacs.d/modules/twittering-mode/twittering-mode.el"))
 (require 'twittering-mode)

== 起動
* 起動
 M-x twit

Pinコードを取得してログイン

== PinコードをGPGで管理
* init.elに以下を追加
 (setq twittering-use-master-password t)

* emacsをもう一度起動してTwittering-modeにする
* Piｎコードをもう一度入力
* GPG鍵のパスフレーズを入力(2回)

ログイン毎にGPGのパスフレーズを入力してログイン

=== Twitterのパスワードを変更した場合
* 特におこなう作業はなし
* 自動的にTOKENのパスワードは更新される
  * おそらくこの理解は正しくない

== 使い方
基本的なものをいくつか
* 読み込み
 g
* 投稿の作成
 u
* 投稿
 C-c C-c
* ダイレクトメッセージ作成
 d
* 公式リツイート
 C-u C-c Enter
* 非公式リツイート
 C-c Enter

* 

=== Timeline spec
* プロンプトを開く
 V 
* homeのtimeline
 :home
* 受診したDM
 :direct_messages
* 送信したDM
 :direct_messages_sent
* 検索
 :search/QUERY-STRING/

== 参考ページ
* ((<TwitteringMode-ja|URL:http://www.emacswiki.org/emacs/TwitteringMode-ja>))

=end
