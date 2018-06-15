require 'rails_helper'

describe Map do
  describe 'attributes' do
    it { should validate_presence_of(:lat) }
    it { should validate_presence_of(:lng) }
    it { should validate_presence_of(:zoom) }
  end
  describe 'methods' do
    it 'create_static' do
      map = Map.new
      map.create_static(1,1,5)

      expected = "http://maps.googleapis.com/maps/api/staticmap?&center=1,1&zoom=5&size=750x450&key=AIzaSyCJwmkCQw56cvtU03ftjoN1SpzL1VmTov4&style=feature:administrative|element:all|saturation:-100&style=feature:administrative.province|element:all|visibility:off&style=feature:landscape|element:all|saturation:-100|lightness:65|visibility:on&style=feature:poi|element:all|visibility:off&style=feature:road|element:all|saturation:-100&style=feature:road.highway|element:all|visibility:simplified&style=feature:road.arterial|element:all|lightness:30&style=feature:road.local|element:all|lightness:40&style=feature:transit|element:all|saturation:-100|visibility:simplified&style=feature:water|element:geometry|hue:0xffff00|lightness:-25|saturation:-97&style=feature:water|element:labels|lightness:-25|saturation:-100"

      expect(map.static_url).to eq(expected)
    end
  end
end
