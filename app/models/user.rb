class User < ApplicationRecord
  rolify

  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
  
  validates :username, presence: true, length: {maximum: 15}
  validates :email, length: {maximum: 255}, format: {with: email_regexp}
  validates :address, presence: true

  private
  
  def assign_default_role
    self.add_role(:member) if self.roles.blank?
  end
  
  def set_admin(user)
    user.add_role :admin
  end
end
