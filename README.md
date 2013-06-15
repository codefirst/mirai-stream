# 未来ストリーム

未来ストリームは、まだ自分が撮ったことのない未来の写真を表示するデジタルフォトフレームアプリです。

* 行きたい場所
* 食べたいもの
* 会ってみたい人
などのキーワードを登録しておくことで、自分が興味のある写真を表示することができます。

老後の自分は今よりもっとインドアになってしまいそうなので、外出するきっかけを作るためのサービスを目指して開発しました。

未来ストリームはクックパッドの [クックパッド主催 第4回 開発コンテスト24](http://info.cookpad.com/24contest4) 応募作品です。

## 動作環境

* Ruby 2.0 以降
* Bundler 1.3.5 以降
* SQLite 3 以降

## インストール

以下のコマンドを実行してください。

    $ bundle install --path vendor/bundle
    $ bundle exec rake db:migrate

それから以下のコマンドで実行してください。

    $ export FLICKR_APP_KEY=[Input your Flickr Application ID]
    $ export FLICKR_SECRET=[Input your Flickr Secret Key]
    $ bundle exec rails s

## ライセンス

The MIT License

Copyright (c) 2013 codefirst.org

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
