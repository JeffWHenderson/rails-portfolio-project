class Meetup < ApplicationRecord
  belongs_to :group
  has_many :meetup_tags
  has_many :tags, through: :meetup_tags

  def tags_attributes=(tags_hashes)
    #raise tags_hashes.inspect
    #{"0"=>{"name"=>"Spooky"}}
    tags_hashes.each do |i, tags_attributes|
      if tags_attributes[:name].present?
        tag = Tag.find_or_create_by(name: tags_attributes[:name])
        if !self.tags.include?(tag)
          self.meetup_tags.build(:tag => tag)
        end
      end
    end
  end
end
