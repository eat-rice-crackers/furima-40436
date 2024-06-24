FactoryBot.define do
  factory :item do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test_image.png'), 'image/png') }
    items_name              { Faker::Lorem.characters(number: 40) }
    items_description       { Faker::Lorem.characters(number: 1000) }
    category_info_id         { 2 }
    items_condition_id       { 3 }
    shipping_fee_burden_id   { 2 }
    prefecture_id            { 15 }
    shipping_day_id          { 2 }
    price                    { 5000 }
    association :user
  end
end
