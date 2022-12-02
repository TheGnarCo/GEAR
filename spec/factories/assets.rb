FactoryBot.define do
  factory :asset, class: "Gnar::Asset" do
    approximate_purchase_date { Date.new(2022, 7, 21) }
    asset_type { "laptop" }
    mac_address { Faker::Internet.unique.mac_address }
    model_number { Faker::Alphanumeric.alphanumeric(number: 10) }
    serial_number { Faker::Device.unique.serial }
    user
  end
end
