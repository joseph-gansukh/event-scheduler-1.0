class Event < ApplicationRecord
    validates :name, presence: true
    validates :date, presence: true
    validates :time, presence: true
    validates :location, presence: true

    validate :date_is_in_the_future
    
    has_many :user_events
    has_many :users, through: :user_events

    def datetime 
        DateTime.new(self.date.year, self.date.month, self.date.day, self.time.hour + 5, self.time.min, self.time.sec).new_offset("-05:00")
    end

    def date_is_in_the_future
        
        if date && time
            if self.datetime < DateTime.now
                if self.date < DateTime.now.to_date
                    errors.add(:date ,"cant be in the past")
                elsif self.time  < Time.now
                    errors.add(:time, "has already passed")
                end
            end
        end
    end
end
