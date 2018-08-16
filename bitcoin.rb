## 現在のビットコインの価格を取得するプログラム
# ライブラリの呼び出し
require 'net/http'
require 'uri'
require 'json'
# 現在売りに出されているもの、買いに出されているbitcoinを取得する
uri = URI.parse("https://api.bitflyer.jp")
# エンドポントの取得(ここにアクセスすれば色んなデータを取得できる)
uri.path = '/v1/getboard'
# どの情報の取引を取得するか？を指定
uri.query = ''
# http通信の設定
https = Net::HTTP.new(uri.host, uri.port)
https.use_ssl = true
response = https.get uri.request_uri
# 取得した情報をJsonからhashへ変換
response_hash = JSON.parse(response.body)
# valueの取得
puts response_hash["mid_price"]
