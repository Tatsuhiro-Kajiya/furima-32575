class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, nuil: false
      t.integer :prefecture_id, nuil: false
      t.string :city, nill: false
      t.string :lot_number, nuil: false
      t.string :building_number
      t.string :phone_number, nuil: false
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
