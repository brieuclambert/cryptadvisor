class ValuesController < ApplicationController

  def index
    @values = Value.all
  end

  def self.count_all
    puts Value.all.count
  end

  def self.ema(step)

    Value.all.each do |value|

      val = Value.where(currency: value.currency).where("created_at < ?", value.created_at)
      .last(step.to_i * 24)
      .map(&:open)
      .reduce(0, :+)
      .fdiv(step.to_i * 24)


      value.ema_7 = val.round(4)

      value.save

    end

  end

  ############### Working ##############

  def self.kraken
    client = KrakenClient.load
    ohlc_data = client.public.ohlc(pair: 'XXBTZEUR', last: "1506792186", interval: '60')
    p ohlc_data
  end

  def self.bitfinex
    Bitfinex::Client.configure do |conf|
      conf.use_api_v2
    end

    client = Bitfinex::Client.new
    p client.candles('tETHUSD', '7D', 'hist')
  end

  def self.hitbtc
    uri = URI("http://api.hitbtc.com/api/1/public/ETHEUR/ticker")
    req = Net::HTTP::Get.new(uri)
    http = Net::HTTP.start(uri.hostname, uri.port)
    resp = http.request(req)
    response = JSON.parse(resp.body)
    p response
  end

  def self.liqui
    uri = URI("https://api.liqui.io/api/3/ticker/eth_usd")
    req = Net::HTTP::Get.new(uri)
    http = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true)
    resp = http.request(req)
    response = JSON.parse(resp.body)
    p response
  end

  def self.ok
    okcoin = Okcoin::Rest.new
    okcoin.spot_ticker(pair: "btc_usd")
  end


  ################ Not Working ################

  def self.bittrex
    market = Bittrex.new
    p market.summaries
  end

  def self.polo
    ticker = Poloniex.volume
    p ticker[1]
  end




end

#({api_key: "XRo4NQxmql0f+5cf3HKyhLDt6OgR+cdMaixlBCYyaIVtBYUzOMmqzPKT", api_secret: "bU8oD4vAOcTwMS+1MaaNIKOlxYJkN+CyWiGPjo0zX7ZwORsp4BQvTLsbWu1ef3OomgzokbQjgCwt8iTyeBahZw=="})
