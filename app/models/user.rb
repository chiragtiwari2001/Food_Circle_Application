class User < ApplicationRecord
  rolify

  paginates_per 5

  after_create :assign_default_role

  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :reviews
  has_one :cart
  has_many :orders

  validates :username, presence: true, length: { maximum: 15 }
  validates :email, length: { maximum: 255 }, format: { with: email_regexp }
  validates :address, presence: true

  private

  def assign_default_role
    add_role(:member) if roles.blank?
  end
end
