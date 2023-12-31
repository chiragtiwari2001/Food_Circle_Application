class CreateRestaurantFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurant_foods do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true
      t.decimal :price, precision: 8, scale: 2
      t.timestamps
    end
  end
end
