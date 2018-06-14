class CoinPricePresenter
  def initialize
    service = CoinPriceService.new
    @body = service.body
  end

  def ripple
    { price: @body[:data][:'52'][:quotes][:USD][:price], symbol: @body[:data][:'52'][:symbol] }
  end

  def bitcoin
    { price: @body[:data][:'1'][:quotes][:USD][:price], symbol: @body[:data][:'1'][:symbol] }
  end

  def stellar
    { price: @body[:data][:'512'][:quotes][:USD][:price], symbol: @body[:data][:'512'][:symbol] }
  end

  def ethereum
    { price: @body[:data][:'1027'][:quotes][:USD][:price], symbol: @body[:data][:'1027'][:symbol]}
  end

end
