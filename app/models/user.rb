class User < ApplicationRecord
  has_many :user_groups
  has_many :groups, through: :user_groups
  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: true
  #validates :email, confirmation: true
  validates :password, length: { minimum: 7,  too_long: "%{count} characters is the minimum allowed" }
  #validates :password, length: { maximum: 16 }

  def self.chop_email(user_id)
    self.find(user_id).email.scan(/(^\w+)/)[0].first
  end
end


#     This is what facebook sends
#raw_info=#<OmniAuth::AuthHash
# email="jhende34@myvu.vinu.edu" id="10155920593441031" name="Jeffrey Henderson">> info=#<
# OmniAuth::AuthHash::InfoHash
# email="jhende34@myvu.vinu.edu" image="http://graph.facebook.com/v2.6/10155920593441031/picture" name="Jeffrey Henderson"> provider="facebook" uid="1015592059344103">
