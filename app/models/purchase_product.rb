class PurchaseProduct < ApplicationRecord
  validates_presence_of :quantity, :sale_price
  belongs_to :purchase
  belongs_to :product

  def subtotal
    product.price * quantity
  end
end
