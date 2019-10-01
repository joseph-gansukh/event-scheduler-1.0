class User < ApplicationRecord
  has_many :user_events
  has_many :events, through: :user_events

  has_secure_password
  
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
end
