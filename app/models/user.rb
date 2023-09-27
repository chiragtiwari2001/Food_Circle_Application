class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
  
  validates :username, presence: true, length: {maximum: 15}
  validates :email, length: {maximum: 255}, format: {with: email_regexp}
  validates :address, presence: true

end