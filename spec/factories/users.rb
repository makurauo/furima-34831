FactoryBot.define do
  factory :user do
    nick_name              {'test'}
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password(min_length: 6)}
    password_confirmation  {password}
    last_name              {'長谷川'}
    first_name             {'白紙'}
    last_name_kana         {'ハセガワ'}
    first_name_kana        {'ハクシ'}
    birthday               {'2000-10-01'}
  end
end