=begin
= Rake 入門
== rake のインストール
 $ gem install rake

== Rakefile書き方
* 基本
 task :default=> [:task_1, task_2,...]

 task task_1 do
   sh "mv -p hoge.txt fago/hogehoge.txt"
 end

 task task_2 do
   sh "rm -r fago"
 end

* 例
 task :tex do
   sh "rd2tex-euc hoge.rd --pdf"
 end
=end
