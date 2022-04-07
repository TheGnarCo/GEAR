FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    uid { "12345" }
    provider { "example.com" }
  end
end
