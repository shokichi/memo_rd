###############################
# Git 事始め
#
###############################
=begin
= Git事始め
GitHubでバージョン管理を使用と思い始めました. 
基本的にソースコードよりも様々なドキュメント
(日頃のメモ/作業ログ)などを置いていく予定です. 

== アカウント作成
GitHubにアカウントを作成する. 
作成方法はここでは省略する. 

== 手元のリポジトリを作成
# $ touch README.md
 $ git init
 $ git remote add origin https://github.com/shokichi/emacs.git
 $ git push -u origin master

== 基本操作
コミット
 $ git commit hoge
* オプション
 -a すべてのファイルをコミット
 -m コメントをつける

* 例
 $ git commit -a -m "comment"  

ファイルの追加
 $ git add hoge

ファイルの削除
 $ git rm fago


=== GitHub
* GitHubを使うことを想定
ダウンロード 
 $ git clone URL

GitHubへアップロード
 $ git push

手元のものをアップデート
 $ git pull




== コミットメッセージの書き方
コミットする際のメッセージは以下の点を気を付ける
* 1行目は短い説明文
* 2行目は空行
* 3行目から本文
  * 時制は現在形

== 参考ページ
* ((<画像付き Git/GitHub の使い方|URL:http://qiita.com/items/745a7b9546de7a00d827>))
* ((<GitHub使い方まとめ|URL:http://d.hatena.ne.jp/killingout_n-bita/20130324/1364126261>))
* ((<猿でもわかるGit入門|URL:http://www.backlog.jp/git-guide>))
* ((<英語コミットコメントに使えるオシャレフレーズ集|URL:http://qiita.com/ken_c_lo/items/4cb49f0fb74e8778804d>))
* ((<コミットメッセージの作法|URL:http://qiita.com/suin/items/b3619ddaa176fef519cb>))

=end
