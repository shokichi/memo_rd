# Ubuntu 管理ログ

## VMWareToolsのバグ

* 2015/05/02

カーネルアップデートをおこなった後にVMWareToolsの再インストールを
おこなったところ, 共有フォルダを認識できなくなった.
Ubuntu側の障害ではないがおこなった対策をメモしておく.
(作業後にメモを作成している時点でエラーログを保存していなかったことに気が付いた. しまった...)

### 作業内容
パッチが公開されているのでそれを当てる.
以下を実行するとパッチが当てられたVMWareToolsがコンパイルされる.

    $ git clone https://github.com/rasa/vmware-tools-patches.git
	$ cp /media/VMWareTools-*.tar.gz vmware-tools-patches/
	$ cd vmware-tools-patches
	$ ./untar-and-patch-and-compile.s

いつもどおりVMWareToolsのインストールをおこなう

    $ cd vmware-tools-distrib
    $ sudo perl vmware-install.pl


### 参考
* [VMWareFusionでフォルダ共有ができなくなった場合の対処](http://qiita.com/maccotsan/items/fafdc01deac71c20bd60)
