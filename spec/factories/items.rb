FactoryBot.define do
  factory :item do
    name          { 'test' }
    text          { 'test_text' }
    category_id   { '2' }
    condition_id  { '2' }
    charge_id     { '2' }
    prefecture_id { '2' }
    delivery_id   { '2' }
    price         { '1000' }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
