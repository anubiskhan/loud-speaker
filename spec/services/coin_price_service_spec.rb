require 'rails_helper'

describe 'Coin Price Service' do
  describe 'pings CoinMarketCaps api' do
    it 'returns a current price' do
      service = CoinPriceService.new
      body = service.body

      expect(body).to include(:data)
      expect(body[:data][:'1'][:name]).to eq('Bitcoin')
      expect(body[:data][:'1027'][:name]).to eq('Ethereum')
      expect(body[:data][:'52'][:name]).to eq('Ripple')
      expect(body[:data][:'512'][:name]).to eq('Stellar')
    end
  end
end
