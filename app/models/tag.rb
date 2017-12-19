class Tag < ApplicationRecord
  has_many :meetup_tags
  has_many :meetups, through: :meetup_tags
end
