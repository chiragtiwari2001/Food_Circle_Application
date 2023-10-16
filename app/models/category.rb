class Category < ApplicationRecord
  has_many :restaurant_categories, dependent: :destroy
  has_many :restaurants, through: :restaurant_categories
  has_many :foods, dependent: :destroy

  has_one_attached :category_image

  validates :category_name, presence: true
end
