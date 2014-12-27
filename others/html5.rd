= HTML5とその周辺
職場で使用できるソフトの制約が年々厳しくなっているようなので, 
なるべくインストールなしで開発できるものが必要となっている.
HTMLやJavaScriptはブラウザさえあれば動作する. そしてHTML5は
お絵かきなどもできるようなので, この機会に少し学習してみる.
タイトルはHTML5と付いているが後半はJavascriptにも触れる予定である. 

((<サンプルページ|URL:sample/canvas_sample.thml>))

== HTML5について
「HTML5 は、WHATWG および W3C が HTML4 に代わる次世代の HTML として策定を進めている HTML 仕様」(www.html5.jp)である.

== 基本的な書き方
 <!DOCTYPE html>
 <html lang="ja">
   <head>
     <meta charset="UTF-8">
     <meta http-equiv="Content-Script-Type" content="text/javascript">
     <title>Canvasサンプル</title>
     <link rel="stylesheet" type="text/css" href="../css/sample.css">
   </head>
 <body>
  ここに処理を書く
 </body>
 </html>

=== IE
html5に対応していないIEには以下の文言を書いておく
 <!--[if lt IE 9]>
 <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
 <![endif]-->

これを書くとemacsが固まる...なぜ... 


== Canvas
Canvasはブラウザ上に絵を書くための使用で, JavaScriptをベースとして記述する.
現在(2014/12/18)のところInternetExploreには対応していない.


== JavaScript
=== jQuery
jQueryはJavaScriptライブラリである. 
1.*系と2.*系が存在し, それらの間の互換性は低い. 2.*系が現行のバージョンであるが, 
IE9以前のブラウザも現役で使われているため, それらに対応するために1.*系がまだ残っている. 

* 読み込み方法
<head>内に以下を記述する.
 <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>

<head>は上から順に読み込まれるので, 軽いもの(cssとか)から書いていくと良いらしい.

jQueryの最新版はここで確認する. 2014/12/22現在では2.x系の最新版は2.3.1になっている.
 https://code.jquery.com/

* 基本的な記述方法
 $(function(){
   処理を記述
 });


== 参考ページ
* http://www.html5.jp/canvas/what.html
