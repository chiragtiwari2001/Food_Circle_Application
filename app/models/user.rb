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

  def self.ransackable_attributes(_auth_object = nil)
    %w[address confirmation_sent_at confirmation_token confirmed_at created_at email encrypted_password id
       remember_created_at reset_password_sent_at reset_password_token unconfirmed_email updated_at username]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[cart orders reviews roles]
  end

  private

  def assign_default_role
    add_role(:member) if roles.blank?
  end
end
