########################################
# 	    Ubuntu USBブート
#         作業日 2011/6/14-17
########################################
=begin
=Ubuntu USBブート
ubuntuのUSBブートをやってみた時(2011/6/14-17)の記録.
ここで使用するUSBは8GB以上が望ましい. 

== LiveCDの作成 
* ubuntuのイメージをダウンロード
 http://www.ubuntulinux.jp/download/
日本語 Rimix CD イメージのダウンロード
を選択
* 解凍
* CDにイメージを書き込む
  * CDを用意
    * 700MB 
*ISOイメージを書き込むためにはDeepBurnerを使用する
 1:「ISOイメージの書き込み」を選択
 2:イメージを選択
 3:書き込み

== LiveCDから起動
* CDから起動
  * CDを入れた状態でPCを起動 (紫色のCDを使う)
  * BIOSで起動をCD優先にしておく
* 起動したらインストール先のUSBを接続
== USBのパーティション
USBのパーティションはGPartedを使って切る
* sdb1
  * Resize/Move the selected partition をクリック
    * sdb1 の容量を調節
* sdb2
  * unallocated を選択
  * Create a new partition in the selected unallocated spaceをクリック
    * 設定したら「OK」
* Apply All Operatioins で変更を適応させる

== インストール
* ネットワークは有線でつないでおく
* デスクトップにあるインストールのアイコンをクリック
* 言語を選択
* 「それ以外」を選択
  * 「インストール中にアップデートをダウンロードする」にチェック
* ファイルシステムの設定
  * sdb1
    * フォーマットをダブルクリック
    * フォーマットをext3を設定
    * マウントポイントを / にする
  * sdb2
    * スワップに設定
  * Device for boot loader installation
    * /dev/sdb1 を選択 
* インストール
  * 地域を選択
    * tokyo
  * キーボードを選択
    * japan
  * ユーザアカウントとホスト名の設定
    * アカウント名とパスワードを入力
  * 「インストール」

=end


