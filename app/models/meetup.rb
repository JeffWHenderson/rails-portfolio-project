class Meetup < ApplicationRecord
  belongs_to :group
  has_many :meetup_tags
  has_many :tags, through: :meetup_tags

  validates :name, presence: true

  scope :day_of_the_week, ->(day) { where(day: day) }

  def tags_attributes=(tags_hashes)
    tags_hashes.each do |i, tags_attributes|
      if tags_attributes[:name].present?
        tag = Tag.find_or_create_by(name: tags_attributes[:name])
        if !self.tags.include?(tag)
          self.meetup_tags.build(:tag => tag)
        end
      end
    end
  end

  def self.after_3
    Meetup.where(:time => "4:15")
  end
end
