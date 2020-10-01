class Order < ApplicationRecord

  belongs_to :item_purchase


  # バリデーションはforms/item_purchase.rbへ移動

  
  
end
