FactoryBot.define do
  factory :item do
    name                { Faker::Name.name }
    explanation         { Faker::Hipster.sentence }
    category_id         { '2' }
    detail_status_id    { '3' }
    delivery_price_id   { '2' }
    delivery_area_id    { '11' }
    delivery_day_id     { '2' }
    price               { 400 }
    association :user
  end
end
