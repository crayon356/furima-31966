FactoryBot.define do
  factory :user do
    nickname              {'abe'}
    email                 {'kkk@gmail.com'}
    password              {'000aaa'}
    password_confirmation {password}
    family_name           {'さとう'}
    first_name            {'たろう'}
    family_name_kana      {'サトウ'}
    first_name_kana       {'タロウ'}
    birthday              {'2000-01-01'}
  end
end