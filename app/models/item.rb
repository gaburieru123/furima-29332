class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  validate :image_presence

  def image_presence
    if image.attached?
      errors.add(:image, 'にはjpegまたはpngファイルを添付してください') unless image.content_type.in?(%('image/jpeg image/png'))
    else
      errors.add(:image, 'ファイルを添付してください')
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
