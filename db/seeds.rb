return unless Rails.env.development?

%w[
  sleepy
  happy
  grumpy
  dopey
  sneezy
  bashful
  dock
].map do |email_slug|
  email = "#{email_slug}@gnar.dog"
  User
    .where(email:)
    .first_or_create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

Gnar::Asset.first_or_create(
  approximate_purchase_date: Date.new(2022, 7, 21),
  asset_type: "laptop",
  mac_address: Faker::Internet.uniq.mac_address,
  model_number: Faker::Number.number(digits: 10),
  serial_number: Faker::Device.uniq.serial,
  user_id: User.ids.sample,
)
