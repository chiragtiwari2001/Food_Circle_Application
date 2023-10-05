class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :order_items
  has_many :foods, through: :order_items

  enum :order_status, [:pending, :accepted, :rejected], default: :pending
end
