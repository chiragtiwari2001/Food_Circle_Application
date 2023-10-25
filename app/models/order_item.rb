class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :food

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at food_id id order_id quantity updated_at]
  end
end
