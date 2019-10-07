FactoryBot.define do
  factory :sns_credential do
    uid { "2222222222" }
    provider { "facebook" }
    user_id { 1 }
  end
end
