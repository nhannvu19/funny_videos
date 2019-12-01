class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :videos, dependent: :destroy

  validates :email, presence: true
end
