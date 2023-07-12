module Gnar
  class Asset < ApplicationRecord
    belongs_to :user
    default_scope { order(:asset_type, :approximate_purchase_date) }
    after_update_commit :broadcast_updates

    scope :retired, -> { where(retired: true) }
    scope :active, -> { where(retired: false) }

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

    private

    def broadcast_updates
      Turbo::StreamsChannel.broadcast_replace_to(
        Gnar::Asset.active.first,
        target: "gnar-assets",
        partial: "gnar/assets/table",
        locals: { assets: Asset.active.all, retired_assets: Asset.retired.all },
      )
    end
  end
end
