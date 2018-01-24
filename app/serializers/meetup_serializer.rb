class MeetupSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :day, :time
  belongs_to :group
  has_many :tags, through: :meetup_tags

end
