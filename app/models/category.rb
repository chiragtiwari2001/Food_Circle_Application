class Category < ApplicationRecord
  has_many :restaurant_categories, dependent: :destroy
  has_many :restaurants, through: :restaurant_categories
  has_many :foods, dependent: :destroy

  has_one_attached :category_image

  validates :category_name, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[category_image category_name created_at id updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[category_image_attachment category_image_blob foods restaurant_categories restaurants]
  end
end
