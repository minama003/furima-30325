class AddressBuy
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :phone_number, format: { with: /\A[0-9]{11}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :house_number
    validates :city
    validates :user_id
    validates :item_id
  end

  validates :token, presence: true

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                           building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end
