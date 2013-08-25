########################
# lisp 入門
# 
########################
=begin
= lisp 入門
== まずLispについて
Lispは1958年生まれのとても古いプログラミング言語でFORTRAN(1954)や
COBOL(1959)と同世代である. LispはFORTRANやC言語といった手続きが多言語
と異なる関数型言語に分類され, 関数を定義することによってプログラムを
作成する. 

== 準備
以下のコマンドで Common lisp (clisp) をインストールする
 # apt-get install　clisp
これでインストール完了

試しにlisp を立ち上げてみる
 $ clisp
 i i i i i i i       ooooo    o        ooooooo   ooooo   ooooo
 I I I I I I I      8     8   8           8     8     o  8    8
 I  \ `+' /  I      8         8           8     8        8    8
  \  `-+-'  /       8         8           8      ooooo   8oooo
   `-__|__-'        8         8           8           8  8
       |            8     o   8           8     o     8  8
 ------+------       ooooo    8oooooo  ooo8ooo   ooooo   8

 Welcome to GNU CLISP 2.49 (2010-07-07) <http://clisp.cons.org/>

 Copyright (c) Bruno Haible, Michael Stoll 1992, 1993
 Copyright (c) Bruno Haible, Marcus Daniels 1994-1997
 Copyright (c) Bruno Haible, Pierpaolo Bernardi, Sam Steingold 1998
 Copyright (c) Bruno Haible, Sam Steingold 1999-2000
 Copyright (c) Sam Steingold, Bruno Haible 2001-2010

 Type :h and hit Enter for context help.
 [1]>

終了する時はこれ
 [2]> (quit)


== お約束
お約束の"Hello world!!"を表示させる
(やっぱりこれをやらないと落ち着きません)

 > (print "Hello world!!")
 
 "Hello world!!"

== 関数
Lips で関数を呼び出す式は次のような形になる
 > (関数名　引数1 引数2)

単純な演算をおこなう関数として, 加算+, 減算-, 乗算*, 除算/ 関数が存在している. 
これらの演算用関数を用いてLispを実行すると次の様になる. 
 > (+ 4 2)
 6
 > (- 4 2)
 2
 > (* 4 2)
 8
 > (/ 4 2)
 2

さらに, 
 > (+ 1 2 3 4)
 10
 > (- 1 2 3 4)
 13
 > (* 1 2 3 4)
 120
 > (/ 1 2 3 4)
 1/120

=== 関数の定義
新しい関数を定義するにはdefunマクロを使用する. 
 > (defun 関数名 (引数) (処理) )

* 例
 > (defun pow (a b)
     (setq c 1)
     (loop (if (= 0 b) (return c))
       (setq c (* c a))
       (setq b (- b 1))
     )
   )
 > (pow 2 3)
 8

==== 高階関数
関数自体を引数として扱うこともできる. 
このような関数を高階関数という. 
高階関数は次のようにして定義する. 
 > (defun 関数名 (関数 引数)
    (funcall 関数 引数))

* 例
 > (defun calc (func a b)
   (+ (funcall func a b) (funcall func a b)) )
 > (calc #'+ 1 2)
 6

==== ラムダ式

== 変数
変数に値を代入するには setq を用いる. 
 > (setq 変数名 数値)

* 例
 > (setq x 100)
 100

setq は関数の様に振る舞っているが, 実はこれは特別式と呼ばれる式に分類される. 

 通常の関数式に x や y といった変数名を指定した場合、Lisp は指定した変数名を
 評価して変数に格納されている値を参照します。 つまり x に 10 が代入されている
 場合 (+ x 5) は Lisp エンジンに評価されて (+ 10 5) として扱われます。 
 しかし (setq x 5) は (setq 10 5) とは扱われません。 
 x のような変数名が評価されて値が参照されるのではなく、x はあくまで x という名前の
 識別子であると認識されます。 この点で、特別式は関数式と異なるのです。
 
 C 言語のようなコンパイル言語では、変数名のような識別子はコンパイル時に
 コンパイラが識別するためのテキスト上のシンボルに過ぎませんでした。 
 機械語に変換された時点で、変数はメモリアドレスで管理されているため識別子という考えは
 すでに消滅しています。
 
 しかし、Lisp において識別子は特別な意味を持ってます。 Lisp 言語では、識別子は
 テキスト上で識別するためのシンボルではなく独立した型として認識されています。 
 究極的には変数に変数名(識別子)を保存することもできます。 これは、C 言語における
 ポインタのような役割を果たします。 
 (http://wisdom.sakura.ne.jp/programming/lisp/clisp5.html) 

* 識別子
 > (quote x) 

== 配列
配列の作成は以下のようにしておこなう
 > (make-array 5)
 #(NIL NIL NIL NIL NIL)
 > (make-array '(2 3))
 #2A(NIL NIL)(NIL NIL NIL)

初期値の設定
 > (make-array 5 :initial-contents '(1 2 3 4 5))
 #(1 2 3 4 5)
 > (make-array 5 :initial-elements 1)
 #(1 1 1 1 1)
 > (make-array '(2 3) :initial-elements 1)
 #2A(1 1)(1 1 1)

=== 配列の操作
配列の要素を取得するにはarefを使用する. 
 > (aref 配列 添字)

* 例
 > (setq a (make-array '(2 2) :initial-contents '((1 2)(3 4)) ) ) 
 > (aref a 0 0)
 1

配列の要素に値を代入する場合には setf を使用する. 
 > (setf 配列の要素 値)

* 例
 > (setq a (make-array 4))
 > (setf (aref a 0) 10)
 > (print a)
 #(10 NIL NIL NIL)

== リスト
Lispには配列のようなものとしてリストというものが存在する. 
リストは以下のようにして使用する. 
 > (list リスト)

* 例
 > (setq x (list 1 2 3))
 > (print x) 
 (1 2 3) 

または
 > (setq x '(1 2 3))
 > (print x)
 (1 2 3)

=== リストの操作
リストの先頭要素を取得するには car を使用する. 
また, 先頭以外の要素を取得したい場合は cdr を使用する

* 例
 > (setq x '(1 2 3)) 
 > (print (car x))
 1
 > (print (cdr x))
 (2 3)

リストの要素に値を代入する場合, 配列と同じように setf を使用する. 
 > (setf リストの要素 値)

* 例
 > (setq x '(1 2 3))
 > (setf (car (cdr x)) 10)
 > (print x)
 (1 10 3)

== 条件分岐
分岐処理をおこなうにはif特別式を使用する. 
if特別式は最初の引数に渡された条件が 
真であれば第二引数行い, 偽ならば第三引数を実行する
という分岐処理を行う. 
* 例
 > (setq x 100)
 > (if (= x 10)(setq y 10)(setq y 0))
 0

== 繰り返し処理
繰り返し処理をおこなうときはloopマクロを使用する.
* 例
 > (loop 
      (if (= i 0)(return i))
      (setq x (cons i x))
      (setq i (- i 1))
    )
 > x
 (1 2 3 4 5 6 7 8 9 10)

== 入出力
=== ファイル出力
ファイルに出力をおこなう場合, 次のようにおこなう
 > (setf stream (open "ファイル名" :direction :output) )
 > (format stream 出力するのも)
 > (close stream)

* 例
 > (setf stream (open "hoge" :direction :output) )
 > (format stream "hogehoge")
 > (close stream)
カレントディレクトリを見るとなかにhogehogeと書かれたhogeというファイルが存在している


ファイルがすでに存在する可能性がある場合には :if-exists を使う
 > (setf stream (open "ファイル名" :direction :output :if-exists 処理方法))

* 例
ファイルが存在する場合, ファイルに上書きする
 > (setf stream (open "hoge" :direction :output :if-exists :overwrite))
 > (format stream) 
 > (close stream)

=== ファイル読み込み
ファイル読み込みをおこなう場合, 次のようにおこなう
 > (setf stream (open "ファイル名" :direction :input))
 
* 例
 > (setf stream (open "hoge" :direction :input))
 > (setf line (read-line stream))
 > (print line)
 hogehoge


#== 数値データ
#上で用いた4や2など数値データには以下の様にいくつかの種類が存在する. 
#
#1:整数型(integer)
#基本的に10進数で表現されるが, 以下のような方法で基数を変更することも
#できる. 
# #基数r整数
#ただし, 10進数以外で用いられる可能性があるのは2進数, 8進数, 16進数くらい
#である. そのため, #bから始まる整数は2進数, #oから始まる整数は8進数, #x
#から始まる整数は16進数とあらかじめ決められている. 

#2:分数(ratios)


#3:浮動点数(floating point number)

#== 文字データ

== 参考ページ
* ((<CLISP NOTE|URL:http://clispnote.wiki.fc2.com/wiki/Common%20Lisp%E3%82%92%E3%81%AF%E3%81%98%E3%82%81%E3%82%88%E3%81%86>))
* ((<Lisp入門|URL:http://wisdom.sakura.ne.jp/programming/lisp/>))
* ((<xyzzy Lisp Programming|URL:http://www.geocities.jp/m_hiroi/xyzzy_lisp/abclisp05.html>))
* ((<Common Lisp 詳細入門編 入出力|URL:http://www.fireproject.jp/feature/common-lisp/details/io.html>))

=end
