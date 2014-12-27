=begin
= Git使い方メモ
== 差分の確認
コミットされているものと現在のものを比較する
 $ git diff

== ブランチの作成

== ブランチの切り替え
 $ git checkout [branch_name]

== ブランチの確認
 $ git branch 
GitHub上のブランチも確認したい時は -r を付ける
 $ git branch -r
 
== 手元のブランチをGitHubにpushする

== GitHubにあるリポジトリのブランチを手元に持ってくる

== GitHubにあるブランチと手元のブランチを同期する
pull を使わずに fetch　して　merge する
 $ git fetch origin [remote_branch_name]
 $ git checkout -b [local_branch_name]
 $ git merge FETCH_HEAD

== ファイルの復元
 $ git checkout [ファイル名]

=== 参考
* ((<Gitでリモートリポジトリをpull|URL:http://blog.kyokutyo.com/git/git%E3%81%A7%E3%83%AA%E3%83%A2%E3%83%BC%E3%83%88%E3%83%AA%E3%83%9D%E3%82%B8%E3%83%88%E3%83%AA%E3%81%AE%E3%83%96%E3%83%A9%E3%83%B3%E3%83%81%E3%82%92pull/>))
=end
