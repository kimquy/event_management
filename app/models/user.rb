class User < ApplicationRecord
  validates :name, :email, presence: true

  has_many :events, class_name: 'EventGroup'
end
