class GroupSerializer < ActiveModel::Serializer
  attributes :id, :description, :name

  has_many :meetups
end
