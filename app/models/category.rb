class Category < ApplicationRecord
  has_many :restaurant_categories
  has_many :restaurants, through: :restaurant_categories
  has_many :foods

  has_one_attached :category_image

  validates :category_name, presence: true
  validates :category_image, presence: true
end
