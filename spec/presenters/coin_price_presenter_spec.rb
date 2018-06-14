require 'rails_helper'

describe CoinPricePresenter do
  describe 'handles the api return from CoinMarketCap' do
    it 'returns only the information desired' do
      presenter = CoinPricePresenter.new

      expect(presenter.ethereum_price).to be_instance_of(Float)
      expect(presenter.ripple_price).to be_instance_of(Float)
      expect(presenter.bitcoin_price).to be_instance_of(Float)
      expect(presenter.stellar_price).to be_instance_of(Float)
    end
  end
end
