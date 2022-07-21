FactoryBot.define do
  factory :asset do
    approximate_purchase_date { "2022-07-21" }
    asset_type { "laptop" }
    description { "MyTextDescription" }
    mac_address { "00:25:96:FF:FE:12:34:56" }
    model_number { "89734696" }
    phone_number { "555-555-5555" }
    serial_number { "453h459-kj4h5-7835ae" }
    user
  end
end
