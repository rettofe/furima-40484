class OrderShipping
  include ActiveModel::Model

  attr_accessor :post_number, :shipping_source_id, :city, :street, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :post_number, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :shipping_source_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Enter it as follows (e.g. 09012345678)" }
    validates :user_id
    validates :item_id
  end

  validates :building, presence: false  # 建物名は任意


  def save
    return false unless valid?
    
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(order_id: order.id, post_number: post_number, shipping_source_id: shipping_source_id, city: city, street: street, building: building, phone_number: phone_number)
  end
end