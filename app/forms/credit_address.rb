class CreditAddress
  include ActiveModel::Model
  attr_accessor :token, :post_code, :delivery_area_id, :city, :house_number, :building_name, :phone_number, :item_purchase_id, :user_id, :item_id

  # クレジットカードのバリデーション
  validates :token, presence: true
  # クレジットカードのバリデーション

  # orderモデルから切り取ったバリデーション
  with_options presence: true do
    # 郵便番号に関するバリデーション
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :delivery_area_id
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end
  validates :delivery_area_id, numericality: { other_than: 1 }
  # orderモデルから切り取ったバリデーション

  def save
    item_purchase = ItemPurchase.create!(user_id: user_id, item_id: item_id)
    # 注文の情報を保存
    Order.create!(post_code: post_code, delivery_area_id: delivery_area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, item_purchase_id: item_purchase.id)
  end
end
