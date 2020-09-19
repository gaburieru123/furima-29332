class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :detail_status
  belongs_to_active_hash :delivery_price
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_day

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price, format: { with: /\A[3-9][0-9]{,2} | [9]{[0-9]{,6}\z/, message: '半角数字を入力してください'}

  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :detail_status_id
    validates :delivery_price
    validates :delivery_area_id
    validates :delivery_day_id
  end
end
