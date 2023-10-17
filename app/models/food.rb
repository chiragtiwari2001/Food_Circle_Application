class Food < ApplicationRecord
  belongs_to :category
  has_many :restaurant_foods, dependent: :destroy
  has_many :restaurants, through: :restaurant_foods

  validates :food_name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end
