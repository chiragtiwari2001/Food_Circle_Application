class Restaurant < ApplicationRecord
  has_many :reviews
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :restaurant_name, presence: true
  validates :restaurant_address, presence: true
  validates :restaurant_contact, presence: true, 
            length: {maximum:10, minimum:10}
  validates :restaurant_email, presence: true, 
            format: { with: VALID_EMAIL_REGEX }, uniqueness: true
end
