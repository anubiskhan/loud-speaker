class Purchase < ApplicationRecord
  validates_presence_of :user_id
  has_many :purchase_products, dependent: :destroy
  belongs_to :user

  def total_price
    purchase_products.map do |purchase_product|
      purchase_product.product.price * purchase_product.quantity
    end.sum
  end
end
