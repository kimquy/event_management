class EventGroup < ApplicationRecord
  acts_as_paranoid

  validates :name, :description, :location, :status,
            :start_time, :end_time, presence: true

  validate :ensure_time_duration_is_correct

  belongs_to :user

  enum status: [:draft, :published]

  def publish
    self.status = 1
    save
  end

  def save_draft!
    self.status = 0
    save(validate: false)
  end

  private

  def ensure_time_duration_is_correct
    return unless start_time && end_time
    if start_time > end_time
      errors.add(:start_time, 'Start date should be before the end date.')
    end
  end
end
