=begin
= Railsインストール(失敗編)
 # apt-get install apache2 curl git libmysqlclient-dev mysql-server nodejs
 
== Rubygems インストール
 # apt-get install rubygems

== Rails インストール
 # gem install rails

== MySQL インストール
 # apt-get install mysql-server 
root パスワードを聞かれるのでパスワードを設定

MySQLにログイン
 $ mysql -u root -p 
 Enter password:
ユーザ情報の表示
 mysql> select user,host,password from mysql.user;
匿名ユーザの削除
 mysql> delete from mysql.user where user=''; 
ログアウト
 mysql> exit 

== SQLiteのインストール
 # apt-get install sqlite3
 # apt-get install libsqlite3-dev libsqlite3-ruby
 # gem install sqlite3-ruby

== とりあえず動かしてみる
 $ rails new demo
 $ cd demo
 $ rails server
・・・うごかない.
=end
