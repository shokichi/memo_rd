###############################
# GitHub 事始め
#
###############################
=begin
= GitHub事始め
GitHubでバージョン管理を使用と思い始めました. 
基本的にソースコードよりも様々なドキュメント
(日頃のメモ/作業ログ)などを置いていく予定です. 

== アカウント作成
GitHubにアカウントを作成する. 
作成方法はここでは省略する(覚えてないから). 

== 手元のリポジトリを作成
# $ touch README.md
 $ git init
 $ git remote add origin https://github.com/shokichi/emacs.git
 $ git push -u origin master

== 基本操作
* ダウンロード 
$ git clone URL

* リポジトリに保存
 $ git commit
オプション
 -a すべてのファイルをコミット
 -m コメントをつける

  * 例
   $ git commit -a -m "comment"  

* githubへアップロード
 $ git push

* 手元のものをアップデート
 $ git pull

* 基本的な流れ
 $ git add hoge
 $ git commit 
 $ git push
オプションは適宜付ける

== 参考ページ
* ((<画像付き Git/GitHub の使い方|URL:http://qiita.com/items/745a7b9546de7a00d827>))
* ((<GitHub使い方まとめ|URL:http://d.hatena.ne.jp/killingout_n-bita/20130324/1364126261>))
* <((猿でもわかるGit入門|URL:http://www.backlog.jp/git-guide/>))

=end