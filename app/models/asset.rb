class Asset < ApplicationRecord
  belongs_to :user

  enum asset_type: {
    laptop: "laptop",
    display: "display",
    keyboard: "keyboard",
    mouse: "mouse",
    power_supply: "power supply",
    desk: "desk",
    chair: "chair",
  }

  validates :model_number, presence: true
  validates :serial_number, presence: true
  validates :approximate_purchase_date, presence: true
end
