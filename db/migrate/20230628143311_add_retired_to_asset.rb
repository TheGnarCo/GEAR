class AddRetiredToAsset < ActiveRecord::Migration[7.0]
  def change
    add_column :assets, :retired, :boolean, default: false, null: false
  end
end
