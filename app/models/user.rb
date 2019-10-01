class User < ApplicationRecord
  has_friendship
  has_many :user_events
  has_many :events, through: :user_events

  has_secure_password
  
  validates :name, presence: true
  validates :email, presence: true, confirmation: true
  validates :email, uniqueness: true
end
