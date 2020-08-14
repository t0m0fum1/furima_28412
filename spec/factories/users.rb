FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    gimei = Gimei.name
    firstname {gimei.first.kanji}
    lastname {gimei.last.kanji}
    firstname_furigana {gimei.first.katakana}
    lastname_furigana {gimei.last.katakana}
    birthday {Faker::Date.in_date_period}
  end
end