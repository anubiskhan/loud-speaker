class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
  end

  def add_product(id)
    if contents.empty? || contents[id.to_s].nil?
      contents[id.to_s] = 1
    else
      contents[id.to_s] += 1
    end
  end

  def total_price
    contents.map do |product_id, quantity|
      Product.find(product_id).price * quantity
    end.sum
  end
end
