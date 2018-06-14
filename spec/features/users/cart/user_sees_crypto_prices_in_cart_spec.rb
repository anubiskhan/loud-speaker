require 'rails_helper'

describe 'User' do
  describe 'while looking at cart' do
    it 'sees crypto prices' do
      visit cart_path

      expect(page).to have_content('XRP price: ')
      expect(page).to have_content('BTC price: ')
      expect(page).to have_content('XLM price: ')
      expect(page).to have_content('ETH price: ')
    end
  end
end
