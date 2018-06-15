class Product < ApplicationRecord
  validates_presence_of :name, :description, :price
  validates_uniqueness_of :name

  has_many :product_orders
  has_many :orders, through: :product_orders
end
