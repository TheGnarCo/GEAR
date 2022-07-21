class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.date :approximate_purchase_date, null: false
      t.integer :asset_type, null: false, default: 0
      t.text :description
      t.string :mac_address
      t.string :model_number, null: false
      t.string :phone_number, null: false
      t.string :serial_number, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
