class AddNullFalseToAssetType < ActiveRecord::Migration[7.0]
  def change
    change_column_null :assets, :asset_type, false
  end
end
