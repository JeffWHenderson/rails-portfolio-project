class TagSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :meetup_tags, only: []
  has_many :tags, through: :meetup_tags
end
