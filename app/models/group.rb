class Group < ApplicationRecord
  has_many :meetups
  has_many :user_groups
  has_many :users, through: :user_groups

  validates :name, presence: true
  validates :description, length: { maximum: 150,
    too_long: "%{count} characters is the maximum allowed" }
end
