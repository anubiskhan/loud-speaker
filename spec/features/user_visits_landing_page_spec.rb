require 'rails_helper'

describe 'User' do
  describe 'visits landing page' do
    it 'sees a nav bar' do
      visit '/'

      expect(page).to have_css('.navbar')
    end
    xit 'sees an image carousel and link to create a map' do
      visit '/'

      expect(page).to have_content('Custom Laser Cut Maps!')
      expect(page).to have_css('#myCarousel')

      click_on 'Make it your own!'

      expect(current_path).to eq("#{new_map_path}")
    end
  end
end
