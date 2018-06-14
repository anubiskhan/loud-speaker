require 'rails_helper'

describe CoinPricePresenter do
  describe 'handles the api return from CoinMarketCap' do
    it 'returns only the information desired' do
      presenter = CoinPricePresenter.new

      expect(presenter.ripple.keys).to eq([:price, :symbol])
      expect(presenter.ripple[:symbol]).to eq('XRP')
      expect(presenter.bitcoin.keys).to eq([:price, :symbol])
      expect(presenter.stellar.keys).to eq([:price, :symbol])
      expect(presenter.ethereum.keys).to eq([:price, :symbol])
    end
  end
end
