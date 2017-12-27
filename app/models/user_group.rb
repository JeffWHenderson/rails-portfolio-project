class UserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :comment, presence: true

  def self.my_groups(user_id)
    where(user_id: user_id)
  end

  def self.group_comments(group_id)
    self.where(:group_id => group_id)
  end
end
