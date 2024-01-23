class Item < ApplicationRecord
  validates :content, presence: true
  has_one_attached :image

  validates :item, presence: true, unless: :was_attached?
  def was_attached?
    item.image.attached?
  end
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_cost_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }
end
