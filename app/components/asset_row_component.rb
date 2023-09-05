class AssetRowComponent < ViewComponent::Base
  attr_reader :employee_asset, :user

  delegate :asset_type, :model_number, :serial_number, :approximate_purchase_date,
    to: :employee_asset

  def initialize(employee_asset, user)
    super
    @user = user
    @employee_asset = employee_asset
  end

  def edit_asset_path
    return edit_gnar_user_employee_asset_path(user, employee_asset) if user.present?

    edit_gnar_employee_asset_path(employee_asset)
  end

  def retire_asset_path
    return gnar_user_employee_asset_path(user, employee_asset) if user.present?

    gnar_employee_asset_path(employee_asset)
  end

  def email
    employee_asset.user.email
  end
end
