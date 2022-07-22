class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.date :approximate_purchase_date, null: false
      t.string :asset_type, null: false, default: "laptop"
      t.string :mac_address
      t.string :model_number, null: false
      t.string :phone_number, null: false
      t.string :serial_number, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
