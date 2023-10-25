class Restaurant < ApplicationRecord
  paginates_per 4

  has_many :reviews, dependent: :destroy
  has_many :restaurant_categories, dependent: :destroy
  has_many :categories, through: :restaurant_categories
  has_many :restaurant_foods, dependent: :destroy
  has_many :foods, through: :restaurant_foods
  has_many :orders, dependent: :destroy

  has_one_attached :restaurant_image

  accepts_nested_attributes_for :restaurant_categories, allow_destroy: true
  accepts_nested_attributes_for :restaurant_foods, allow_destroy: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :restaurant_name, presence: true
  validates :restaurant_address, presence: true
  validates :restaurant_contact, presence: true,
                                 length: { maximum: 10, minimum: 10 }
  validates :restaurant_email, presence: true,
                               format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id restaurant_address restaurant_contact restaurant_details restaurant_email restaurant_image
       restaurant_name status updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[categories foods orders restaurant_categories restaurant_foods restaurant_image_attachment restaurant_image_blob
       reviews]
  end
end
