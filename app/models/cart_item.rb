class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :food

  # validates :quantity, presence: true
end
