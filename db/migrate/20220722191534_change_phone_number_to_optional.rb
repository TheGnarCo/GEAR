class ChangePhoneNumberToOptional < ActiveRecord::Migration[7.0]
  def change
    change_column_null :assets, :phone_number, true
  end
end
