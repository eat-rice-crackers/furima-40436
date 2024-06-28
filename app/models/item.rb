class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :category_info
  belongs_to_active_hash :items_condition
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  has_one_attached :image

  validates :items_name, presence: true, length: { maximum: 40 }
  validates :items_description, presence: true, length: { maximum: 1000 }
  validates :category_info_id, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :items_condition_id, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :shipping_fee_burden_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :prefecture_id, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :shipping_day_id, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validate :image_presence

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
