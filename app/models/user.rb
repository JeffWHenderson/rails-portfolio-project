class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :user_groups
  has_many :groups, through: :user_groups

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  devise :omniauthable, omniauth_providers: %i[facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
#     This is what facebook sends
# <OmniAuth::AuthHash credentials=#
# <OmniAuth::AuthHash expires=true expires_at=1517694882
#  token="EAACZAVMLDOHkBAGLOiU1RezC0LghQtoMsg54yNNA19R2BuJns8ag8LZBIj73mwDH1mfx7F57NadVd8jRmDInS9IOTWcZBzBaacedHkQy7fXdFOa3NcygitZBSkwYpNROM4C3TrgYRnN5p66dwoKnNU2C3Q7R77aNnywsZBwZByNwZDZD"> extra=#<OmniAuth::AuthHash raw_info=#<OmniAuth::AuthHash
# email="jhende34@myvu.vinu.edu" id="10155920593441031" name="Jeffrey Henderson">> info=#<
# OmniAuth::AuthHash::InfoHash
# email="jhende34@myvu.vinu.edu" image="http://graph.facebook.com/v2.6/10155920593441031/picture" name="Jeffrey Henderson"> provider="facebook" uid="10155920593441031">
