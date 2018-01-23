class MeetupSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :day, :time, :group_id

  belongs_to :group
  has_many :meetup_tags

  has_many :tags, through: :meetup_tags
end
