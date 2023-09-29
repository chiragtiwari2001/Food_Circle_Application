class CreateRestaurantCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurant_categories do |t|
      t.belongs_to :restaurant
      t.belongs_to :category

      t.timestamps
    end
  end
end
