class EventGroup < ApplicationRecord
  validates :name, :description, :location, :status,
            :start_time, :end_time, :user, presence: true
end
