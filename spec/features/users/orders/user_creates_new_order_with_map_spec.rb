require 'rails_helper'

describe 'User' do
  describe 'on new order' do
    xit 'shows no map if they have not selected one' do
      visit new_order_path

      expect(page).to have_content("You've got to pick a map first!")
    end
    xit 'sees a static map of the map they want' do
      visit new_map_path

      fill_in 'address', with: 'spokane'

      click_on 'Encode'
      sleep 2
      click_on 'Use This Map'
      sleep 2
      expected_url = "http://maps.googleapis.com/maps/api/staticmap?&center=39.7392,-104.99029999999999&zoom=14&size=750x450&key=AIzaSyCJwmkCQw56cvtU03ftjoN1SpzL1VmTov4&style=feature:administrative|element:all|saturation:-100&style=feature:administrative.province|element:all|visibility:off&style=feature:landscape|element:all|saturation:-100|lightness:65|visibility:on&style=feature:poi|element:all|visibility:off&style=feature:road|element:all|saturation:-100&style=feature:road.highway|element:all|visibility:simplified&style=feature:road.arterial|element:all|lightness:30&style=feature:road.local|element:all|lightness:40&style=feature:transit|element:all|saturation:-100|visibility:simplified&style=feature:water|element:geometry|hue:0xffff00|lightness:-25|saturation:-97&style=feature:water|element:labels|lightness:-25|saturation:-100"

      expect(page.find('.map-image')['src']).to have_content(expected_url)
    end
  end
end
