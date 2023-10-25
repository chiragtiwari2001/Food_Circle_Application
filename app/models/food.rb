class Food < ApplicationRecord
  belongs_to :category
  has_many :restaurant_foods, dependent: :destroy
  has_many :restaurants, through: :restaurant_foods

  validates :food_name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

  def self.ransackable_attributes(_auth_object = nil)
    %w[category_id created_at food_name id price updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[category restaurant_foods restaurants]
  end
end
