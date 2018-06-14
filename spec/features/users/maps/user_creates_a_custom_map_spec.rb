require 'rails_helper'

describe 'User', js: true do
  describe 'creates a custom map' do
    it 'creates current map without saving to DB' do
      visit new_map_path

      expect(Map.all.count).to eq(0)

      click_on 'Use This Map'
      sleep 2

      expect(Map.all.count).to eq(0)
      expect(current_path).to eq(new_order_path)
    end
  end
end
