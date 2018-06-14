class CoinPriceService
  def initialize
    @conn = Faraday.new(
      url: "https://api.coinmarketcap.com/v2/ticker/"
    )
  end

  def response
    @conn.get
  end

  def body
    JSON.parse(response.body, symbolize_names: true)
  end
end
