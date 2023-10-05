class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :cart_items
  has_many :foods, through: :cart_items
end
