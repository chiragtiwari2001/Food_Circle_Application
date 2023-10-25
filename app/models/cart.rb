class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :cart_items
  has_many :foods, through: :cart_items

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id restaurant_id updated_at user_id]
  end
end
