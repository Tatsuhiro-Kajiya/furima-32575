class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :lot_number, :building_number, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :lot_number
    validates :phone_number, numericality: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width numbers." }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, lot_number: lot_number, building_number: building_number, phone_number: phone_number, order_id: order.id)
  end
end