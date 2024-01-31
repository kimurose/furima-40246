class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :street_address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :street_address
    validates :phone_number
    #validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, street_address: street_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end