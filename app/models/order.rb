class Order < ApplicationRecord
  paginates_per 5

  belongs_to :user
  belongs_to :restaurant
  has_many :order_items
  has_many :foods, through: :order_items

  enum :order_status, %i[pending accepted rejected], default: :pending
end
