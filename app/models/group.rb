class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :groups
  has_many :meetups

  validates :name, presence: true
end
