require 'rails_helper'

describe 'User' do
  describe 'has selected a map' do
    it 'and sees it displayed in cart' do
      product = Product.create!(
        id: 1,
        name: 'Custom Map',
        description: 'Pick the location and zoom of your own map!',
        price: 39,
      )
      map = Map.create(lat: 1, lng: 1, zoom: 2)

      cart = Cart.new({})
      allow_any_instance_of(ApplicationController).to receive(:current_map).and_return(map)
      allow_any_instance_of(ApplicationController).to receive(:set_cart).and_return(cart)
      map.create_static
      cart.add_product(product.id)

      visit cart_path

      expect(page).to have_content('Your cart contains:')
      expect(page).to have_content('Custom Map $39.00')
    end
  end
end
