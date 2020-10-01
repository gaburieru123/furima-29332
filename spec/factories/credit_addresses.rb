FactoryBot.define do
  factory :credit_address do
    token              {"tok_abcdefghijk00000000000000000"}
    post_code          {'111-1111'}
    delivery_area_id   {'3'}
    city               {'新宿'}
    house_number       {'新宿'}   
    building_name      {'シンジュク'}
    phone_number       {'09012345678'}
    
  end
end
