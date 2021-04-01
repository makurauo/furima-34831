FactoryBot.define do
  factory :purchase_address do
    postcode      { '111-1111' }
    prefecture_id { 2 }
    city          { '某市' }
    block         { '某区1-1' }
    building      { '某荘' }
    phone_number  { '1234567890' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
