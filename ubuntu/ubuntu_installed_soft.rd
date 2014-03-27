= インストールメモ
手元のUbuntu12.04にインストールしたものを覚えている範囲で載せておく. 
Rails, Dennou-Ruby関連のものについては別のページを見よ. 

== MPI
 # apt-get install openmpi-bin openmpi-dev

== Ruby
=== rvm install
Rubyの管理にrvmを使用する

 # curl -L https://get.rvm.io | bash -s stable --ruby

apt-get install ruby-rvm でインストールしていた場合は
 # rm -rf /usr/share/ruby-rvm /etc/rvmrc /etc/profile.d/rvm.sh
で削除しておく

 # source /usr/local/rvm/scripts/rvm

=== Rubygems
rvmでRubyの管理をおこなう(予定な)ので
 # apt-get install rubygems
でRuby-gemsを入れていた場合は削除しておく

 # apt-get --purge remove rubygems
 # apt-get autoremove 

 # rvm install rubygems

* gemで入れたソフトのアップデート
 # gem update

=== rubygems-update
* rubygems-updateのインストール
 # gem install rubygems-update
* アップデート
 # update_rubygems


=== ruby2.0.0
 # rvm install 2.0.0

 # rvm list 
で確認

 # rvm using 2.0.0

 # rvm install 1.9.3

=== ruby2.1.0
* rvmを最新にする
 # rvm get stable

* インストール
 # rvm install 2.1.0

* デフォルト設定
 # rvm use --default 2.1.0

== readline 
* 何だったか忘れた...orz
 # rvm pkg install readline
 # rvm reinstall all --force

== RubyInline
Rubyスクリプトの中にCのコードを入れるためのライブラリ
 # gem install ZenTest
 # gem install RubyInline


== Swig
C ライブラリをRubyから呼びだすためのラッパー関数を自動生成するプログラム
 # apt-get install swig

== Oracle java 7
オラクルのJava
 # add-apt-repository ppa:webupd8team/java
 # apt-get update
 # apt-get install oracle-java7-installer

* 参考ページ
  * ((<Ubuntu 12.04にOracle Java 7を簡単にインストールした。|URL:http://radi0ant.hatenablog.com/entry/2012/05/04/035243>))

== Emacs24
 # add-apt-repository ppa:cassou/emacs
 # apt-get update
 # apt-get install emacs24 emacs24-el

* Emacsバージョン確認
 M-x emacs-version
