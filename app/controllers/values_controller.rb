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

    def self.kraken
      client = KrakenClient.load
      time = client.public.server_time
      p time
    end
  end

end
