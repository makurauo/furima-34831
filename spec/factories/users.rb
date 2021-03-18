FactoryBot.define do
  factory :user do
    nick_name              {'test'}
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password(min_length: 6)}
    password_confirmation  {password}
    last_name              {'test'}
    first_name             {'test'}
    last_name_kana         {'テスト'}
    first_name_kana        {'テスト'}
    birthday               {'0000-00-00'}
  end
end