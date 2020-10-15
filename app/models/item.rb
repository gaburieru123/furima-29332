class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_many_attached :images
  has_one :item_purchase

  def images_presence
    if images.attached?
      errors.add(:images, 'にはjpegまたはpngファイルを添付してください') unless images.content_type.in?(%('image/jpeg image/png'))
    else
      errors.add(:images, 'ファイルを添付してください')
    end
  end

  belongs_to_active_hash :category
  belongs_to_active_hash :detail_status
  belongs_to_active_hash :delivery_price
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_day

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :detail_status_id
    validates :delivery_price_id
    validates :delivery_area_id
    validates :delivery_day_id
  end

  validates_inclusion_of :price, in: 300..9_999_999
end
