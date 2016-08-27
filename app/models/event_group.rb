class EventGroup < ApplicationRecord
  acts_as_paranoid

  validates :name, :description, :location, :status,
            :start_time, :end_time, presence: true

  enum status: [:draft, :published]

  def publish
    self.status = 1
    save
  end

  def save_draft!
    self.status = 0
    save(validate: false)
  end
end
