FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {Faker::Name.initials(number: 2)}
    first_name            {Faker::Name.initials(number: 2)}
    last_name_kana        {Faker::Name.initials(number: 2)}
    first_name_kana       {Faker::Name.initials(number: 2)}
    date                  { Faker::Date.between(from: Date.new(1930, 1, 1), to: Date.today) }
  end
end
