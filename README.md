# Kosi

[![Gem Version](https://badge.fury.io/rb/kosi.svg)](http://badge.fury.io/rb/kosi)
[![Gem Downloads](https://img.shields.io/gem/dt/kosi.svg)](http://badge.fury.io/rb/kosi)
[![Build Status](https://travis-ci.org/tbpgr/kosi.png?branch=master)](https://travis-ci.org/tbpgr/kosi)
[![Coverage Status](https://coveralls.io/repos/tbpgr/kosi/badge.png)](https://coveralls.io/r/tbpgr/kosi)
[![Code Climate](https://codeclimate.com/github/tbpgr/kosi.png)](https://codeclimate.com/github/tbpgr/kosi)

ターミナルアプリケーション用表フォーマットサポートツール。格子。

## :notes: Images
### :baby_chick: Before

:rage1::rage1::rage1:,:alien:,:older_woman::older_woman:  
:older_man:,:dog:,:baby::baby::baby::baby::baby::baby::baby:  
:cat::cat:,:octocat::octocat::octocat::octocat::octocat::octocat::octocat:,:octopus::octopus::octopus::octopus::octopus:  

### :chicken: After
+----------+--------------------------+--------------------------+  
|:rage1::rage1::rage1:|:alien::grey_question::grey_question::grey_question::grey_question::grey_question::grey_question:|:older_woman::older_woman::grey_question::grey_question::grey_question::grey_question::grey_question:|  
|:older_man::grey_question::grey_question:|:dog::grey_question::grey_question::grey_question::grey_question::grey_question::grey_question:|:baby::baby::baby::baby::baby::baby::baby:|  
|:cat::cat::grey_question:|:octocat::octocat::octocat::octocat::octocat::octocat::octocat:|:octopus::octopus::octopus::octopus::octopus::grey_question::grey_question:|  
+----------+--------------------------+--------------------------+  

## :cloud::arrow_down: Installation

Add this line to your application's Gemfile:

    gem 'kosi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kosi

## :man: Description
2次元配列をテーブルフォーマットにして出力します。  
:link: [terminal-table gem](https://github.com/tj/terminal-table) の日本語対応版にあたります。  
（terminal-tableはASCII対応のみなので全角文字が混ざるとテーブルレイアウトが崩れる）  

## :o2: Options
### :icecream: Align
配置指定。右寄せ、左寄せ、中央を選択可能。  

| 設定可能パラメータ | 説明 |
|:-----------|:-----------|
|Kosi::Align::TYPE::RIGHT|右寄せ|
|Kosi::Align::TYPE::LEFT|左寄せ。デフォルト|
|Kosi::Align::TYPE::CENTER|中央|

### :icecream: ConnectorChar
表の結合部に表示するテキスト。1文字で指定。  
下記で言うところの 「+」がConnectorChar。  

~~~
+-----+------+-------+
|a    |b     |c      |
+-----+------+-------+
~~~

### :icecream: Header
表のヘッダー。配列で指定。  
デフォルトはヘッダーなし。  

### :icecream: HorizontalBorderChar
水平線を1文字で設定。  
デフォルトは「-」(半角ハイフン)  

### :icecream: SeparateEachRow
各行に区切り線を入れるかどうか。  
デフォルトは「false」  

### :icecream: VerticalBorderChar
垂直線を1文字で設定。  
デフォルトは「|」（パイプ）  

## :scroll: Usage
### :shaved_ice: オプション指定なし  
~~~ruby
require 'kosi'

kosi = Kosi::Table.new
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
~~~

* 出力  
※GitHubの表示上ずれているかもしれませんが、等幅フォント利用時にそろいます。

~~~
+-----+------+-------+
|a    |b     |c      |
|ほｹﾞ1|ひｹﾞ22|へｹﾞ333|
+-----+------+-------+
~~~

### :shaved_ice: Align指定
~~~ruby
require 'kosi'

kosi = Kosi::Table.new({align: Kosi::Align::TYPE::CENTER})
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
kosi = Kosi::Table.new({align: Kosi::Align::TYPE::RIGHT})
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
kosi = Kosi::Table.new({align: Kosi::Align::TYPE::LEFT})
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
~~~

* 出力  

~~~
+-----+------+-------+
|  a  |  b   |   c   |
|ほｹﾞ1|ひｹﾞ22|へｹﾞ333|
+-----+------+-------+
+-----+------+-------+
|    a|     b|      c|
|ほｹﾞ1|ひｹﾞ22|へｹﾞ333|
+-----+------+-------+
+-----+------+-------+
|a    |b     |c      |
|ほｹﾞ1|ひｹﾞ22|へｹﾞ333|
+-----+------+-------+
~~~

### :shaved_ice: ConnectorChar指定
~~~ruby
require 'kosi'

kosi = Kosi::Table.new
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
kosi = Kosi::Table.new({connector_char: 'x'})
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
kosi = Kosi::Table.new({connector_char: '$'})
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
~~~

* 出力  

~~~
+-----+------+-------+
|a    |b     |c      |
|ほｹﾞ1|ひｹﾞ22|へｹﾞ333|
+-----+------+-------+
x-----x------x-------x
|a    |b     |c      |
|ほｹﾞ1|ひｹﾞ22|へｹﾞ333|
x-----x------x-------x
$-----$------$-------$
|a    |b     |c      |
|ほｹﾞ1|ひｹﾞ22|へｹﾞ333|
$-----$------$-------$
~~~


### :shaved_ice: Header指定
~~~ruby
require 'kosi'

kosi = Kosi::Table.new
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
kosi = Kosi::Table.new({header: %w{column1 column2 column3}})
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
~~~


* 出力  

~~~
+-----+------+-------+
|a    |b     |c      |
|ほｹﾞ1|ひｹﾞ22|へｹﾞ333|
+-----+------+-------+
+-------+-------+-------+
|column1|column2|column3|
+-------+-------+-------+
|a      |b      |c      |
|ほｹﾞ1  |ひｹﾞ22 |へｹﾞ333|
+-------+-------+-------+
~~~

### :shaved_ice: HorizontalBorderChar指定
~~~ruby
require 'kosi'

kosi = Kosi::Table.new
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
kosi = Kosi::Table.new({horizontal_border_char: '*'})
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
~~~

* 出力  

~~~
+-----+------+-------+
|a    |b     |c      |
|ほｹﾞ1|ひｹﾞ22|へｹﾞ333|
+-----+------+-------+
+*****+******+*******+
|a    |b     |c      |
|ほｹﾞ1|ひｹﾞ22|へｹﾞ333|
+*****+******+*******+
~~~

### :shaved_ice: SeparateEachRow指定
~~~ruby
require 'kosi'

kosi = Kosi::Table.new
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333'], [*'a'..'c']])
kosi = Kosi::Table.new({separate_each_row: true})
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333'], [*'a'..'c']])
~~~

* 出力  

~~~
+-----+------+-------+
|a    |b     |c      |
|ほｹﾞ1|ひｹﾞ22|へｹﾞ333|
|a    |b     |c      |
+-----+------+-------+
+-----+------+-------+
|a    |b     |c      |
+-----+------+-------+
|ほｹﾞ1|ひｹﾞ22|へｹﾞ333|
+-----+------+-------+
|a    |b     |c      |
+-----+------+-------+
~~~

### :shaved_ice: VerticalBorderChar指定
~~~ruby
require 'kosi'

kosi = Kosi::Table.new
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
kosi = Kosi::Table.new({vertical_border_char: '#'})
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
~~~

* 出力  

~~~
+-----+------+-------+
|a    |b     |c      |
|ほｹﾞ1|ひｹﾞ22|へｹﾞ333|
+-----+------+-------+
+-----+------+-------+
#a    #b     #c      #
#ほｹﾞ1#ひｹﾞ22#へｹﾞ333#
+-----+------+-------+
~~~

### :shaved_ice: 複合オプション
様々なオプションを一気に指定してみます

~~~ruby
require 'kosi'

kosi = Kosi::Table.new(
    {
      align: Kosi::Align::TYPE::CENTER,
      connector_char: 'x',
      header: %w{column1 column2 column3},
      horizontal_border_char: '*',
      vertical_border_char: '#',
      separate_each_row: true
    }
  )
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333'], [*'a'..'c']])
~~~

* 出力  

~~~
x*******x*******x*******x
#column1#column2#column3#
x*******x*******x*******x
#   a   #   b   #   c   #
x*******x*******x*******x
# ほｹﾞ1 #ひｹﾞ22 #へｹﾞ333#
x*******x*******x*******x
#   a   #   b   #   c   #
x*******x*******x*******x
~~~

## :memo: 注意事項
* gem のバージョンが 2.0.1 以下だと unicode gem でエラーが発生するケースがあるようです。
  その場合は gem を 2.0.2 以上に Update してください。

## :two_men_holding_hands: Contributing :two_women_holding_hands:

1. Fork it ( https://github.com/tbpgr/kosi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
