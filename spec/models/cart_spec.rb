require 'rails_helper'

describe Cart do
  describe 'Instance methods' do
    describe '#add_product' do
      it 'adds a product to cart list' do
        cart = Cart.new({})
        cart.add_product(1)

        expect(cart.contents).to eq({'1' => 1})
      end
    end
  end
end
