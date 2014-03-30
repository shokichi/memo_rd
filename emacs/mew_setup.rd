]##############################
# Mew setup
#
##############################
== Install
=== mew
 # apt-get install mew mew-bin

=== IMAP
 # apt-get install stunnel

== 設定
=== .emacs.el
 ;; mew
 (autoload 'mew "mew" nil t)
 (autoload 'mew-send "mew" nil t)
 
 (setq mew-demo nil)
 
 ;; Optional setup (Read Mail menu for Emacs 21):
 (if (boundp 'read-mail-command)
     (setq read-mail-command 'mew))
 
 ;; Optional setup (e.g. C-xm for sending a message):
 (autoload 'mew-user-agent-compose "mew" nil t)
 (if (boundp 'mail-user-agent)
     (setq mail-user-agent 'mew-user-agent))
 (if (fboundp 'define-mail-user-agent)
     (define-mail-user-agent
       'mew-user-agent
       'mew-user-agent-compose
       'mew-draft-send-message
       'mew-draft-kill
       'mew-send-hook))

=== .mew.el
 ;; メールアドレス
 (setq user-mail-adress "hogehoge@adress.com")
 (setq user-full-name "YOUR Name")
 ;; SMTP
 (setq smtpmail-smtp-server "smtp.nantoka.com")
 (setq mail-user-agent 'message-user-agent)
 (setq message-send-mail-function 'message-smtpmail-send-it)
 ;; IMAP
 ??? 
 ;; 引用ラベルの設定
 (setq mew-cite-fields '("From:" "Date:"))
 (setq mew-cite-format "From: %s\t(%s)\n")
 ;; 起動時にメールを取りにいかないようにする
 (setq mew-auto-get nil)
 ;; パスワードを一時的に保存する
 (setq mew-use-cached-passwd t)
 ;; 自動でメール確認
 (setq mew-use-biff t)
 ;; メールをチェックしに行く間隔(分)
 (setq mew-imap-biff-interval 15)


== 基本的な使い方
=== 受信
メールの受信
 s

受信する範囲の選択 range: 
* 最後から100個を受信
 last:100
 
=== 送信・転送
メールの送信
 C-c C-c
メールの転送 

=== メールの作成 
新規メールの作成
 w
返信メールの作成(引用なし)
 A  
返信メールの作成(引用あり)
 a

=== 編集
ファイルの添付
 C-c C-a
 attachments の中で c

作成の中止
 C-c C-q

+draft, +queueに入っているメールを編集
 E

=== アドレス
アドレス補完
 Tab

=== 署名
~/.signatureに署名を書いておく   

挿入
 C-c Tab

=== フォルダ
フォルダを切り替える
 g


== 参考ページ
* ((<Mewの操作方法|URL:http://cns-guide.sfc.keio.ac.jp/1999/5/2/2.html>))
* ((<Mew主要コマンド一覧(添付ファイル編)|URL:http://www-kn.sp.u-tokai.ac.jp/com/computer/mew_4/mew_4.html#4>))
