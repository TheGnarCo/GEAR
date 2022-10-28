class ModifyAssetTypeEnum < ActiveRecord::Migration[7.0]
  def up
    remove_column :assets, :asset_type

    create_enum :asset_type_enum,
                ["laptop", "display", "keyboard", "mouse", "power supply", "desk", "chair"]

    add_column :assets, :asset_type, :enum, enum_type: :asset_type_enum, default: "laptop"
  end

  def down
    remove_column :assets, :asset_type

    add_column :assets, :asset_type, :string, null: false, default: "laptop"

    execute <<-SQL
      DROP TYPE asset_type_enum;
    SQL
  end
end
