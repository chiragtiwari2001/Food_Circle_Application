class Restaurant < ApplicationRecord
  paginates_per 4

  has_many :reviews
  has_many :restaurant_categories
  has_many :categories, through: :restaurant_categories
  has_many :restaurant_foods
  has_many :foods, through: :restaurant_foods
  has_many :orders

  has_one_attached :restaurant_image

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :restaurant_name, presence: true
  validates :restaurant_address, presence: true
  validates :restaurant_contact, presence: true,
                                 length: { maximum: 10, minimum: 10 }
  validates :restaurant_email, presence: true,
                               format: { with: VALID_EMAIL_REGEX }, uniqueness: true
end
