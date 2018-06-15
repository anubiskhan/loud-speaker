require 'rails_helper'

describe Product do
  describe 'attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
  end
  describe 'relationships' do
    it { should have_many(:product_orders) }
    it { should have_many(:orders).through(:product_orders) }
  end
end
