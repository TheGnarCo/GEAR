FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email(domain: "gnar.dog") }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:uid)
    provider { "gnar.dog" }
  end
end
