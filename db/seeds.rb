# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

nick = User.first_or_create(email: "nick@gnar.dog")

case Rails.env
when "development"
  Asset.create(
    id: 1,
    approximate_purchase_date: Date.new(2022, 7, 21),
    asset_type: "laptop",
    mac_address: "00:25:96:FF:FE:12:34:56",
    model_number: "89734696",
    serial_number: "453h459-kj4h5-7835ae",
    user_id: nick.id,
  )
end
