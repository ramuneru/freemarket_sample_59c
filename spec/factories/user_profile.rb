FactoryBot.define do
  factory :user_profile do
    nickname {"yuichi"}
    family_name {"山田"}
    last_name {"潤"}
    family_name_kana {"ヤマダ"}
    last_name_kana {"ジュン"}
    birth_year {2019}
    birth_month {4}
    birth_day {5}
  end
end
