##############################
# Mew setup
#
##############################
== Install
 # apt-get install mew mew-bin

== IMAP
 # apt-get install stunnel

== .emacs.el
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

== .mew.el

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
 C-c C-m
返信メールの作成(引用なし)
 A  
返信メールの作成(引用あり)
 a
ファイルの添付

=== アドレス
アドレス補完
  
