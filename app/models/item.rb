class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :items_name, presence: true, length:{maximum: 40}
  validates :items_description, presence: true, length:{maximum: 1000}
  validates :category_info_id, numericality: { greater_than_or_equal_to: 1}
  validates :items_condition_id, numericality: { greater_than_or_equal_to: 1}
  validates :shipping_fee_burden_id, presence: true, numericality: { greater_than_or_equal_to: 1}
  validates :prefecture_id, numericality: { greater_than_or_equal_to: 1}
  validates :shipping_day_id, numericality: { greater_than_or_equal_to: 1}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to:9999999},format: { with:  /\A\d+\z/}
  validates :user, presence: true

  validate :image_presence

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
