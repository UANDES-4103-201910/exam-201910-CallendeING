class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :phone
      t.string :addressL1
      t.string :addressL2
      t.string :city
      t.string :country
      t.integer :zipCode
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
