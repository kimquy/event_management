class EventGroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status, :location, :start_time, :end_time

  belongs_to :user
end
