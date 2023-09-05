class AssetFormComponent < ViewComponent::Base
  attr_reader :asset, :user

  def initialize(asset, user)
    super
    @user = user
    @asset = asset
  end

  def title
    return "Add an Asset" if asset.new_record?

    "Edit Asset #{asset.id}"
  end

  def url
    if user.present?
      return gnar_user_assets_path(user) if asset.new_record?

      gnar_user_asset_path(user, asset)
    else
      return gnar_assets_path if asset.new_record?

      gnar_asset_path(asset)
    end
  end
end
