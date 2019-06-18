class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :brand
      t.string :model
      t.string :variant
      t.string :price
      t.string :shortDescription
      t.string :pType
      t.string :longDescription
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
