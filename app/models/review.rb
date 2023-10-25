class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  def self.ransackable_attributes(_auth_object = nil)
    %w[content created_at id restaurant_id updated_at user_id]
  end
end
