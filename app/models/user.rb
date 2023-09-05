class User < ApplicationRecord
  devise :registerable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :employee_assets, dependent: :nullify

  validates :email, presence: true, uniqueness: true

  def self.from_omniauth(access_token)
    data = access_token.info
    email = data["email"]

    User.where(email:).first_or_create(
      uid: access_token["uid"],
      provider: access_token["provider"],
      email:,
    )
  end

  def name
    if first_name.present?
      "#{first_name} #{last_name}"
    else
      email
    end
  end
end
