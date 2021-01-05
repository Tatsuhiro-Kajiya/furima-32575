class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, nuil: false
      t.text :explanation, nuil: false
      t.integer :category_id, nuil: false
      t.integer :state_id, nuil: false
      t.integer :shopping_cost_id, nuil: false
      t.integer :prefecture_id, nuil: false
      t.integer :shopping_days_id, nuil: false
      t.integer :price_id, nuil: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
