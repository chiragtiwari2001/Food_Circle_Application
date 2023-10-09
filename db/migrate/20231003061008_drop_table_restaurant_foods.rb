class DropTableRestaurantFoods < ActiveRecord::Migration[7.0]
  def change
    drop_table :restaurant_foods
  end
end
