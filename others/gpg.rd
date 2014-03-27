###################################
# Gnupg
#
###################################
=begin
= Gnupg事始め
GnuPG(GNU Privacy Guard) は暗号化, 復号化, 電子署名等を
おこなうためのツールです. 
== 鍵の生成
 $ gpg --gen-key
~/.gnupg/ に公開鍵と秘密鍵が生成される

(1) RSA and RSAを選択

== ファイルの暗号化/復号化
* 暗号化
 $ gpg -c hogehoge.txt

* 復号化
 $ gpg hogehoge.txt.gpg

=end
