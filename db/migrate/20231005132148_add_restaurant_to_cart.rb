class AddRestaurantToCart < ActiveRecord::Migration[7.0]
  def change
    add_reference :carts, :restaurant, foreign_key: true
  end
end
