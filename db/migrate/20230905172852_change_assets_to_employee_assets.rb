class ChangeAssetsToEmployeeAssets < ActiveRecord::Migration[7.0]
  def change
    rename_table :assets, :employee_assets
  end
end
