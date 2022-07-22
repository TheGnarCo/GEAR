FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email(domain: "gnar.dog") }
    sequence(:uid)
    provider { "gnar.dog" }
  end
end
