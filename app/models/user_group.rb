class UserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group

  def self.my_groups(user_id)
    where(user_id: user_id)
  end
end
