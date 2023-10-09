class Food < ApplicationRecord
  belongs_to :category
  has_many :restaurant_foods
  has_many :restaurants, through: :restaurant_foods
end
