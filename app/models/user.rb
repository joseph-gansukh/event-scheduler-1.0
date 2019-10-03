class User < ApplicationRecord
  has_friendship
  has_many :user_events
  has_many :events, through: :user_events

  has_secure_password
  
  validates :name, presence: true
  validates :email, presence: true, confirmation: true
  validates :email, uniqueness: true

  def created_events
    Event.all.select {|event| event.creator_id == self.id}
  end

  def upcoming_events
    self.events.select {|event| event.datetime >= DateTime.now.new_offset(0)}
  end
end
