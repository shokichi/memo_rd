####################################
#Ruby on Rails 
#ubuntu12.10LTS
####################################

=begin
= Railsインストールログ
== インストール
=== Git のインストール
 # apt-get install git

=== 各種パッケージのインストール
 # apt-get install curl g++
 # apt-get install zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev libsqlite3-dev

=== rbenv のインストール
* Ubnutu 12.04 LTS の場合
 # apt-get install rbenv
 $ echo 'eval "$(rbenv init-)"' >> ~/.bashrc
 $ source ~/.bashrc

=== ruby-buildのインストール
 $ git clone git://github.com/sstephenson/ruby-build.git
 $ cd ruby-build
 # ./install.sh

=== ruby のインストール
 $ rbenv install 1.9.3-p327
 $ rbenv rehash
 $ rbenv global 1.9.3-p327

* 設定を確認
以下のような文字列が現れることを確認
 $ rbenv version
 1.9.3-p327 (set by /home/ishioka/.rbenv/version)

 $ ruby -v
 1.9.3-p327

=== .gemrcの作成
~/.gemrc を以下のような内容で作成
 install: --no-ri --no-rdoc
 update: --no-ri --no-rdoc

=== Ruby on Rails 3.2 のインストール
 $ gem install rails
 $ rbenv rehash

== 動作確認
=== 新規アプリケーションの作成
 $ rails new demo --skip-bundle
 $ cd demo
 
=== Gemfile の編集
カレントディレクトリにあるGemfileを開き, 次の記述の行頭の#を削除
 # gem 'therubyracer', :platform => :ruby

上記の行の直後に、次の記述を追加
 gem 'libv8', :platform => :ruby

=== 依存パッケージのインストール
 $ bundle install

=== 確認
 $ rails s
ブラウザで確認

== 参考ページ
* ((<Ruby on Rails 3.2 を Ubuntu にインストールする手順をかなり丁寧に説明してみました|URL:http://www.oiax.jp/rails/zakkan/rails_3_2_installation_on_ubuntu.html>))

== おまけ
* ((<失敗編|URL:rails_setup_falt.html>))

=end
