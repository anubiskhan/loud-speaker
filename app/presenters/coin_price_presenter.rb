class CoinPricePresenter
  def initialize
    service = CoinPriceService.new
    @body = service.body
  end

  def ripple_price
    @body[:data][:'52'][:quotes][:USD][:price]
  end

  def bitcoin_price
    @body[:data][:'1'][:quotes][:USD][:price]
  end

  def stellar_price
    @body[:data][:'512'][:quotes][:USD][:price]
  end

  def ethereum_price
    @body[:data][:'1027'][:quotes][:USD][:price]
  end

end
