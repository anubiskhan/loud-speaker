class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.string :lat
      t.string :lng
      t.string :zoom
      t.text :static_url
      t.timestamps
    end
  end
end
