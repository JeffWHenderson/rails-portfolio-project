class Meetup < ApplicationRecord
  belongs_to :group
  has_many :meetup_tags
  has_many :tags, through: :meetup_tags

  def tags_attributes=(tags_hashes)
    raise tags_hashes.inspect
  end
end
