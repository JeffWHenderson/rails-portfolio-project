class MeetupSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :day, :time, :group_id

  # belongs_to :group_meetup      #this is the kind pf belongs_to has many relationship they want/
  # has_many :tags
  # look for maybe an includes_nested_attributes true ?????????
end
