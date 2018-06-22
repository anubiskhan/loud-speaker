class CreatePurchaseProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_products do |t|
      t.integer :quantity
      t.decimal :sale_price, precision: 10, scale: 2
      t.references :map, foreign_key: true
      t.references :purchase, foreign_key: true
      t.references :product, foreign_key: true
    end
  end
end
