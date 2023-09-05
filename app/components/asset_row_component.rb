class AssetRowComponent < ViewComponent::Base
  attr_reader :asset, :user

  delegate :asset_type, :model_number, :serial_number, :approximate_purchase_date, to: :asset

  def initialize(asset, user)
    super
    @user = user
    @asset = asset
  end

  def edit_asset_path
    return edit_gnar_user_asset_path(user, asset) if user.present?

    edit_gnar_asset_path(asset)
  end

  def retire_asset_path
    return gnar_user_asset_path(user, asset) if user.present?

    gnar_asset_path(asset)
  end

  def email
    asset.user.email
  end
end
