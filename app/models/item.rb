class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :explanation
    validates :details_categories
    validates :details_status
    validates :delivery_price
    validates :delivery_area
    validates :delivery_days
    validates :price, format: { with: /\A[3-9][0-9]{,2} | [9]{[0-9]{,6}\z/, message: '半角数字を入力してください'}

  end

end
