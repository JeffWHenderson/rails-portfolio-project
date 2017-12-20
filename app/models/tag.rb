class Tag < ApplicationRecord
  has_many :meetup_tags
  has_many :meetups, through: :meetup_tags

  validates :name, presence: true
end
