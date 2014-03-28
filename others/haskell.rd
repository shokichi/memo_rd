= Haskell 入門
とりあえず環境を整えるまで. 
== Install
=== GHC
* Ubuntu 12.04
 # apt-get install libgmp-dev libgmp3c2
 $ wget http://www.haskell.org/ghc/dist/7.4.2/ghc-7.4.2-i386-unknown-linux.tar.bz2
 $ tar xfv ghc-7.4.2-i386-unknown-linux.tar.bz2
 $ cd ghc-7.4.2
 $ ./configure --prefix=/usr/local/ghc --bindir=/usr/local/bin
 # make install

* Debian wheezy
 # apt-get install libgmp10-dev
 # ln -s /usr/lib/i386-linux-gnu/libgmp.so.10 /usr/lib/libgmp.so.3
 $ wget http://www.haskell.org/ghc/dist/7.6.3/ghc-7.6.3-i386-unknown-linux.tar.bz2
 $ tar jxf ghc-7.6.3-i386-unknown-linux.tar.bz2
 $ cd ghc-7.6.3
 $ ./configure --prefix=/usr/local/ghc --bindir=/usr/local/bin
 # make install 
 
=== Haskell Platform
* Ubuntu 12.04
 # apt-get install freeglut3-dev
 $ wget http://lambda.haskell.org/platform/download/2012.4.0.0/haskell-platform-2012.4.0.0.tar.gz
 $ tar xfz haskell-platform-2012.4.0.0.tar.gz
 $ cd haskell-platform-2012.4.0.0
 $ ./configure --prefix=/usr/local/haskell --bindir=/usr/local/bin
 $ make
 # make install

* Debian wheezy
 # apt-get install freeglut3-dev
 $ wget http://lambda.haskell.org/platform/download/2013.2.0.0/haskell-platform-2013.2.0.0.tar.gz
 $ tar xfz haskell-platform-2013.2.0.0.tar.gz
 $ cd haskell-platform-2013.2.0.0
 $ ./configure --prefix=/usr/local/haskell --bindir=/usr/local/bin
 $ make
 # make install

== Emacsのの設定 
* haskell-modeのインストール
 # apt-get install haskell-mode

* .emacs.d/local.elの編集
 (load-file (expand-file-name "/usr/share/emacs23/site-lisp/haskell-mode/haskell-site-file.elc"))
 (require 'haskell-mode)
 (require 'haskell-cabal)
 (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
 (add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
 (add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
 (add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))


== 実行
* 対話型
 $ ghci 
 GHCi, version 7.6.3: http://www.haskell.org/ghc/  :? for help
 Loading package ghc-prim ... linking ... done.
 Loading package integer-gmp ... linking ... done.
 Loading package base ... linking ... done.
 Prelude>

* コンパイル
 $ ghc -o hello hello.hs

== 参考ページ
* ((<Ubuntu 12.04 に Haskell Platform をインストールする|URL:http://itakeshi.hatenablog.com/entry/2013/02/22/200603>))
* ((<WheezyにHaskell Platform最新版をインストール|URL:http://takeisamemo.blogspot.jp/2013/11/debianhaskellwheezyhaskell-platform.html>))
* ((<GitHub haskell-mode|URL:https://github.com/haskell/haskell-mode>))
* ((<すごいHaskellたのしく学ぼう！|URL:http://ssl.ohmsha.co.jp/cgi-bin/menu.cgi?ISBN=978-4-274-06885-0>))
