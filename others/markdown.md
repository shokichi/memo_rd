# Markdown入門
Markdownについて書く

-----------------------------------
## 書き方

## Emacs markdow-mode
markdown-modeをダウンロード

    $ cd .emacs.d/module
    $ git clone git://jblevins.org/git/markdown-mode.git

.emacs.d/local.elに以下を追加

    ;; markdown
    (load-file (expand-file-name "/home/ishioka/.emacs.d/modules/markdown-mode/markdown-mode.el"))
	(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
	(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))


## 変換ツール
### Pandoc
+ Haskellが動く環境が必要

インストール

    # apt-get install pandoc

使い方

    $ pandoc markdown.md -s -o markdown.html

css読み込み

    $ pandoc -s -c sample.css markdown.md -o markdown.html

目次作成

    $ pandoc -s -S --toc -c sample.css markdown.md -o markdown.html

## 参考
* [はてなブログで「Markdown記法一覧」を書いてみるテスト](http://mametanuki.hateblo.jp/entry/2012/09/22/MarkdownList#Code%20Blocks)
* [多様なフォーマットに対応 ドキュメント変換ツールPand を知ろう](http://qiita.com/sky_y/items/80bcd0f353ef5b8980ee)
