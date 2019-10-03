FactoryBot.define do
  factory :user do
    #passward = Faker::Internet.password(8)
    phone                 {"09066666666"}
    email                 { Faker::Internet.free_email }
    password              {"0000000"}
    password_confirmation {"0000001"}
  end
end
