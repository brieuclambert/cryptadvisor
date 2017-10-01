# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'net/http'
require 'JSON'
require 'csv'
require 'Date'

# symbols = ["ETH", "BTC", "LTC", "DASH", "REP", "XMR"]
# if Value.first
#   now = DateTime.now.to_time.to_i
#   last = Value.last.time.to_time.to_i
#   limit = (now - last).fdiv(3600).floor
# else
#   limit = 2000
# end

# symbols.each do |symbol|
#   uri = URI("https://min-api.cryptocompare.com/data/histohour?fsym=#{symbol}&tsym=EUR&limit=#{limit}&aggregate=1&e=Kraken")
#   req = Net::HTTP::Get.new(uri)
#   http = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true)
#   resp = http.request(req)
#   response = JSON.parse(resp.body)

#   results = response["Data"]

#   results.each do |result|

#     @value = Value.new
#     @value.currency = symbol
#     @value.time = DateTime.strptime(result["time"].to_s,'%s')
#     @value.close = result["close"]
#     @value.high = result["high"]
#     @value.low = result["low"]
#     @value.open = result["open"]
#     @value.volumeto = result["volumeto"]
#     @value.volumefrom = result["volumefrom"]

#     @value.save
#   end

# end


uri = URI("https://api.liqui.io/api/3/ticker/eth_usd")
req = Net::HTTP::Get.new(uri)
http = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true)
resp = http.request(req)
response = JSON.parse(resp.body)
p response







