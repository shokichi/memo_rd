# RD 事始め
#
#
#

=begin
= RDを使ってみよう
Webのページが比較的簡単に作れるRDtoolという便利なものが存在する. 
ここではRDtoolの基本的な使い方を紹介する(実態は個人的メモ). 
ちなみにこのページの作成にもRDtoolが使用されている. 
== インストール
* OS: Ubuntu12.04
rdtoolをインストール
 # apt-get install rdtool

Emacsのrd-modeをインストール
 # apt-get install rdtool-elisp

== とりあえず使ってみる
初めにRDで書かれたファイル hello.rd を作成する.
hello.rdの中身は以下のようになっている. 

 # コメント
 =begin
 = hello world!!
 == まずはじめに
 * 何ができるか
   * 試してみる
 =end 

次に以下のコマンドを実行
 
 $ rd2 hello.rd > hello.html

== 文字コード
日本語を使うとき文字コードを適切に設定しておかないとブラウザで表示した
時に文字化けしてしまう(自分の場合はUbuntuを使っているので文字コードが
UTF-8となっていて何もしないと文字化けする).
その対策として--html-charset オプションをつける. 
 $ rd2 hello.rd > hello.html --html-charset "UTF-8"


== スタイルシート(CSS)の使い方
上の方法では((<プレーンなページ|URL:hello_simple.html>))になってしまう. 
そこで, スタイルシート(CSS)を導入することで自分色にカスタマイズする.
「スタイルシートなんて触ったこと無い！」という人はまず((<こちら|URL:http://www.tagindex.com/stylesheet/index.html>))

スタイルシートを用意したら以下のコマンドを実行
 $ rd2 -r rd2html-lib.rd hello.rd --with-css=sample.css > hello.html

* ((<結果|URL:hello.html>)) 
* ((<sample.css|URL:../css/sample.css>))

# $ rd2 -r /usr/lib64/ruby/1.8/rd/rd2html-lib.rb rdhowto.rd --with-css=../css/sample.css> rdhowto.html --html-charset "UTF-8"

== 目次作成

== 画像挿入

== 参考ページ
* ((<ごくらくRDtool|URL:http://www.ep.sci.hokudai.ac.jp/~epnetfan/zagaku/2003/1114/kihon/zagaku-daktu32-20031114.htm>))
* ((<RD事始め|URL:http://www.rubyist.net/~rubikitch/computer/rd-intro/>))
* ((<RDでHTML形式のマニュアルを書こう|URL:http://www.cvg.ynu.ac.jp/G2/mem/sasaki/rd.html>))
* ((<rd2html-ext ～rd2html-lib.rbの拡張～|URL:http://www.rubyist.net/~rubikitch/computer/rd2html-ext/>))

=end

