class RestaurantFood < ApplicationRecord
  belongs_to :restaurant
  belongs_to :food

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at food_id id price restaurant_id updated_at]
  end
end
