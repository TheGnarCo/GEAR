class User < ApplicationRecord
  devise :registerable, :omniauthable, omniauth_providers: [:google_oauth2]
  validates :email, presence: true

  def self.from_omniauth(access_token)
    data = access_token.info
    email = data["email"]

    User.where(email:).first_or_create(
      uid: access_token["uid"],
      provider: access_token["provider"],
      email:,
    )
  end
end
