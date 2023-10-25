class Order < ApplicationRecord
  paginates_per 5

  belongs_to :user
  belongs_to :restaurant
  has_many :order_items
  has_many :foods, through: :order_items

  enum :order_status, %i[pending accepted rejected], default: :pending

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id order_status restaurant_id total_amount updated_at user_id]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[foods order_items restaurant user]
  end
end
