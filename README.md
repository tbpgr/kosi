# Kosi

[![Build Status](https://travis-ci.org/tbpgr/kosi.png?branch=master)](https://travis-ci.org/tbpgr/kosi)
[![Code Climate](https://codeclimate.com/github/tbpgr/kosi.png)](https://codeclimate.com/github/tbpgr/kosi)

ターミナルアプリケーション用表フォーマットサポートツール。格子。

## Installation

Add this line to your application's Gemfile:

    gem 'kosi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kosi

## Description
2次元配列をテーブルフォーマットにして出力します。  
terminal-table gemの日本語対応版にあたります。  
（terminal-tableはASCII対応のみなので全角文字が混ざるとテーブルレイアウトが崩れる）  

具体的には  

* Unicode 1-127 => ASCII。1文字分として計算
* Unicode 65377(0xff61)..65439(0xff9f) => 半角カナ。1文字分として計算
* その他 => 全角として扱う。2文字分として計算

## Options
### Align
配置指定。右寄せ、左寄せ、中央を選択可能。  

| 設定可能パラメータ | 説明 |
|:-----------|:-----------|
|Kosi::Align::TYPE::RIGHT|右寄せ|
|Kosi::Align::TYPE::LEFT|左寄せ。デフォルト|
|Kosi::Align::TYPE::CENTER|中央|

### ConnectorChar
表の結合部に表示するテキスト。1文字で指定。  
下記で言うところの 「+」がConnectorChar。  

~~~
+-----+------+-------+
|a    |b     |c      |
+-----+------+-------+
~~~

### Header
表のヘッダー。配列で指定。  
デフォルトはヘッダーなし。  

### HorizontalBorderChar
水平線を1文字で設定。  
デフォルトは「-」  

### SeparateEachRow
各行に区切り線を入れるかどうか。  
デフォルトは「false」  

### VerticalBorderChar
垂直線を1文字で設定。  
デフォルトは「|」  

## Usage
### オプション指定なし  
~~~ruby
require 'kosi'

kosi = Kosi::Table.new
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
~~~

出力  
※GitHubの表示上ずれているかもしれませんが、等幅フォント利用時にそろいます。

~~~
+-----+------+-------+
|a    |b     |c      |
|ほｹﾞ1|ひｹﾞ22|へｹﾞ333|
+-----+------+-------+
~~~

### Align指定
~~~ruby
require 'kosi'

kosi = Kosi::Table.new({align: Kosi::Align::TYPE::CENTER})
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
kosi = Kosi::Table.new({align: Kosi::Align::TYPE::RIGHT})
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
kosi = Kosi::Table.new({align: Kosi::Align::TYPE::LEFT})
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
~~~

出力  

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

### ConnectorChar指定
~~~ruby
require 'kosi'

kosi = Kosi::Table.new
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
kosi = Kosi::Table.new({connector_char: 'x'})
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
kosi = Kosi::Table.new({connector_char: '$'})
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
~~~

出力  

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


### Header指定
~~~ruby
require 'kosi'

kosi = Kosi::Table.new
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
kosi = Kosi::Table.new({header: %w{column1 column2 column3}})
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
~~~


出力  

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

### HorizontalBorderChar指定
~~~ruby
require 'kosi'

kosi = Kosi::Table.new
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
kosi = Kosi::Table.new({horizontal_border_char: '*'})
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
~~~

出力  

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

### SeparateEachRow指定
~~~ruby
require 'kosi'

kosi = Kosi::Table.new
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333'], [*'a'..'c']])
kosi = Kosi::Table.new({separate_each_row: true})
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333'], [*'a'..'c']])
~~~

出力  

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

### VerticalBorderChar指定
~~~ruby
require 'kosi'

kosi = Kosi::Table.new
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
kosi = Kosi::Table.new({vertical_border_char: '#'})
print kosi.render([[*'a'..'c'], ['ほｹﾞ1', 'ひｹﾞ22', 'へｹﾞ333']])
~~~

出力  

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

### 複合オプション
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

出力  

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

## History

version 0.0.1 : first release

## Contributing

1. Fork it ( https://github.com/tbpgr/kosi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
