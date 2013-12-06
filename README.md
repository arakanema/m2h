# m2h

markdown to html compiler.

## feature

- page-break(改ページ)
  - '////' means page-break.('////' 4つ以上の スラッシュで改ページ指定)
- page-number(ページナンバーを表示)
- add header style each pages(ヘッダっぽいスタイル)

## Installation

Add this line to your application's Gemfile:

    gem 'm2h'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install m2h

## Usage

    $ m2h file1.md file2.markdown ...

## Plan
- generate cover (表紙の追加)
- auto compile (自動コンパイル)
