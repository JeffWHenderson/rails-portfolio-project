class MeetupTagSerializer < ActiveModel::Serializer
  attributes :id, :tag_id, :meetup_id

  belongs_to :meetup
end
