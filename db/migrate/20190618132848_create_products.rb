class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :brand
      t.string :model
      t.string :variant
      t.string :price
      t.string :shortDescription
      t.string :longDescription

      t.timestamps
    end
  end
end
