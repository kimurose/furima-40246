class Item < ApplicationRecord
  validates :content, presence: true
  has_one_attached :image
end
