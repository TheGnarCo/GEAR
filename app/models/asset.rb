class Asset < ApplicationRecord
  belongs_to :user

  enum asset_type: {
    laptop: 0,
    display: 1,
    keyboard: 2,
    mouse: 3,
    power_supply: 4,
    desk: 5,
    chair: 6,
  }

  validates :user_id, presence: true
  validates :model_number, presence: true
  validates :serial_number, presence: true
  validates :approximate_purchase_date, presence: true
  validates :phone_number, presence: true
end
