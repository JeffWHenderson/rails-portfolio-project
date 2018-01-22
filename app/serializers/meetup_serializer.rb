class MeetupSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :day, :time, :group_id
end
