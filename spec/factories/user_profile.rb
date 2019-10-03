FactoryBot.define do
  factory :user_profile do
    nickname { Faker::Name.last_name }
    family_name {Faker::Name.last_name }
    last_name {Faker::Name.last_name }
    family_name_kana {"ヤマダ"}
    last_name_kana {"ジュン"}
    birth_year {2019}
    birth_month {4}
    birth_day {5}
  end
end
