#####################################
# Ruby on Rails 
# DataBaseに関するメモ
#####################################
=begin
= Rails: DataBaseの編集
== テーブルの変更・修正
migrationスクリプトの作成

 $ rails generate migration [クラス名]

クラス名は[やること+テーブル名]とする

* 例
 $ rails generate migration AddDetailsClips

またデータベースへの追加・削除といった簡単ことを行うスクリプトは以下の方法で作成するのが便利

 $ rails generate migration [クラス名] [追加するカラム]:[型]

ここでクラス名は以下のようにする

 追加する場合:AddHogeTo[テーブル名]
 削除する場合:RemoveHogeFrome[テーブル名]

* 例
 $ rails generate migration AddDetailsToClips title:string author:string

migrationスクリプトを適用
 $ rake db:migrate

migrateionスクリプトを削除
 $ rails destroy migration AddDetailsToClips


== SQLite の使い方
* 起動方法
 $ sqlite3 [データベース]

* データベースに格納されているテーブルの確認
 sqlite > .tables

* 表の中身を見る
 sqlite > select * frome [テーブル名]
表示する形式を変更
 sqlite > .mode [形式]

== 参考ページ
* ((<マイグレーション機能とは|URL:http://www.rubylife.jp/rails/model/index5.html>))
* ((<新しいマイグレーションを追加してテーブルを変更|URL:http://www.rubylife.jp/rails/model/index7.html>))

=end
