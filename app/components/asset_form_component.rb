class AssetFormComponent < ViewComponent::Base
  attr_reader :employee_asset, :user

  def initialize(employee_asset, user)
    super
    @user = user
    @employee_asset = employee_asset
  end

  def title
    return "Add an Asset" if employee_asset.new_record?

    "Edit Asset #{employee_asset.id}"
  end
end
