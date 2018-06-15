require 'rails_helper'

describe 'User' do
  describe 'on new order' do
    xit 'shows no map if they have not selected one' do
      visit new_order_path

      expect(page).to have_content("You've got to pick a map first!")
    end
    it 'sees a static map of the map they want' do
      map = Map.create(lat: 1, lng: 1, zoom: 2)

      allow_any_instance_of(ApplicationController).to receive(:current_map).and_return(map)

      visit new_order_path

      expect(page).to have_css('.map-image')
    end
  end
end
