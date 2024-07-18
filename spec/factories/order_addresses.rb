FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture { 1 }
    city { '東京都 ' }
    house_number { '1-1' }
    phone_number { '01234567890'}
  end
end
