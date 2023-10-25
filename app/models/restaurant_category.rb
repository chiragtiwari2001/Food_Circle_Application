class RestaurantCategory < ApplicationRecord
  belongs_to :restaurant
  belongs_to :category

  def self.ransackable_attributes(_auth_object = nil)
    %w[category_id created_at id restaurant_id updated_at]
  end
end
