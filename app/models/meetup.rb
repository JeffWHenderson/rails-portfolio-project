class Meetup < ApplicationRecord
  belongs_to :group
  has_many :meetup_tags
  has_many :tags, through: :meetup_tags
end
