FactoryBot.define do
  factory :order do
    post_code          {'111-1111'}
    delivery_area_id   {'3'}
    city               {'新宿'}
    house_number       {'新宿'}
    building_name      {'シンジュク'}
    phone_number       {'09012345678'}
    association :item_purchase
  end
end
