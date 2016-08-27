class EventGroup < ApplicationRecord
  acts_as_paranoid

  validates :name, :description, :location, :status,
            :start_time, :end_time, presence: true

  enum status: [:draft, :published]
end
